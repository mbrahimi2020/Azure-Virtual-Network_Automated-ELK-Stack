#!/Bin/Bash
cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '05:00:00 AM' >> Dealers_working_during_losses;
cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '08:00:00 AM' >> Dealers_working_during_losses;
cat 0315_Dealer_schedule | awk -F" " '{print $1, $2, $5,$6}'| grep '02:00:00 PM' >> Dealers_working_during_losses;

