#!/bin/zsh

quote_raw=$(shuf -n 1 ~/.local/share/quotes/quotes.txt)
IFS='|' read -rA quote_array <<< $quote_raw

quote_string="\033[0;30m\033[45m \"$quote_array[1]\" \033[0m\n\033[0;30m\033[41m $quote_array[2] \033[0m"
echo $quote_string

