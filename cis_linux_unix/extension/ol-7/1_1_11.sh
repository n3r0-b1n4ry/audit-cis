cis_test_name="Ensure separate partition exists for /var/log"

function cis_test_run()
{
    cmd=$(mount | grep /var/log)
    if [[ "$cmd" == *"/var/log"* ]]; then
        return 0
    fi
    return 1
}

