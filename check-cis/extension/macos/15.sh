cis_test_name="Set AirDrop Discoverability to Contacts Only"

function cis_test_run() {
    st="$(defaults read com.apple.sharingd DiscoverableMode)"
    if [[ $st == 'Contacts Only' ]]; then 
        return 0
    elif [[ $st == 'Off' ]]; then 
        return 0
    else 
        return 1
    fi
}