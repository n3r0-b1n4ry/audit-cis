cis_test_name="Disable automatic loading of remote content by Mail.app"

function cis_test_run() {
    st="$(defaults read com.apple.mail-shared DisableURLLoading)"
    if [[ $st == *"1"* ]]; then
        return 0
    fi
    return 1
}