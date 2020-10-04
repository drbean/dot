$course = Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 15 toeic_2
# course=5
top_cat=25
task=(general read pic question information solution opinion)
ex_cat=$(Moosh -n gradecategory-create -n exercises $top_cat $course)
# ex_cat=6
for c in {0..6}
	do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat $course
done
test_cat=$(Moosh -n gradecategory-create -n tests $top_cat $course)
# test_cat=7
for e in {0..4}
	do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat $course
done
context=35
parent=12
q_cat=Moosh -n questioncategory-create --reuse -p $parent -c $context -d 'How to read a text' read
# q_cat=17
grade_cat=28
sect='general'
course_name='toeic_2'
moopl section_populate -s $sect -q $q_cat -g $grade_cat -c $course -n $course_name
