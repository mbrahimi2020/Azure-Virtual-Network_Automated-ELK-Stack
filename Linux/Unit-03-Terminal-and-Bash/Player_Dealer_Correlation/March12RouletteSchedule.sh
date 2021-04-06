#! /Bin/Bash
# Roulette Schedule for March 12 with day and time
echo " Roulette Schedule for March 12 with day and time"
awk '{print $1, $2, $5, $6}' ./0312_Dealer_schedule > March12RouletteSchedule

