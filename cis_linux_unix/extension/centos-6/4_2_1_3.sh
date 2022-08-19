cis_test_name="Ensure rsyslog default file permissions configured"

function cis_test_run()
{
        EC=0
        [[ "$(grep ^\$FileCreateMode /etc/rsyslog.conf)" =~ 0[0-6][0-4]0$ ]] || EC=1
        if [[ $EC == 0 ]]; then
                return 0
        fi

        if [[ $(ls -A /etc/rsyslog.d/) ]] ; then
                [[ "$(grep ^\$FileCreateMode /etc/rsyslog.d/*.conf)" =~ 0[0-6][0-4]0$ ]] || EC=1
                if [[ $EC == 0 ]]; then
                        return 0
                fi
        fi
        return 1
}
