#! /Bin/Bash
# Roulette Schedule for March 10 with day and time
echo " Roulette Schedule for March 10 with day and time"
awk '{print $1, $2, $5, $6}' ./0310_Dealer_schedule > March10RouletteSchedule



