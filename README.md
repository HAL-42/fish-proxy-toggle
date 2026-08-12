# fish-proxy-toggle

A tiny [Fisher](https://github.com/jorgebucaran/fisher) plugin that provides a `proxy` function for Fish shell.

It sets or unsets local HTTP/HTTPS/SOCKS5 proxy environment variables, using `127.0.0.1:7890` by default.

## Install

```fish
fisher install HAL-42/fish-proxy-toggle
```

## Usage

Enable proxy on the default port `7890`:

```fish
proxy
```

Enable proxy on a custom port:

```fish
proxy 7897
```

Disable proxy:

```fish
proxy off
```

## Behavior

`proxy` sets:

```fish
http_proxy=http://127.0.0.1:7890
https_proxy=http://127.0.0.1:7890
all_proxy=socks5://127.0.0.1:7890
no_proxy=localhost,127.0.0.1,::1,.local,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,fc00::/7,.xiaojukeji.com,.didistatic.com,.didichuxing.com,.yunxuetang.cn
```

`proxy off` erases:

```fish
http_proxy
https_proxy
all_proxy
no_proxy
```

## Files

```text
functions/proxy.fish      # proxy function
completions/proxy.fish    # basic completions
```
