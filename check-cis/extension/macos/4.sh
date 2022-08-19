cis_test_name="Enable Firewall"

function cis_test_run() {
    st="$(sudo /usr/libexec/ApplicationFirewall/socketfilterfw  --getglobalstate)"
    if [[ $st == *"enabled"* ]]; then
        return 0
    fi
    return 1
}