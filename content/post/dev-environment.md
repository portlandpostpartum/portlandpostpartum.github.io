+++
title = "Personal Development Environment"
date = "2020-06-25"
+++

## Tools

Here's a list of things I need to to and the tools I use to do it

- Development Environment
  - Editor
    - [vim](https://www.vim.org/)
      - [Learn VIM](https://vim-adventures.com/)
  - Terminal Multiplexer
    - Let's you turn a single shell session into a bunch of shells, you can put
      them side by side, have tabs, label them, etc.
    - [tmux](https://github.com/tmux/tmux/wiki)
      - [Cheatsheet](https://gist.github.com/MohamedAlaa/2961058)
  - Testing
    - [nodemon](https://nodemon.io/)
      - This will change your life. Its a command line utility that will re-run
        a command when files with certain extentions change. You can use it to
        re-compile (if applicable) and re-test whatever your working on every
        time you save a file! This will also introduce you to a massive reward
        feedback loop like none other. Have fun.
      - `nodemon -e py --exec 'clear; python script.py; test 1'`
- Chat
  - IRC
    - [weechat](https://weechat.org/)
      - [Quickstart](https://weechat.org/files/doc/stable/weechat_quickstart.en.html)
  - Web based
    - [Gitter]()
      - Good for GitHub communities
    - [discord](https://discord.com/)
      - Has peer to peer (webrtc based) video and voice chat
- Documentation
  - Videos and Gifs
    - [Open Broadcaster Software](https://obsproject.com)
      - I use this to record my screen, it's cross platform and open source
    - [ffmpeg](https://ffmpeg.org/)
      - I use this to convert videos I've recorded into gifs to use in README's
        and documenation.
- Meetings
  - [Google Meet](https://meet.google.com)
- Email
  - [mutt](https://weechat.org/)
    - [Quickstart](https://weechat.org/files/doc/stable/weechat_quickstart.en.html)

## dotfiles

Dotfiles is a term for configuration files. The name comes from their usually
being prefixed with a `.`. This is because on UNIX operating systems, files
prefixed with a `.` are *hidden*.

Here are mine: http://github.com/pdxjohnny/dotfiles

## Reasoning

I forced myself to get used to a primarily terminal based development
environment because I constantly find myself on systems where I have either only
ssh or serial access.

Let me give you some scenarios where this might happen to you (and therefore its
nice to already be used to a terminal based workflow).

- You run Linux, your desktop crashed or froze
  - Press Ctrl-Alt-[F1 through F12] and you'll be presented with a terminal!
  - You're on a deadline (because when else would your desktop crash or freeze)
    or your not sure what will happen / you will loose if you reboot the
    machine.
  - No worries! Just `tmux attach` and you're right back where you were! Commit
    your work, push it and reboot without worry.
- The production server broke
  - You're probably only going to have `ssh` access to this thing. You going to
    want to read the logs and be able to poke around the file system with your
    editor of choice (mine is `vim`) and restart stuff to see what's wrong.
    (Chances are the server won't have `tmux`, but it might have
    [`screen`](https://linuxize.com/post/how-to-use-linux-screen/) which is
    similar so you'll be familiar with the concept).
- You started a VM from the command line using QEMU (likely with
  `-nographic -append "console=ttyS0"`) so you have a terminal into the guest
  Linux machine but it's not a full ssh session, you're likely limited to 80
  columns here. You'll be glad you stuck to 80 columns now that's all you can
  see without whacky "scrolling".

### Alt-Tab

The top reason why I do everything in the terminal though is Alt-Tab.

If you keep all your chat, email, open code repos in tabs within `tmux` then
open one browser window for all the docs, web based chats, etc. The beauty of
this is you only ever have two windows open. Which means whenever you hit
Alt-Tab you never have to guess where your going to end up! This is going to
save you insane amounts of time in the long run. Ditch the clutter. Hakuna
Matata.
