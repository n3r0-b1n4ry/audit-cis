cis_test_name="Enable FileVault"

function cis_test_run() {
    st="$(fdesetup status)"
    if [[ $st == *"On"* ]]; then
        return 0
    fi
    return 1
}