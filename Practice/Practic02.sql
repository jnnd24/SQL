/* 2022-05-13 Practic 02 */

--문제1.
--매니저가 있는 직원은 몇 명입니까 ? 아래의 결과가 나오도록 쿼리문을 작성하세요
--풀이 : 1. 매니저가있는 직원: where문에 is not null을 활용
--      2. count함수 활용
select count(*) "haveMngCnt"
from employees
where manager_id is not null;

--문제2.
--직원중에 최고임금 (salary) 과 최저임금을 "최고임금 , 최저임금" 프로젝션 타이틀로 함께 출력
--해 보세요 . 두 임금의 차이는 얼마인가요 ? 최고임금 - 최저임금 이란 타이틀로 함께 출력
--해 보세요

--풀이 : max, min활용

select  max(salary) 최고임금
        ,min(salary) 최저임금
        ,max(salary) - min(salary) "최고임금 - 최저임금"
from employees;

--문제3.
--마지막으로신입사원이 들어온 날은 언제 입니까 ? 다음 형식으로 출력해주세요
--예) 2014 년 07 월 10 일

--풀이 : 입사일 max값으로 출력 후 to_char로 표시방식 변경

select to_char(max(hire_date), 'yyyy"년" mm"월" dd"일"')
from employees;

--문제4
--부서별로 평균임금 , 최고임금 , 최저임금을 부서 아이디 (department_id) 와 함께 출력합니다
--정렬순서는 부서번호 (department_id) 내림차순입니다

--풀이 : group by 로 부서별 통계내고, order by로 정렬하자

select department_id
        ,avg(salary)
        ,max(salary)
        ,min(salary)
from employees
group by department_id
order by department_id desc;


--문제5
--업무(job_id) 별로 평균임금 , 최고임금 , 최저임금을 업무아이디 (job_id) 와 함께 출력하고 
--정렬 순서는 최저임금 내림차순, 평균임금 (소수점 반올림), 오름 차순 순 입니다
--(정렬순서는 최소임금 2500 구간일때 확인해볼 것)

--풀이 : group by job_id를 사용, 정렬은 order by 사용, 소수점반올림 round함수, order by 두개 중복사용

select  job_id
        ,round(avg(salary), 3)
        ,max(salary)
        ,min(salary)
from employees
group by job_id
order by min(salary) desc, avg(salary) asc;


--문제6
--가장 오래 근속한 직원의 입사일은 언제인가요 ? 다음 형식으로 출력해주세요
--예) 2001-01-13 토요일

--풀이 min으로 가장일찍입사한 직원을 찾아서 to_char이용 표시한다

select to_char(min(hire_date), 'yyyy-mm-dd day')
from employees;


--문제7
--평균임금과 최저임금의 차이가 2000 미만인 부서 (department_id), 평균임금 , 최저임금 
--그리고 (평균임금 - 최저임금) 를 (평균임금 -최저임금) 의 내림차순으로 정렬해서 출력하세요

--풀이 1. avg를 통해 급여차이를 구한다
--2. 부서별정렬이라 group by를 써야하니 where문이 아닌 having문을 사용한다.

select  department_id
        ,avg(salary) "평균임금"
        ,min(salary) "최저임금"
        ,avg(salary)-min(salary) "평균임금-최저임금"
from employees
group by department_id
having avg(salary)-min(salary) < 2000
order by "평균임금-최저임금" desc;



--문제 8
--업무(jobs) 별로 최고임금과 최저임금의 차이를 출력해보세요
--차이를 확인할 수 있도록 내림차순으로 정렬하세요 ?

-- 풀이 : group by job_id 사용

select job_id
        ,max(salary) - min(salary)
from employees
group by job_id
order by max(salary) - min(salary) desc;


--문제10
--아래회사는 보너스 지급을 위해 직원을 입사일 기준으로 나눌려고 합니다.
--입사일이 02/12/31일 이전이면 '창립맴버, 03년은 '03년입사’, 04년은 ‘04년입사’
--이후입사자는 ‘상장이후입사’ optDate 컬럼의 데이터로 출력하세요.
--정렬은 입사일로 오름차순으로 정렬합니다.

-- 풀이 : CASE~END문 활용 

select  hire_date
        ,case when hire_date < '02/12/31' then '창립멤버'
            when hire_date <= '03/12/31' then '03년입사'
            when hire_date <= '04/12/31' then '04년입사'
            when hire_date > '04/12/31' then '상장이후입사'
        end "컬럼명"
from employees
order by hire_date asc;