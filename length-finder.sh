#!/bin/bash
read -p "Text: " text
echo -e "Length of $text is\033[91m ${#text} \033[0m"
