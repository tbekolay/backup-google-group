#!/usr/bin/env bash

# exe() { echo "\$ $@" ; "$@" ; }

get_string() {
    while true; do
        read -r -p "$*: " yn
        case $yn in
            ?* ) echo "$yn"; break;;
        esac
    done
}

confirm() {
    while true; do
        read -r -p "$* [Yn]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) return 0;;
        esac
    done
}

if [ ! -d "google-group-crawler" ]; then
    git clone git@github.com:icy/google-group-crawler.git
    echo ""
fi

cat <<EOF
The Google Group name can be obtained from the URL of the group:
  https://groups.google.com/forum/#!forum/<name>

EOF

_GROUP=$(get_string "Enter the Google Group name to backup")

cat <<EOF

Private groups require cookie information to pass authentication. See
https://github.com/icy/google-group-crawler#private-group-or-group-hosted-by-an-organization
Leave this blank for public groups.

EOF
printf 'curl options file: '
read -r _COOKIES

cat <<EOF

You have entered the following:
  Google group name: $_GROUP
  curl options file: $_COOKIES

EOF

if confirm "Do you wish to continue with the backup?"; then
    echo ""
else
    echo "Exiting."
    exit
fi

# --- Run google-group-crawler
if [ -z "$_COOKIES" ]; then
    _GROUP=$_GROUP \
          google-group-crawler/crawler.sh -sh > curl.sh
else
    _GROUP=$_GROUP \
          _CURL_OPTIONS="-K $_COOKIES" \
          google-group-crawler/crawler.sh -sh > curl.sh
fi
. curl.sh

# --- Do some cleanup on resulting mbox files.
#     Feel free to add to this block for your specific cleanup.
for FILE in $_GROUP/mbox/m.*; do

    # --- Use correct creation date for mbox files
    DATE="$( \
      grep ^Date: "$FILE"\
      | head -1\
      | sed -e 's#^Date: ##g' \
    )";
    touch -d "$DATE" "$FILE";

    # --- Replace incorrect images/gif MIME type with image/gif
    sed -i -e 's/images\/gif/image\/gif/g' "$FILE"

done

# --- Run mhonarc on the mbox files.
#     Additional mhonarc configuration can be provided in mhonarc.conf
mkdir -p "$_GROUP/html"
mhonarc -rcfile mhonarc.conf -outdir "$_GROUP/html" "$_GROUP"/mbox/m.*

cat <<EOF

$_GROUP is now backed up!

mbox files are in $_GROUP/mbox
HTML files are in $_GROUP/html
EOF
