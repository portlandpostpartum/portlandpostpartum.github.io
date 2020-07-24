+++
date = 2020-07-24T05:00:00Z
lastmod = 2020-07-24T05:00:00Z
title = "Binary Downloads"
subtitle = "Understanding which download to choose on Linux and how to install"
+++


## Choosing the right download

So you went to download a file and you were presented with a list of options
similar to the following

![list-of-binary-downloads](/images/binary-downloads.png)

You know you're on Linux. But which one of these Linux downloads is right for
you?

Run the `uname` tool to help you find out

```console
$ uname -a
x86_64
```

- `m` means tell us the hardware type

If you see `x86_64` that means you want the download that says `amd64`.

## Installing it

When you're presented with a tarball (`.tar.*`) you'll want to download it and
untar it using either your browser, `wget`, `curl` or whatever you want.

Be careful when you extract the tarball! People usually leave all the files in
the top level directory and when you extract it all the sudden you'll have files
all over the place!

I recommend creating a *temporary* directory first and changing your directory
into it. We can do this all at once with the following command

```bash
cd $(mktemp -d)
```

- `cd` is change directory

- `mktemp` is a utility for creating temporary files and directories.
  It will output the name, which we capture and use as the place we want to
  change our current working directory to using the `$(  )` operator.

  - `-d` tells it to make a directory

Here's an example of downloading Hugo which is shown in the screenshot above.

```bash
curl -LO https://github.com/gohugoio/hugo/releases/download/v0.74.3/hugo_0.74.3_Linux-64bit.tar.gz
```

- `L` means follow any redirects, you'll usually want this, especially with
  GitHub since it likes to redirect

- `O` means save the file with the same name as it has in the URL

We then extract the downloaded file

```bash
tar -xvz hugo_0.74.3_Linux-64bit.tar.gz
```

- `x` means extract

- `v` means be verbose, print all extracted files

- `z` means the file will be `.gz` compressed, and we'll need to decompress it
  using the gzip decompression algorithm. If you run into other file types,
  do a search to figure out what to replace this with.

We should have extracted 3 files.

You now want to put the binary, the command line program you want to run, in one
of the directories in the `PATH` environment variable.

You can run

```bash
echo $PATH
```

To get a `:` separated list of directories you can move the `hugo` file to so
that you'll be able to use it from anywhere.

We'll move it into the `/usr/bin` directory, a common place for executable files
to live.

```bash
mv hugo /usr/bin/
```

Now you can return to where you we're before you created the temporary directory
by running

```bash
cd -
```

We can now run hugo!

```console
$ hugo version
Hugo Static Site Generator v0.74.3-DA0437B4 linux/amd64 BuildDate: 2020-07-23T16:22:34Z
```
