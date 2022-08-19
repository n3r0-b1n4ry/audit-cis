cis_test_name="Enable Gatekeeper"

function cis_test_run() {
    if [[ $(spctl --status) == *"assessments enabled"* ]]; then
        return 0
    fi
    return 1
}