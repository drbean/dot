# on creating question (editing quiz) for dummy quiz in General Notifications??
# after creating file system repos
course=2
course_name='test/toefl'
context=12 # 'toefl' context
parent=7 # 4 | Default for toefl
# parent id = 1 according to questioncategory-create
section=('general' 'reading' 'listening' 'speaking' 'writing' 'test0' 'test1')

for i in {0..4} ; do
	q_cat=${section[$i]}
q_cat_id=$(Moosh -n questioncategory-create --reuse -p $parent -c $context $q_cat)
	echo "$q_cat q_cat=$q_cat_id"
	grade_cat=$(($i+4))
	sect=${section[$i]}
	if [[ $(perl -MMoodle::Command::section_populate -e 0 2>&1) ]] ; then echo 'run ~/dot/cygwin/moopl_setup.sh' && exit; fi
	perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>\"$q_cat\", g=>$grade_cat, c=>$course, n=>\"$course_name\" })"
done
