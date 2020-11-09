course=$(Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 8 toeic)
echo "course=$course"

course=2
course_name='speaking/test'

dummy=$(Moosh -n activity-add --section 0 --name dummy -o="visible=0" quiz $course)
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
ex_cat=$(Moosh -n gradecategory-create -n exercises $top_cat $course)
echo "ex_grade_cat=$ex_cat"
# ex_cat=6
task=(general read pic question information solution opinion)
for c in {0..6}
	do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $top_cat $course)
echo "test_grade_cat=$test_cat"
# test_cat=7
for e in {0..4}
	do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done

