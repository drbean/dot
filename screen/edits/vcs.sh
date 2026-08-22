echo "svn diff \$F:

$(svn diff $F)

PREV = $PREV
"
exec bash -l
