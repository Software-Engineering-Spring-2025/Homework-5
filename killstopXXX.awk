#!/usr/bin/awk -f

# Script to remove stop words from the text
# Stop words are: is, the, in, but, can, a, that, it, for, on, with, as, this, was, at, by, an, be, from, or, are, of, to

BEGIN {
    # Define stop words
    stop_words["is"] = 1
    stop_words["the"] = 1
    stop_words["in"] = 1
    stop_words["but"] = 1
    stop_words["can"] = 1
    stop_words["a"] = 1
    stop_words["that"] = 1
    stop_words["it"] = 1
    stop_words["for"] = 1
    stop_words["on"] = 1
    stop_words["with"] = 1
    stop_words["as"] = 1
    stop_words["this"] = 1
    stop_words["was"] = 1
    stop_words["at"] = 1
    stop_words["by"] = 1
    stop_words["an"] = 1
    stop_words["be"] = 1
    stop_words["from"] = 1
    stop_words["or"] = 1
    stop_words["are"] = 1
    stop_words["of"] = 1
    stop_words["to"] = 1
}

{
    # Process each line
    result = ""
    for (i = 1; i <= NF; i++) {
        # If the current word is not a stop word
        if (!($i in stop_words)) {
           ####################### 
           # result = $i
           # result = result " " $i
           #######################
            # Add it to the result
            
            if (result == "")
                result = $i
            else
                result = result " " $i
        }
    }
    
    # Print the line without stop words
    print result
}