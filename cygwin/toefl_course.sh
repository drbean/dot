course=$(Moosh -n course-create -f 'Teach Yourself TOEFL' -d 'TOEFL prep: quizzes, slides, practice tests' -F topics -n 5 toefl)
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
echo "toefl q_cat=$toefl_cat"
# general_cat=$(Moosh -n questioncategory-create --parent $toefl_cat --context $toefl_context "general")
general_cat=8
echo "general q_cat=$general_cat"

file='/var/lib/moodle/repository/general/quiz_dummy_jigsaw_0.xml'
perl -MMoodle::Command::xml -e 'print Moodle::Command::xml::execute(
	"", { c=>"test/toefl", t=>"general", s=>"dummy", q=>"jigsaw", f=>0 }
	);' > $file
# question=$(Moosh -n question-import $file $dummy_quiz $general_cat)
# echo "dummy quiz question=$question"
dummy_id=1
# works: no parent, first context
dummy_top_cat=$(Moosh -n questioncategory-create -r -p 0 -c 17 "top")
dummy_category=$(Moosh -n questioncategory-create -r -p 1 -c 17 "dummy_category");
toefl_cat=4
toefl_context=16
toefl_top_cat=$(Moosh -n questioncategory-create -r -p 0 -c 16 "top")
toefl_category=$(Moosh -n questioncategory-create -r -p 3 -c 16 "toefl_category");
miscellaneous_top_cat=$(Moosh -n questioncategory-create -r -p 0 -c 3 "top")
miscellaneous_category=$(Moosh -n questioncategory-create -r -p 5 -c 3 "miscellaneous_category");
system_top_cat=$(Moosh -n questioncategory-create -r -p 0 -c 1 "top")
system_category=$(Moosh -n questioncategory-create -r -p 7 -c 1 "system_category");
# dummy_quiz=1
# top_cat=$(Moosh -n questioncategory-create --parent '""' --context $toefl_context top)
top_cat=6
# toefl_cat=$(Moosh -n questioncategory-create --parent $top_cat --context $toefl_context "toefl default")
eval /home/$USER/moosh/moosh.php -n question-import \
	$file $dummy_id $dummy_category || echo \
	"question import of 'dummy' jigsaw activity \
	question in '$dummy_category' category into \
	'$dummy_id' quiz, from '$file' file failed. ";
Moosh -n activity-delete 1 # Announcements forum

# check gradebook in browser for ex_cat, test_cat
# need to change total_grade if course!=2
total_grade=1
ex_cat=$(Moosh -n gradecategory-create -n exercises $total_grade $course)
echo "section_grade_ex_cat=$ex_cat"
# ex_cat=6 # 15
task=(general reading listening speaking writing)
for c in {0..4}
	do echo -n "${task[$c]} cat="
	Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $total_grade $course)
echo "test_grade_cat=$test_cat"
# test_cat=7 # 16
for e in {0..4}
	do echo -n "test_$e grade cat="
	Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done
