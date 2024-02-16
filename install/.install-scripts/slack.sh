# wget: get page content
# tr: change tabs and newlines to space, change single quotes to double
# grep: ignore case match `<a href="(ADDRESS_IS_HERE)">`, output matches
# sed: filter lines to item enclosed in double quotes
# grep: match `slack-desktop`
# xargs: send link to wget command

wget -q https://slack.com/downloads/instructions/ubuntu -O - \
    | tr "\t\r\n'" '   "' \
    | grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' \
    | sed -e 's/^.*"\([^"]\+\)".*$/\1/g' \
    | grep 'slack-desktop' \
    | xargs wget -O slack-desktop-latest.deb
