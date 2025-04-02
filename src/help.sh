show_help() {
    case $1 in
    api | x25519 | tls | run | uuid | version)
        $is_core_bin help $1 ${@:2}
        ;;
    *)
        [[ $1 ]] && warn "Unknown option '$1'"
        msg "$is_core_name script $is_sh_ver by $author"
        msg "Usage: $is_core [options]... [args]... "
        msg
        help_info=(
            "Basic:"
            "   v, version                                      Display the current version"
            "   ip                                              Return the current host IP"
            "   pbk                                             Equivalent to $is_core x25519"
            "   get-port                                        Return an available port"
            "   ss2022                                          Return a password for Shadowsocks 2022\n"
            "General:"
            "   a, add [protocol] [args... | auto]              Add configuration"
            "   c, change [name] [option] [args... | auto]      Change configuration"
            "   d, del [name]                                   Delete configuration**"
            "   i, info [name]                                  View configuration"
            "   qr [name]                                       QR code information"
            "   url [name]                                      URL information"
            "   log                                             View log"
            "   logerr                                          View error log\n"
            "Change:"
            "   dp, dynamicport [name] [start | auto] [end]     Change dynamic port"
            "   full [name] [...]                               Change multiple parameters"
            "   id [name] [uuid | auto]                         Change UUID"
            "   host [name] [domain]                            Change domain"
            "   port [name] [port | auto]                       Change port"
            "   path [name] [path | auto]                       Change path"
            "   passwd [name] [password | auto]                 Change password"
            "   key [name] [Private key | auto] [Public key]    Change key"
            "   type [name] [type | auto]                       Change camouflage type"
            "   method [name] [method | auto]                   Change encryption method"
            "   sni [name] [ip | domain]                        Change serverName"
            "   seed [name] [seed | auto]                       Change mKCP seed"
            "   new [name] [...]                                Change protocol"
            "   web [name] [domain]                             Change camouflage website\n"
            "Advanced:"
            "   dns [...]                                       Set DNS"
            "   dd, ddel [name...]                              Delete multiple configurations**"
            "   fix [name]                                      Fix a configuration"
            "   fix-all                                         Fix all configurations"
            "   fix-caddyfile                                   Fix Caddyfile"
            "   fix-config.json                                 Fix config.json\n"
            "Management:"
            "   un, uninstall                                   Uninstall"
            "   u, update [core | sh | dat | caddy] [ver]       Update"
            "   U, update.sh                                    Update script"
            "   s, status                                       Running status"
            "   start, stop, restart [caddy]                    Start, stop, restart"
            "   t, test                                         Test run"
            "   reinstall                                       Reinstall script\n"
            "Testing:"
            "   client [name]                                   Show JSON for client, for reference only"
            "   debug [name]                                    Show some debug information, for reference only"
            "   gen [...]                                       Equivalent to add, but only shows JSON content, does not create files, for testing"
            "   genc [name]                                     Show part of JSON for client, for reference only"
            "   no-auto-tls [...]                               Equivalent to add, but disables automatic TLS configuration, can be used for *TLS related protocols"
            "   xapi [...]                                      Equivalent to $is_core api, but API backend uses the currently running $is_core_name service\n"
            "Others:"
            "   bbr                                             Enable BBR, if supported"
            "   bin [...]                                       Run $is_core_name command, e.g., $is_core bin help"
            "   api, x25519, tls, run, uuid  [...]              Compatible with $is_core_name commands"
            "   h, help                                         Show this help interface\n"
        )
        for v in "${help_info[@]}"; do
            msg "$v"
        done
        msg "Use del, ddel with caution, these options will delete configurations directly; no confirmation required"
        msg "Report issues) $(msg_ul https://github.com/${is_sh_repo}/issues) "
        msg "Documentation(doc) $(msg_ul https://milisp.com/$is_core/$is_core-script/)"
        ;;
    esac
}

about() {
    ####### Important: Do not only change my links #######
    unset c n m s b
    msg
    msg "Website: $(msg_ul https://milisp.com)"
    msg "Channel: $(msg_ul https://t.me/tg2333)"
    msg "Group: $(msg_ul https://t.me/tgmilisp)"
    msg "Github: $(msg_ul https://github.com/${is_sh_repo})"
    msg "Twitter: $(msg_ul https://twitter.com/aimilisp)"
    msg "$is_core_name site: $(msg_ul https://xtls.github.io)"
    msg "$is_core_name core: $(msg_ul https://github.com/${is_core_repo})"
    msg
    ####### Important: Do not only change my links #######
}
