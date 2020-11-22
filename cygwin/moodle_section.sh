# on creating question (editing quiz) for dummy quiz in General Notifications??
# after creating file system repos
course=2
course_name='speaking/test'
context=16 # 'toeic' context
parent=4 # 4 | Default for toeic
section=('general' 'read' 'pic' 'question' 'information' 'solution' 'opinion' 'test0' 'test1')

for i in {0..8} ; do
	q_cat=${section[$i]}
	q_cat_id=$(Moosh -n questioncategory-create --reuse -p $parent -c $context $q_cat)
	echo "${section[$i]} q_cat=$q_cat"
	grade_cat=$(($i+4))
	sect=${section[$i]}
	perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>\"$q_cat\", g=>$grade_cat, c=>$course, n=>\"$course_name\" })"
done

