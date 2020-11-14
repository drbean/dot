ps=(basic langcjk xetex latex latexextra fontsrecommended pictures)
c='linux-libertine-fonts,noto-cjk-fonts,noto-cjk-fonts-common,texlive'
for p in ${ps[*]} ; do c="$c,texlive-collection-$p"
done
cyg_pack $c
