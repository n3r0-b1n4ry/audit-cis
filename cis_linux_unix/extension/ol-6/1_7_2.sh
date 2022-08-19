cis_test_name="Ensure GDM login banner is configured"

function cis_test_run()
{
        rpm -q gdm | grep -Eq "package gdm is not installed"
        if [[ $? -ne 0 ]]; then
                if [[ -f /etc/dconf/profile/gdm ]]; then
                        cat /etc/dconf/profile/gdm | grep -E "user-db:user" || return $?
                        cat /etc/dconf/profile/gdm | grep -E "system-db:gdm" || return $?
                        cat /etc/dconf/profile/gdm | grep -E "file-db:/usr/share/gdm/greeter-dconf-defaults" || return $?
                        if [[ $(ls -A /etc/dconf/db/gdm.d/) ]] ; then
                                grep "banner-message-enable=true" /etc/dconf/db/gdm.d/* || return $?
                        else
                                return 1
                        fi
                else
                        return 1
                fi
        fi
}
