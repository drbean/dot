echo "svn diff \$F:

$(svn diff $F)

PREV = $PREV
"
cd ~/profedit/$SOURCE
exec bash -l
