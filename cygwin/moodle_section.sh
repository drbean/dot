# on creating question (editing quiz) for dummy quiz in General Notifications??
# after creating file system repos
course=2
course_name='speaking/test'
context=25 # 'toeic' context
parent=4 # 4 | Default for toeic
section=('general' 'read' 'pic' 'question' 'information' 'solution' 'opinion' 'test0' 'test1')
name=('general' 'Question 1–2 Read a text aloud' 'Question 3 Describe a picture' 'Question 4-6 Respond to questions' 'Question 7-9 Respond to questions using information provided' 'Question 10 Propose a solution' 'Question 11 Express an opinion')
description=('The TOEIC test' 'How to read a text' 'Describing pictures' 'Answering questions' 'Understanding information' 'Solving problems' 'Expressing opinions' 'Test 1' 'Test 2')

for s in {0..6}
do
	Moosh -n section-config-set course $course $s name "${name[$s]}"
	Moosh -n section-config-set course $course $s summary "${description[$s]}"
done
for i in {0..7} ; do
q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d "${description[$i]}" ${section[$i]})
	echo "${section[$i]} q_cat=$q_cat"
	grade_cat=$(($i+4))
	sect=${section[$i]}
	perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>$q_cat, g=>$grade_cat, c=>$course, n=>\"$course_name\" })"
done
