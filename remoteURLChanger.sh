#!/bin/bash
GIT_REMOTE_URL=$(git remote -v)
TEST_URL=`echo github.gwd.broadcom.net`
echo $GIT_REMOTE_URL
echo $TEST_URL

if printf '%s\n' "$GIT_REMOTE_URL" | grep -Fqe "$TEST_URL";then
    UPDATE_URL=$(git remote -v | cut -d ' ' -f 1 | sed  's,https://,git@,' | sed  's,/,:,' | head -n 1)
    echo $UPDATE_URL
    git remote set-url  $UPDATE_URL
fi