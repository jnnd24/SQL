/*********************************************************/
/*** JOIN 문  - 두개이상테이블에서 합치기 ***/

select  em.employee_id
        ,em.first_name
        ,em.salary
        ,de.department_name
        ,de.department_id "d_dId"
        ,em.department_id "e_dId"
from employees em, departments de
where em.department_id = de.department_id;

select *
from departments;

select *
from locations;


select *
from employees, departments;

select employee_id
        ,department_name
from employees, departments
where employees.department_id = departments.department_id;


--예제
--모든직원이름, 부서이름, 업무명을출력하세요

select  em.first_name
        ,de.department_name
        ,js.job_title
from employees em , departments de, jobs js
where de.department_id = em.department_id 
and js.job_id = em.job_id
and em.salary >= 7000;

