cd ~/edit/email

screen v prof_page.html sourcer.sh

screen bash -lc "< prof_page.html sourcer | curler | addre -l /mailto/ -p mailto: | vipe >> \$A"

screen svn st -q

exec bash -l
