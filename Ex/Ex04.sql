/************************************************************/
/* 5/16  SubQuery */
/************************************************************/

--‘Den’ 보다 급여를 많은사람의 이름과 급여는?

select first_name
        ,salary
from employees
where first_name = 'Den';


select first_name
        ,salary
from employees
where salary > 11000 -- Den 급여
order by first_name asc;



select first_name
        ,salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den')
order by first_name asc;


--예제, 급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?
select first_name, salary, employee_id
from employees
where salary = (select min(salary)
                from employees);
                
select min(salary)
from employees;

--예제2, 평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
--평균급여 구하기
select avg(salary)
from employees;

--평균급여보다 작은사람 구하기
select first_name
        ,salary
from employees
where salary < (select avg(salary)
                from employees)
;

--?? 부서번호가 110인 직원의 급여와 같은 모든 직원의 사번,이름,급여를 출력하시오

--부서번호 110의 급여 구하기
select  *
from employees
where department_id = 110;

--수동으로 한 것
select  *
from employees
where salary = 12008
or salary = 8300;

--subQuery 이용
select  employee_id
        ,first_name
        ,salary
from employees
where salary in (select  salary
from employees
where department_id = 110);


