words=$(cat "JUJAyetu.txt")

words_total=${#words}
word_count=0
i=0

while [ $i -lt "$words_total" ]; do
    # The syntax ${string:offset:num} returns a substring of num characters from
    # position offset in the string
    # Here, it is leveraged to obtain each character in the string
    char=${words:$i:1}
    if [[ $char != " " ]]; then
        ((word_count++))
    fi
    ((i++))
done

echo "Number of charactes (excluding spaces) in JUJAyetu.txt: $word_count."
