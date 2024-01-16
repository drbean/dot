task=(general read pic question information solution opinion)

# mkdir --parent /srv/www/cgi-bin/ /var/lib/moodle/

for t in general read pic question information solution opinion
	do mkdir /var/lib/moodle/repository/$t --parent
done

. ~/dot/cygwin/toeic_course.sh

. ~/dot/cygwin/toeic_section.sh
