file="/etc/issue.net"
cis_test_name="Ensure local login warning banner is configured properly"

function cis_test_run()
{
    cmd=$(grep -E -q '(\\v|\\r|\\m|\\s)' $file)
    [ -n "$cmd" ] && return 0
    return 1
}
