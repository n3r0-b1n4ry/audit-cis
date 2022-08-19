cis_test_name="Disable Remote Login"

function cis_test_run() {
    st="$(sudo systemsetup -getremotelogin)"
    if [[ $st == *"Remote Login: Off"* ]]; then
        return 0
    fi
    return 1
}