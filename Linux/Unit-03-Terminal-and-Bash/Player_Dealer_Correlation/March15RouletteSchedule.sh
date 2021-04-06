#! /Bin/Bash
# Roulette Schedule for March 15 with day and time
echo " Roulette Schedule for March 15 with day and time"
awk '{print $1, $2, $5, $6}' ./0315_Dealer_schedule > March15RouletteSchedule

