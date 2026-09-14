echo "svn diff \$F issues.md:

$(svn diff $F issues.md)

PREV = $PREV
"
exec bash -l
