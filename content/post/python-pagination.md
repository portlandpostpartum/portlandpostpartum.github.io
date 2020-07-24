---
title: "Python Pagination"
date: 2020-07-23T21:42:34-07:00
---

This is an example of how you might uses the `requests` HTTP Python library to
create a client that knows how to read all the pages from an HTTP API and yield
each result within a page.

We also use the `httptest` library to create a test server.

```python
import os
import sys
import math
import json
import unittest
import subprocess
import urllib.parse
from typing import NamedTuple, Optional, List

import requests
import httptest


class TestSearchPagesHTTPHandler(httptest.Handler):

    TOTAL: int = 1237
    PER_PAGE: int = 25
    RESULTS = [i for i in range(0, TOTAL)]

    def do_GET(self):
        params = dict(urllib.parse.parse_qsl(urllib.parse.urlparse(self.path).query))
        i = int(params.get("page", 1))
        self.send_response(200)
        self.send_header("Content-type", "application/json")
        self.end_headers()
        self.wfile.write(
            json.dumps(
                {
                    "queryInfo": {
                        "resultsFound": self.TOTAL,
                        "resultsPerPage": self.PER_PAGE,
                        "page": i,
                        "pageSize": self.PER_PAGE,
                        "nextPage": i + 1,
                        "lastPage": math.ceil(self.TOTAL / self.PER_PAGE),
                    },
                    "results": self.RESULTS[
                        ((i - 1) * self.PER_PAGE) : ((i - 1) * self.PER_PAGE)
                        + self.PER_PAGE
                    ],
                }
            ).encode()
        )


class ClientConfig(NamedTuple):
    url: str


class Client:
    def __init__(self, config: Optional[tuple] = None) -> None:
        self.config = config
        # Requests session
        self.session = None

    def __enter__(self):
        self.session = requests.Session()
        return self

    def __exit__(self, _exc_type, _exc_value, _traceback):
        self.session = None

    def search(self, query: str, page_size: int = 25) -> List[dict]:
        i = 0
        lastPage = None
        while lastPage is None or i <= lastPage:
            params = (
                ("sortOrder", "name_asc"),
                ("page", str(i)),
                ("pageSize", str(page_size)),
                ("searchQuery", query),
            )
            response = self.session.get(f"{self.config.url}/search", params=params)
            response.raise_for_status()
            body = response.json()
            lastPage = body["queryInfo"]["lastPage"]
            for result in body["results"]:
                yield result
            i += 1


class TestClient(unittest.TestCase):
    @httptest.Server(TestSearchPagesHTTPHandler)
    def test_search(self, ts=httptest.NoServer()):
        with Client(ClientConfig(url=ts.url())) as client:
            results = list(client.search("test"))
            self.assertEqual(len(results), TestSearchPagesHTTPHandler.TOTAL)


if __name__ == "__main__":
    unittest.main()
```
