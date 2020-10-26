# on creating question (editing quiz) for dummy quiz in General Notifications??
# after creating file system repos
course=2
course_name='speaking/test'
context=25 # 'toeic' context
parent=4 # 4 | Default for toeic
section=('read' 'pic' 'question' 'information' 'solution')
info=('How to read a text' 'Describing pictures' 'Answering questions' 'Understanding information' 'Solving problems')
for i in 3 4 ; do
q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d "${info[$i]}" ${section[$i]})
	echo "${section[$i]} q_cat=$q_cat"
	grade_cat=$(($i+4))
	sect=${section[$i]}
	perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>$q_cat, g=>$grade_cat, c=>$course, n=>\"$course_name\" })"
done

