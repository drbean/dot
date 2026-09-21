cd ~/edit/email

# edit files
screen v prof_page.html sourcer.sh

# get addresses
screen bash -lc "< prof_page.html sourcer | curler | addre -l /mailto/ -p mailto: | vipe >> \$A"

# direct operation
screen svn st -q

exec bash -l
