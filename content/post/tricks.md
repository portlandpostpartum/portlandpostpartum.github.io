+++
date = 2020-07-07T19:00:00Z
lastmod = 2020-07-07T19:00:00Z
title = "Time Saving Tricks and Hacks"
subtitle = ""
+++

Use grep to displays blocks of text. Only display blocks with certain text
inside them.

```console
$ git grep -A 25 -E 'dffml train|dffml accuracy|dffml predict' | python -c 'import sys; print("--".join([i for i in sys.stdin.read().split("--") if not "model-directory" in i]).strip())'
```
