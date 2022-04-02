echo Kenvix Password Auto Backup
SHELL_FOLDER=$(dirname $(readlink -f "$0"))
cd "$SHELL_FOLDER/trunk"
svn up
pushd data
svn st | grep ^! | awk '{print " --force "$2}' | xargs --no-run-if-empty svn rm
svn propset svn:ignore -F ignorelist.txt .
svn add --force .
popd
svn commit --message "AutoCommit"
