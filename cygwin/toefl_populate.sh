task=(general reading listening speaking writing)

# mkdir --parent /srv/www/cgi-bin/ /var/lib/moodle/

for t in general reading listening speaking writing
	do mkdir /var/lib/moodle/repository/$t --parent
done

. ~/dot/cygwin/toefl_course.sh

. ~/dot/cygwin/toefl_section.sh
