cis_test_name="Disable built-in software from being auto-permitted to listen through firewall"

function cis_test_run() {
    st="$(sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getallowsigned|grep 'built-in')"
    if [[ $st == *"DISABLED"* ]]; then
        return 0
    fi
    return 1
}