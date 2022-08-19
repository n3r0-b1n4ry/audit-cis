cis_test_name="Check Kernel Extension User Consent required"

function cis_test_run() {
    st="$(spctl kext-consent status)"
    if [[ $st == *"ENABLED"* ]]; then
        return 0
    fi
    return 1
}