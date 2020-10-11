course=$(Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 15 toeic)
echo "course=$course"

course=2
course_name='speaking/test'

dummy=$(Moosh -n activity-add --section 0 --name dummy quiz $course)
echo "dummy=$dummy"
dummy_quiz=$((dummy+1))
# dummy_quiz=2
dummy_category=8

#question=$(perl -MYAML4Moodle::Command::xml -e "YAML4Moodle::Command::xml::execute('',{
#	c=>$course_name, t=>'general',
#	s=>'handbook', q=>'jigsaw', f=>0})")
#echo "question=$question"
#file='/var/lib/moodle/repository/general/quiz_handbook_jigsaw_0.xml'
#echo $question > $file
#quiz=$(Moosh -n question-import $file $dummy_quiz $dummy_category)
#Moosh -n activity-delete $dummy_quiz

# on creating dummy quiz in General Notifications??
top_cat=1
task=(general read pic question information solution opinion)
ex_cat=$(Moosh -n gradecategory-create -n exercises $top_cat $course)
echo "ex_grade_cat=$ex_cat"
# ex_cat=6
for c in {0..6}
	do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $top_cat $course)
echo "test_grade_cat=$test_cat"
# test_cat=7
for e in {0..4}
	do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done

# on creating question (editing quiz) for dummy quiz in General Notifications??
context=25 # 'toeic' context
parent=4 # 4 | Default for toeic
q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d 'How to read a text' read)
echo "read q_cat=$q_cat"
# after creating 'read' file system repo
#q_cat=9
grade_cat=4
sect='read'
course=2
perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>$q_cat, g=>$grade_cat, c=>$course, n=>\"$course_name\" })"

q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d 'Describing pictures' pic)
echo "pic q_cat=$q_cat"
# after creating 'pic' file system repo
# q_cat=10
grade_cat=5
sect='pic'
course=2
course_name='speaking/test'
perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>$q_cat, g=>$grade_cat, c=>$course, n=>\"$course_name\" })"

q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d 'Understanding information' information)
echo "information q_cat=$q_cat"
# after creating 'pic' file system repo
# q_cat=10
grade_cat=7
sect='information'
course=2
course_name='speaking/test'
perl -MMoodle::Command::section_populate -e "Moodle::Command::section_populate::execute('', { s=>\"$sect\", q=>$q_cat, g=>$grade_cat, c=>$course, n=>\"$course_name\" })"
