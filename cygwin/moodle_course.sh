course=$(Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 8 toeic)
echo "course=$course"

course=2
course_name='speaking/test'

dummy=$(Moosh -n activity-add --section 0 --name dummy -o="--visible=0" quiz $course)
echo "dummy=$dummy"
dummy_quiz=$(($dummy+0))
# dummy_quiz=1
toeic_context=16
top_cat=$(Moosh -n questioncategory-create --parent 0 --context $toeic_context top)
toeic_cat=$(Moosh -n questioncategory-create --parent $top_cat --context $toeic_context "toeic default")
general_cat=$(Moosh -n questioncategory-create --parent $toeic_cat --context $toeic_context "general")
# toeic_cat=4
# general_cat=

file='/var/lib/moodle/repository/general/quiz_dummy_jigsaw_0.xml'
perl -MMoodle::Command::xml -e 'print Moodle::Command::xml::execute(
	"", { c=>"speaking/test", t=>"general", s=>"dummy", q=>"jigsaw", f=>0 }
	);' > $file
question=$(Moosh -n question-import $file $dummy_quiz $general_cat)
#Moosh -n activity-delete $dummy_quiz

total_grade=1
ex_cat=$(Moosh -n gradecategory-create -n exercises $total_grade $course)
echo "ex_grade_cat=$ex_cat"
# ex_cat=6
task=(general read pic question information solution opinion)
for c in {0..6}
	do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $total_grade $course)
echo "test_grade_cat=$test_cat"
# test_cat=7
for e in {0..4}
	do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done
