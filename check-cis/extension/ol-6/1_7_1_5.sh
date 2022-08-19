cis_test_name="Ensure permissions on /etc/issue are configured"

function cis_test_run()
{
    cmd="$(stat -L -c "%a %u %g" /etc/issue)"
    if [[ "$cmd" == *"644 0 0"* ]]; then
        return 0
    fi
    return 1
}

