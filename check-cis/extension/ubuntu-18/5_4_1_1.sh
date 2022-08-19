cis_test_name="Ensure password expiration is 365 days or less"

function cis_test_run()
{
    cmd=$(grep PASS_MAX_DAYS /etc/login.defs)
    if [[ "$cmd" == *"PASS_MAX_DAYS 90"* ]]; then
        return 0
    fi
    return 1
}

