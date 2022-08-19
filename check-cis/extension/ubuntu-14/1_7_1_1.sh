file="/etc/motd"
cis_test_name="Ensure message of the day is configured properly"

function cis_test_run()
{
    cmd=$(grep -E -q '(\\v|\\r|\\m|\\s)' $file)
    [ -n "$cmd" ] && return 0
    return 1
}
