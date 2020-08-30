for p in dot edit ttb ; do svn co http://github.com/drbean/$p/trunk $p --depth=empty ; done
for u in bash screen ; do svn up dot/$u ; done
# svn up edit/joyce
for ext in rc _profile ; do cp dot/bash/bash$ext ~/.bash$ext ; done
cd dot && svn cat ^/trunk/alternatives.txt > alternatives.txt && . alternatives.txt && cd -
