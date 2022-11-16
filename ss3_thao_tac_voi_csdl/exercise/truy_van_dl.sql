use quan_li_sinh_vien;

select * from student where student_name like 'h%';

select * from class where start_date like '%12%' ;

select * from subject where credit between 3 and 5;

set sql_safe_updates=0;
update student 
set class_id = 2 where student_name = 'Hung';

select student.student_name,subject.sub_name,mark.mark
from student 
join mark on student.student_id = mark.student_id
join subject on mark.sub_id = subject.sub_id
group by mark.mark_id
order by mark desc,student_name;