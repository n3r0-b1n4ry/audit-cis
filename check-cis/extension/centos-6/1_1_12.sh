cis_test_name="Ensure separate partition exists for /var/log/audit"

function cis_test_run()
{
    cmd=$(mount | grep /var/log/audit)
    if [[ "$cmd" == *"/var/log/audit"* ]]; then
        return 0
    fi
    return 1
}
