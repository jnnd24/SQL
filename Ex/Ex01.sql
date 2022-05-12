/*

select 문
    select 절
    from 절
    where 절
    order by 절
*/
--모든컬럼 조회하기
select * 
from employees;

select *
from departments;

--원하는컬럼만 조회하기
select employee_id, first_name
from employees;

--예제
--사원의이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요
select first_name, phone_number, hire_date, salary
from employees;

--사원의이름(first_name)과 성(last_name) 급여, 전화번호, 이메일, 입사일을 출력하세요
select  first_name
        ,email
        ,last_name
        ,salary
        ,phone_number
        ,hire_date
from employees;



--출력할 때 컬럼에 별명 사용하기
--사원의이름(fisrt_name)과 전화번호 입사일 급여로 표시되도록 출력하세요
select  first_name "이름"
        ,phone_number "전화번호"
        ,hire_date "입사일"
        ,salary "급여"
from employees;

--사원의 사원번호 이름(first_name)성(last_name)급여 전화번호 이메일 입사일로 
--표시되도록 출력하세요
select  first_name as 이름
        ,last_name 성
        ,salary "Salary"
        ,phone_number "hp"
        ,email "이 메 일"
        ,hire_date
from employees;


--연결연산자(커럼을 붙이기)
select  first_name
        ,last_name
from employees;

select  first_name || ' ' || last_name 
from employees;

select first_name || ' hire date is ' || hire_date
from employees;


--산술 연산자 사용하기
-- +, -, *, /

select  first_name
        ,salary
        ,salary*12
from employees;

select job_id*12
from employees;

select  first_name || '-' || last_name 성명
        ,salary 급여
        ,salary*12 연봉
        ,salary*12+5000 연봉2
        ,phone_number 전화번호
from employees;

select *
from employees;

/******************************************************/
/* where절 시작 */
--부서번호가 10인 사원의 이름을 구하시오
select first_name
from employees
where department_id = 10;

/*예제
연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
이름이 Lex인 직원의 연봉을 출력하세요
*/

select  first_name
        ,salary
from employees
where salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
select  first_name
        ,hire_date
from employees
where hire_date >= '07/01/01' ;


--이름이 Lex인 직원의 연봉을 출력하세요
select salary
from employees
where first_name = 'Lex';


/********************************************/
--between 연산자 활용
--연봉이14000 이상17000이하인사원의이름과연봉을구하시오


select *
from employees
where salary between 14000 and 17000;

select *
from employees
where salary >=14000 
and salary<= 17000;

--연봉이14000 이하이거나17000 이상인사원의이름과연봉을출력하세요
select  first_name
        ,salary
from employees
where salary <= 14000 
or salary>=17000;

--입사일이04/01/01 에서05/12/31 사이의사원의이름과입사일을출력하세요
select *
from employees
where hire_date >= '04/01/01' and hire_date <= '05/12/13';
--IN연산자
select  first_name 
        ,last_name
        ,salary
from employees
where first_name in('Neena', 'Lex', 'John');



--연봉이2100, 3100, 4100, 5100 인사원의이름과연봉을구하시오
select  first_name 
        ,salary
from employees
where salary = 3100
or salary = 4100 
or salary = 5100;

select  first_name 
        ,salary
from employees
where salary in(3100, 4100, 5100);

/***********************************************/
/* like 문 */

select  first_name
        ,last_name
        ,salary
from employees
where first_name like 'L%';


select  first_name
        ,last_name
        ,salary
from employees
where first_name like 'L___';

--이름에am 을포함한사원의이름과연봉을출력하세요
select  first_name
        ,salary
from employees
where first_name like '%am%';

--이름의두번째글자가a 인사원의이름과연봉을출력하세요
select first_name
        ,salary
from employees
where first_name like '_a%';

--이름의네번째글자가a 인사원의이름을출력하세요
select first_name
from employees
where first_name like '___a%';

--이름이4글자인사원중끝에서두번째글자가a인사원의이름을출력하세요
select first_name
from employees
where first_name like '_a__';

select  first_name
        ,salary
        ,commission_pct
        ,salary*commission_pct
