#!/usr/bin/awk -f


BEGIN {
    FS=" "  
    OFS="," 
}

/^$/ { 
    if (in_paragraph) {
        print_paragraph(); 
        reset_counts();   
    }
    next
}

PASS == 1 {
    top_words[$1] = count++
    words[count - 1] = $1 
    next
}

PASS == 2 {
    in_paragraph = 1 
    for (i = 1; i <= NF; i++) {
        word = $i
        if (word in top_words) {
            freq[top_words[word]]++
        }
    }
}

function print_paragraph() {
    if (!header_printed) {
        for (i = 0; i < count; i++) {
            printf "%s%s", words[i], (i < count - 1 ? OFS : "\n")
        }
        header_printed = 1
    }
    for (i = 0; i < count; i++) {
        printf "%d%s", freq[i], (i < count - 1 ? OFS : "\n")
    }
}

function reset_counts() {
    for (i = 0; i < count; i++) {
        freq[i] = 0
    }
}

END {
    if (in_paragraph) {
        print_paragraph() 
    }
}

