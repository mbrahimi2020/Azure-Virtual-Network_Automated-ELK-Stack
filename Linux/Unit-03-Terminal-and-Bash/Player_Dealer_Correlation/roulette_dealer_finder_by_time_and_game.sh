#!/Bin/Bash
cat $1_Dealer_schedule | cat $1_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep "$2" | grep "$3"
