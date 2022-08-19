cis_test_name="Enable System Integrity Protection (SIP)"

function cis_test_run() {
    st="$(csrutil status)"
    if [[ $st == *"enabled"* ]]; then
        return 0
    fi
    return 1
}