cis_test_name="Ensure system accounts are non-login"

function cis_test_run()
{
        cmd=$(egrep -v "^\+" /etc/passwd | awk -F: '($1!="root" && $1!="sync" && $1!="shutdown" && $1!="halt" && $3<500 && $7!="/sbin/nologin" && $7!="/bin/false") {print}' |wc -l)
        if [[ $cmd -ne 0 ]]; then
                return 1
        fi
        return 0
}
