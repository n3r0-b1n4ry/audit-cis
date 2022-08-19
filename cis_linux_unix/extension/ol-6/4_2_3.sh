cis_test_name="Ensure rsyslog or syslog-ng is installed"

function cis_test_run()
{
        cmd="$(rpm -q rsyslog | grep -E "^rsyslog-")"
        if [[ "$cmd" != "" ]]; then
                return 0
        fi
        cmd="$(rpm -q syslog-ng | grep -E "^syslog-ng-")"
        if [[ "$cmd" != "" ]]; then
                return 0
        fi
        return 1
}
