cis_test_name="Enable Terminal.app secure keyboard entry"

function cis_test_run() {
    st="$(defaults read com.apple.Terminal SecureKeyboardEntry)"
    if [[ $st == *"1"* ]]; then
        return 0
    fi
    return 1
}