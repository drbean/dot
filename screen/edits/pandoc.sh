# pandoc

cd ~/profedit/$SOURCE
# pandoc -o \$FILE.reference.docx --print-default-data-file reference.docx
# pandoc -o orig_\$FILE.md --from=docx+styles --to=markdown-link_attributes --extract-media=./ \$FILE.docx
# MINE=my_\$FILE; pandoc -o \$MINE.docx --reference-doc=./\$FILE.reference.docx \$FILE.md
exec bash -l

