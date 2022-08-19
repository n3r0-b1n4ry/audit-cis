cis_test_name="Require an administrator password to access system-wide preferences"

function cis_test_run() {
    st="$(security -q authorizationdb read system.preferences)"
    if [[ $st == *"false"* ]]; then
        return 0
    fi
    return 1
}