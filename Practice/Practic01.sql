/*********************************/
/* 5/12 과제 Practic01 */

--문제 1
select  first_name 이름
        ,salary 월급
        ,phone_number 전화번호
        ,hire_date 입사일
from employees
order by hire_date asc;

--문제2
select job_title, max_salary
from jobs
order by max_salary desc;

--문제3
--담당매 니저가 배정되어있으나 커미션비율이 없고 월급이 3000 초과인 직원 의 이름 , 매니저
--아이디 커미션 비율 월급 을 출력하세요
select  first_name
        ,manager_id
        ,commission_pct
        ,salary
from employees
where manager_id is not null    --담당매니저가 배정되어 있으나
and commission_pct is null      --커미션비율이 없고
and salary > 3000;              --월급이 3000초과

--문제4
--최고월급(max_ 이 10000 이상인 업무 의 이름 (job_title) 과 최고월급 (max_salary) 을
--최고월급의 max_ salary) 내림차순 (desc) 로 정렬하여 출력하세요 .
select job_title, max_salary
from jobs
where max_salary >= 10000    --최고월급이 10000이상인 업무
order by max_salary desc;   -- 최고월급의 내림차순

--문제5
--월급이14000 미만 10000 이상인 직원 의 이름 (first_ 월급 커미션퍼센트 를 월급순
--내림차순 출력하 세오 단 커미션퍼센트 가 null 이면 0 으로 나타내시오
select  first_name
        ,salary
        ,nvl(commission_pct, 0)
from employees
where salary between 10000 and 14000;    -- 월급이 14000미만 10000이상
-- commison_pct가 null이면 0으로 표현 안배운거임


--문제6
--조건: 부서번호 10,90,100
--표기: 이름, 월급, 입사일, 부서번호
--입사일표기 1997-12 형식

select  first_name
        ,salary
        ,to_char(hire_date, 'yyyy-mm')
        ,department_id
from employees
where department_id in (10, 90, 100)
;

--문제7
--이름(first_ 에 S 또는 s 가 들어가는 직원 의 이름 , 월급 을 나타내시오
select first_name, salary
from employees
where first_name like '%S%'
or first_name like '%s%'
;

--answp8
--전체부서를 출력하려고 합니다 . 순서는 부서이름이 긴 순서대로 출력해 보세오
select *
from departments
order by length(department_name) desc; 

--문제9
--정확하지않지만 , 지 사가 있을 것으로 예상되는 나라들을 나라이름을 대문자로 출력하고
--올림차순(asc) 으로 정렬해 보세오
select upper(country_name)
from countries
order by country_name asc;

--문제10
--입사일이 03/12/31 일 이전 입사한 직원의 이름 , 월급 , 전화 번호 , 입사일 을 출력하세요
--전화번호는 545-343-3433 과 같은 형태로 출력 하시오
select  first_name
        ,salary
        ,replace(phone_number, '.', '-')
        ,hire_date
from employees
where hire_date < '03/12/31';




