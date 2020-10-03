Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 15 toeic
task=(general read pic question information solution opinion)
ex_cat=$(Moosh -n gradecategory-create -n exercises 1 2)
for c in {0..6} ; do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat 2 ; done
test_cat=$(Moosh -n gradecategory-create -n tests 1 2)
for e in {0..4} ; do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat 2 ; done
Moosh -n questioncategory-create --reuse -p 4 -c 25 -d 'How to read a text' read
