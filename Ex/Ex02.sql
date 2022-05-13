-- 5/13수업까지
/*****************************************************/

/* 그룹 함수 */

/* 표현이 불가하다
select first_name
        ,sum(salary)
from employees;
*/

select sum(salary)
from employees;


/* 그룹함수 - caount() */
select count (*)
from employees;

select count(*)
        ,count(commission_pct) -- null값은 빼고 세어 줌
        ,count(manager_id)
from employees;

select count(*)
from employees
where salary > 16000;



/* 그룹함수 sum */
select sum(salary)
        ,count(*)
from employees;

/* 그룹함수 - avg  */
/* (기본적으로 null은 빼버림, 필요하면 nvl함수를 사용해야 함 )*/
select  avg(salary)
        ,round(avg(salary), 0)
        ,avg(nvl(salary, 0))
from employees;

/* 그룹함수 - max() / min() */
select  max(salary)
        ,min(salary)
        ,count(*)
from employees;


/***************************************/
/* group by 절 */
select first_name           --절
from employees              --절
where salary > 16000        --절
order by first_name asc;    --절
-------------------------------------------------

select  department_id   --전체라서 안됨
        ,avg(salary)    --전체평균 1개
from employees
order by department_id;




select  department_id
        ,avg(salary)    --부서별 평균
from employees
group by department_id
order by department_id asc;


select  department_id
        ,avg(salary)    --부서별 평균
        ,sum(salary)    --부서별 합계
        ,count(salary)  --부서별 카운트
from employees
group by department_id
order by department_id asc;


select  job_id
        ,avg(salary)
from employees
group by job_id
order by job_id asc;


-- 2개사용
select  department_id
        ,job_id
        ,avg(salary)    --부서별 평균
        ,sum(salary)    --부서별 합계
        ,count(salary)  --부서별 카운트
from employees
group by department_id, job_id
order by department_id asc;

--예제
--연봉(salary)의합계가20000 이상인부서의부서번호와, 인원수, 급여합계를출력하세요

select  department_id
        ,count(*)       "인원 수"
        ,sum(salary)    "급여 합"
from employees
group by department_id
having sum(salary) >= 20000     --group by 전용 함수 // 또다른 where절
order by sum(salary) asc;




/**************************************************/
/**** CASE ~ END 문 / DECODE() 함수 ****/

select  employee_id
        ,first_name
        ,job_id
        ,salary
        --,salary + salary*0.1

        ,case   when job_id = 'AC_ACCOUNT' then salary + salary*0.1
                when job_id = 'SA_REP' then salary + salary*0.2
                when job_id = 'ST_CLERK' then salary + salary*0.3
        end realSalary
from employees;

-- DECODE 문
select  employee_id
        ,first_name
        ,job_id
        ,salary
        --,salary + salary*0.1

        ,decode( job_id, 'AC_ACCOUNT' , salary + salary*0.1,
                         'SA_REP' , salary + salary*0.2,
                         'ST_CLERK', salary + salary*0.3,
                salary ) bonus
from employees;

---예제
--직원의이름,부서, 팀을출력하세요
--팀은 코드로 결정하며 부서코드가10~50 이면‘A-TEAM’
--60~100이면‘B-TEAM’ 
--110~150이면‘C-TEAM’ 
--나머지는‘팀없음’으로출력하세요.

select  first_name || last_name 이름
        ,department_id 부서
        ,case   when department_id < 10 then '팀없음'
                when department_id <= 50 then 'A-TEAM'
                when department_id < 60 then '팀없음'
                when department_id <= 100 then 'B-TEAM'
                when department_id < 110 then '팀없음'
                when department_id <= 150 then 'C-TEAM'
                when department_id is null then '팀없음'
        end "팀"
        
        ,case when department_id >=10 and department_id <= 50 then 'A팀'
              when department_id >=60 and department_id <=100 then 'B팀'
              when department_id >=110 and department_id <=150 then 'C팀'
              else '팀없음'
        end "팀"
from employees;














