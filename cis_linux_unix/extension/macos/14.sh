cis_test_name="Disable Safari Auto Open safe Files"

function cis_test_run() {
    st="$(defaults read com.apple.Safari AutoOpenSafeDownloads)"
    if [[ $st == *"0"* ]]; then
        return 0
    fi
    return 1
}