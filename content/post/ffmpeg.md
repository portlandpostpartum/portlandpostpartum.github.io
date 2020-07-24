+++
date = 2020-07-24T06:00:00Z
lastmod = 2020-07-24T06:00:00Z
title = "ffmpeg"
subtitle = "Video processing and editing with ffmpeg"
+++

ffmpeg is a powerful tool for command line video, audio, and image processing
(centered around images and audio as they relate to video).

Here's some things you can do with it

## Video to GIF

```console
$ ffmpeg -ss 0.3 -t 40 -i input-video.flv -vf \
  "fps=10,scale=1920:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
  -loop 0 output.gif
```

Arguments:

- `-ss` start second

- `-t` end after X seconds

- `-y` means overwrite the output file without asking

Notes:

- `scale=1920` lower this number to lower Y (I think?) resolution, lower will
  give you a smaller file size

- `fps=10` lower this number to speed up, number of frames per second, also will
  decrease size of output file
