course=$(Moosh -n course-create -f 'Teach Yourself TOEFL (under construction)' -d 'TOEFL prep: quizzes, slides, practice tests' -F topics -n 5 toefl)
echo "course=$course"
if [[ ! $course =~ ^[0-9]*$ ]] ; then echo 'new toefl$course' >&2 && sleep 1; fi
# course=2
course_name='test/toefl'
summary=$(Moosh -n course-config-set course $course summary "A companion course to ETS's TOEFLx on edX")
echo "summary=$summary"
Moosh -n course-config-set course $course summaryformat 4

dummy=$(Moosh -n activity-add --section 0 --name dummy -o="--visible=0" quiz $course)
echo "dummy=$dummy"
dummy_quiz=$(($dummy+0))
# dummy_quiz=1
toefl_context=12
# top_cat=$(Moosh -n questioncategory-create --parent '""' --context $toefl_context top)
top_cat=6
# toefl_cat=$(Moosh -n questioncategory-create --parent $top_cat --context $toefl_context "toefl default")
toefl_cat=7
#echo "toefl q_cat=$toefl_cat"
#general_cat=$(Moosh -n questioncategory-create --parent $toefl_cat --context $toefl_context "general")
## general_cat=
#echo "general q_cat=$general_cat"

file='/var/lib/moodle/repository/general/quiz_dummy_jigsaw_0.xml'
perl -MMoodle::Command::xml -e 'print Moodle::Command::xml::execute(
	"", { c=>"test/toefl", t=>"general", s=>"dummy", q=>"jigsaw", f=>0 }
	);' > $file
# question=$(Moosh -n question-import $file $dummy_quiz $general_cat)
# echo "dummy quiz question=$question"
Moosh -n activity-delete 1 # Announcements forum

total_grade=1
ex_cat=$(Moosh -n gradecategory-create -n exercises $total_grade $course)
echo "section_grade_cats=$ex_cat"
# ex_cat=6
task=(general reading listening speaking writing)
for c in {0..4}
	do echo -n "${task[$c]} cat="
	Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $total_grade $course)
echo "test_grade_cat=$test_cat"
# test_cat=7
for e in {0..4}
	do echo -n "test_$e grade cat="
	Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done
