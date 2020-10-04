# Moosh -n course-create -f 'Teach Yourself TOEIC Speaking' -d 'TOEIC Speaking prep: quizzes, slides, practice tests' -F topics -n 15 toeic_1
task=(general read pic question information solution opinion)
# ex_cat=$(Moosh -n gradecategory-create -n exercises 1 3)
ex_cat=6
for c in {0..6} ; do Moosh -n gradecategory-create -n ${task[$c]} $ex_cat 3 ; done
# test_cat=$(Moosh -n gradecategory-create -n tests 1 3)
test_cat=7
for e in {0..4} ; do Moosh -n gradecategory-create -n "practice_test_$e" $test_cat 3 ; done
Moosh -n questioncategory-create --reuse -p 4 -c 25 -d 'How to read a text' read
