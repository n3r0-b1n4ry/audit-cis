cis_test_name="Set a firmware password"

function cis_test_run() {
    st="$(sudo firmwarepasswd -check)"
    if [[ $st == *"Yes"* ]]; then
        return 0
    fi
    return 1
}