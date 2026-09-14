# lftp

cd ~/profedit/$SOURCE
s=$SOURCE f=$FILE ; lftp -c "open sftp://drbean@freeshell.org && cd edit && get $s/$f.docx -o $f.docx && qui"
# upload_product
exec bash -l


