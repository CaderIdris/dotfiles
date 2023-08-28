#!/bin/zsh

quote_raw=$(shuf -n 1 ~/.local/share/quotes/quotes.txt)
IFS='|' read -rA quote_array <<< $quote_raw

quote_string="\"$quote_array[1]\" - \e[3m$quote_array[2]\e[0m"
echo $quote_string | lolcat -t
