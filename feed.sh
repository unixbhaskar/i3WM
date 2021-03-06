#!/usr/bin/env bash
#===============================================================================
#
#          FILE: feed.sh
#
#         USAGE: ./feed.sh
#
#   DESCRIPTION:
#
#       OPTIONS: ---
#  REQUIREMENTS: ---curl
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unixbhaskar@gmail.com
#  ORGANIZATION: Independent
#       CREATED: 05/12/2019 21:31
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

# WARNING: This has a LIMIT of 32 characters for now!
# If your URL is longer you should use an URL shortener
# Caused by https://github.com/vivien/i3blocks/blob/01a4f4a9ca1e3d0b3c95d1d62000ad8506bdff1a/include/block.h#L50
# Example: https://goo.gl/
FEED_URL="${BLOCK_INSTANCE:-https://www.kernel.org/feeds/kdist.xml}"

if [[ "${FEED_URL}" = "" ]]; then
	  exit
  fi

  # Follows redirects!
  FEED_CONTENT=$(curl ${FEED_URL} -s -L)
   # FEED_TITLE=$(echo "${FEED_CONTENT}" | grep -v "xmlns:atom" | grep -o '<title>.*</title>' | head -n 1 | sed 's/\(<title>\|<\/title>\)//g')

  FEED_TITLE=$(echo "${FEED_CONTENT}" | grep -v "xmlns:atom" | grep -o '<title>.*</title>')
  # FEED_LINK=$(echo "${FEED_CONTENT}"  | grep -v "xmlns:atom" | grep -o '<link>.*</link>' | head -n 1 | sed 's/\(<link>\|<\/link>\)//g')


  # if [[ "${FEED_TITLE}" = *404* ]]; then
	    # echo "${FEED_URL}"
	      # echo "${FEED_URL}"
	        # echo ""
		  # exit 33
	  # fi

	  #if [[ "${BLOCK_BUTTON}" -eq 1 ]]; then
	#	    xdg-open "${FEED_LINK}"
	 #   fi

          echo "${FEED_TITLE}"
            # echo "${FEED_LINK}"
#	    echo "${FEED_TITLE}"
#	    echo ""
