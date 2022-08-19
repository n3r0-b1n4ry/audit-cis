cis_test_name="Ensure message of the day is configured properly"

function cis_test_run()
{
    cmd=$(egrep '(\\v|\\r|\\m|\\s)' /etc/motd)
    [[ -z "${cmd}" ]] || return 1
    return 0
}