from employees
where commission_pct is null;


--커미션비율이있는사원의이름과연봉커미션비율을출력하세요
select first_name, commission_pct
from employees
where commission_pct is not null;

--담당매니저가없고커미션비율이없는직원의이름을출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;


/***************************************************/
/*oder by 절을 사용해서 정렬하기 */
select first_name, salary
from employees
order by salary asc; --desc : 오름차순 , asc : 내림차순


select first_name, salary
from employees
where salary >=9000
order by salary asc;

select *
from employees
order by first_name asc;



--  부서번호를오름차순으로정렬하고부서번호, 급여, 이름을출력하세요
select department_id
        ,salary
        ,first_name
from employees
order by department_id asc;

--급여가10000 이상인직원의이름급여를급여가큰직원부터출력하세요
select first_name
        ,salary
from employees
where salary >=10000
order by salary desc;

--부서번호를오름차순으로정렬하고부서번호가같으면급여가높은사람부터부서번호급여이름을출력하세요
select department_id, salary, first_name
from employees
order by department_id asc, salary desc, first_name desc;

/***********************************************************/
/**********************************************************/
/* 단일행 함수 */
--문자함수 INITCAP
--부서번호100인 직원의 이메일주소와 부서번호를 출력하세요

select email
        ,initcap(email) email112
        ,department_id
from employees
where department_id = 100;

-- 문자함수 -- lower // upper
select  first_name
        ,upper(first_name) "upPer"
        ,lower(first_name) lower
from employees
where department_id = 100;

--문자함수-- substr  일부만 뺴오기
select  first_name
        ,substr(first_name,1,5)
        ,substr(first_name,-5,2)
from employees
where department_id = 100;

--문자함수-- LPAD RPAD 채우기
select  first_name
        ,lpad(first_name,10,' ')
        ,rpad(first_name,10,' ')
        -- 한번에 양쪽 다 채우기,, 고민 필요있음 
        -- ,rpad(lpad(first_name,10,'*'),20,'*')
from employees
where department_id = 100;

--문자함수-- REPLACE 치환 (컬럼명, 문자1, 문자2)
select  first_name
        ,replace(first_name, 'a', '*')
        ,substr(first_name,2,3) 바꿀놈
        ,replace(first_name, substr(first_name,2,3), '***')
from employees
where department_id = 100;

select replace('abcdefghi', 'bc' , '****')
from dual;

--숫자함수--ROUND(숫자, 출력을원하는 자리수)
--반올림 TRUNC(숫자, 출력을원하는 자리수)

select  round (123.1115124, 2) r2
        ,round (123.55155120, 1) r1
        ,round( 123.1155120, -1) 
from dual;


select trunc(123.5124, 2)
        ,trunc(123.5124, 1)
        ,trunc(123.5124, 0)
        ,trunc(123.5124, -1)
from employees;


/********************************************/
/** 날짜함수 **/

-- 날짜함수 -- SYSDATE() 현재시각 알려주는 함수
select sysdate
from dual;

--날짜함수 -- months_between 두 날짜 사이의 개월수를 출력
select months_between('22/05/12', '22/04/12')
from dual;

select months_between(sysdate, hire_date)
from employees
where department_id = 100 or department_id = 110;


--  TO_CHAR (숫자, '출력모양') 숫자형>문자형으로 변형하기
select  first_name
        ,to_char(salary*12, '999,999' ) "SAL"
from employees
where department_id = 110;


select  to_char(9876, '9999999')
        ,to_char(9876, '099999')
        ,to_char(9876, '$99999')
        ,to_char(9876, '99999.999')
from dual;

-- TO_CHAR (날짜, '출력모양') 날짜>문자형으로 변환하기

select  sysdate
        ,to_char(sysdate, 'yy')
        ,to_char(sysdate, 'mm')
        ,to_char(sysdate, 'month')
        ,to_char(sysdate, 'day')
        ,to_char(sysdate, 'yyyy-mm-dd am hh:mi:ss')
from dual;


-- 일반함수> NVL(컬럼명, null일때값)/
-- NVL2(컬럼명, null아닐때값, null일때값)



