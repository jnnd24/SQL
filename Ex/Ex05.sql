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
                    
--예제) 각 부서별로 최고급여를 받는 사원을 출력하세요
select max(salary)
        ,department_id
        --,first_name
from employees
group by department_id;


--

select salary, first_name, department_id
from employees
where (salary, department_id) in (select max(salary)
                                           ,department_id
                                   from employees
                                  group by department_id);

-----------any--------------
--부서번호가 110인 직원의 급여보다 큰  모든직원의 사번,이름,급여 출력하세요
--12008, 8300 salary
select first_name, salary, department_id
from employees
where department_id = 110;


select first_name, salary, department_id
from employees
where salary > any(select salary
                    from employees
                    where department_id = 110);

-- all <-->any 비교
select first_name, salary, department_id
from employees
where department_id = 110;

select first_name, salary, department_id
from employees
where salary > all(select salary
                    from employees
                    where department_id = 110);

----------------------------------------------------------

-- 각 부서별로 최고급여를 받는 사원을 출력하세요
select max(salary)
        ,department_id
from employees
group by department_id
order by department_id;

select *
from employees
where (salary, department_id) in (select max(salary)
                                ,department_id
                                from employees
                                group by department_id) 
order by  asc;

--직원의 이름과 직원이 속한 부서명을 출력하세요
select *
from employees e, departments d
where e.department_id = d.department_id;


---rownum

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--정렬을 하면 rownum이 섞인다 -->정렬을 하고 rownum 을 준다
select  rownum,
        employee_id,
        first_name,
        salary
from employees   -- 미리 정렬되어 있는 테이블이면 rownum이 섞이지 않는다
order by salary desc;

-->정렬(정렬된 테이블 사용)하고 rownum을 준다
select  rownum,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot ;


--rownum을 이용해서 원하는 순위의 값을 선택한다(where절)
--where절이 2번 부터이면 데이터가 없다 (rownum이 항상 1이다)
select  rownum ,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
              first_name,
              salary
      from employees
      order by salary desc) ot  --정렬도 되어 있고  rownum로 있는 테이블이면?
where rownum >= 2
and rownum <= 5;

-->(1)정렬하고 (2)rownum이 있는 테이블을 사용하고 (3)where절을 쓴다
select  ort.rn,
        ort.first_name,
        ort.salary
from (select  rownum rn,
              ot.employee_id,
              ot.first_name,
              ot.salary
      from (select  employee_id,
                    first_name,
                    salary
            from employees
            order by salary desc) ot   --(1)
      )ort  --(2)
where rn >= 2
and rn<=5;  --(3)


select rownum
        ,first_name
        ,salary
from (  select first_name
                ,salary
        from employees
        order by salary desc )
where rownum >= 5
;



select rn
        ,first_name
        ,salary
from (

select rownum rn
        ,first_name
        ,salary
from (select first_name
            ,salary
        from employees
        order by salary desc)
)
where rn < 5;

--07년에입사한직원중급여가많은직원중3에서7등의이름급여입사일은?

--1.7월에 입사한 직원확인
-- 1-1. 부등호 사용하기 v
(select  first_name
        ,salary
        ,hire_date
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc) ot;

-- 1-1. like를 사용하기
select  first_name
        ,salary
        ,hire_date
from employees
where hire_date like '07/%'
order by salary desc;

(select rownum
        ,ot.employee_id
        ,ot.first_name
        ,ot.salary
from    (select  employee_id
                ,first_name
                ,salary
                ,hire_date
        from employees
        where hire_date >= '07/01/01'
        and hire_date <= '07/12/31'
        order by salary desc) ot
)ort;



select ort.rn
        ,ort.employee_id
        ,ort.first_name
        ,ort.salary
from    (select rownum rn
                ,ot.employee_id
                ,ot.first_name
                ,ot.salary
        from    (select  employee_id
                        ,first_name
                        ,salary
                        ,hire_date
                from employees
                where hire_date >= '07/01/01'
                and hire_date <= '07/12/31'
                order by salary desc) ot
        ) ort
where ort.rn >=2
and ort.rn <=3
;



------------------------


select  rownum rn
        ,hs.first_name
        ,hs.salary
        ,hs.hire_date
from (  select  first_name
                ,salary
                ,hire_date
        from employees
        order by salary desc) hs
where rn >= 7
;


select  rn
        first_name
        ,salary
        ,hire_date
from (  select  rownum rn
                ,first_name
                ,salary
                ,hire_date
        from (  select  first_name
                        ,salary
                        ,hire_date
                from employees
                order by salary desc)
where rn > 3;





















