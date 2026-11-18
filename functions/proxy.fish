function proxy --description "Set or unset HTTP/HTTPS/SOCKS5 proxy"
    if test "$argv[1]" = off
        set -e http_proxy
        set -e https_proxy
        set -e all_proxy
        set -e no_proxy
        set -e HTTP_PROXY
        set -e HTTPS_PROXY
        set -e ALL_PROXY
        set -e NO_PROXY
        if status is-interactive
            echo "Proxy disabled"
        end
        return
    end

    set -l port 7890
    if set -q argv[1]
        set port $argv[1]
    end

    set -gx http_proxy "http://127.0.0.1:$port"
    set -gx https_proxy "http://127.0.0.1:$port"
    set -gx all_proxy "socks5://127.0.0.1:$port"
    set -gx no_proxy "localhost,127.0.0.1,::1,.local,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16,fc00::/7,.xiaojukeji.com,.didistatic.com,.didichuxing.com,.yunxuetang.cn"
    set -gx HTTP_PROXY "$http_proxy"
    set -gx HTTPS_PROXY "$https_proxy"
    set -gx ALL_PROXY "$all_proxy"
    set -gx NO_PROXY "$no_proxy"
    if status is-interactive
        echo "Proxy enabled on port $port"
    end
end
