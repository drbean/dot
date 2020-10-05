course=$(Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 15 toeic)
echo "course=$course"

## on creating dummy quiz in General Notifications??
course=2
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

# on creating question for dummy quiz in General Notifications??
context=25 # 'toeic' context
parent=4 # 4 | Default for toeic
q_cat=$(Moosh -n questioncategory-create --reuse -p $parent -c $context -d 'How to read a text' read)
echo "q_cat=$q_cat"

q_cat=9
grade_cat=4
sect='read'
course_name='toeic'
moopl section_populate -s $sect -q $q_cat -g $grade_cat -c $course -n $course_name
