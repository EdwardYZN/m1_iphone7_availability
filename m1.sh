#!/bin/sh
pattern='plus128j\">✓<'
url="https://www.m1.com.sg/micro/iphone/stock"
now=$(date "+%Y.%m.%d-%H.%M.%S")
curl $url > test.html

if grep $pattern test.html
	then
		/usr/bin/osascript <<EOT
		tell application "Messages"
			send "Found iphone 7 Plus 128G Jet Black at $url" to buddy "your imessage id" of (service 1 whose service type is iMessage)
		end tell
EOT
exit 0
else
	echo "Not found. -- $now">> log.txt
fi
exit 0
