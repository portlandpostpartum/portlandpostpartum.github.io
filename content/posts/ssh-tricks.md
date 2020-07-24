+++
date = 2020-07-24T05:00:00Z
lastmod = 2020-07-24T05:00:00Z
title = "SSH Tricks"
subtitle = "Useful SSH commands"
+++

# Reverse Port Forwarding

Want to see what a port that is only listening on 127.0.0.1 on example.com is
saying?

```
ssh -nNT -L 9000:127.0.0.1:8080 user@example.com
```

Now you can go to http://localhost:9000/ and you will see it


And if you want the machine you're on to listen on 0.0.0.0 then

```
ssh -nNT -L '*:9000:127.0.0.1:8080' user@example.com
```

> The `'` here are important! Or else your shell will replace `*` with every
> file in your current directory
