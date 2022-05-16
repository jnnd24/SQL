/* 2022-05-13 Practic 03 */

--문제 1.
--직원들의 사번 (employee_id), 이름 (firt_name), 성 (last_ 과 부서명 (department_ 을
--조회하여 부서이름 (department_name) 오름차순 , 사번 (employee_id) 내림차순 으로 정렬하세요
--(106건)

select  em.employee_id
        ,em.first_name
        ,em.last_name
        ,de.department_name
from employees em, departments de
where em.department_id = de.department_id
order by de.department_name asc, em.employee_id desc;

--문제2.
--employees 테이블의 job_id 는 현재의 업무아이디를 가지고 있습니다
--직원들의 사번 (employee_id), 이름 (first_name), 급여 (salary), 부서명 (department_name), 현
--재업무 (job_title) 를 사번 (employee_id) 오름차순 으로 정렬하세요
--부서가 없는 Kimberely( 사번 178) 은 표시하지 않습니다
--(106건

select em.employee_id
        ,em.first_name
        ,em.salary
        ,de.department_name
        ,js.job_title
from employees em, departments de, jobs js
where em.department_id = de.department_id
and em.job_id=js.job_id
order by em.employee_id asc;

--문제2-1.
--문제2 에서 부서가 없는 Kimberely( 사번 178) 까지 표시해 보세요
--(107건
--못품
select em.employee_id
        ,em.first_name
        ,em.salary
        ,de.department_name
        ,js.job_title
from employees em, departments de, jobs js
where em.department_id = de.department_id
and em.job_id=js.job_id
order by em.employee_id asc;


--문제3.
--도시별로 위치한 부서들을 파악하려고 합니다
--도시아이디 , 도시명 , 부서명 , 부서아이디를 도시아이디 오름차순 로 정렬하여 출력하세요
--부서가 없는 도시는 표시하지 않습니다
--(27건

select  lo.location_id
        ,lo.city
        ,de.department_name
        ,de.department_id
from departments de, locations lo
where de.location_id = lo.location_id
order by lo.location_id;


--문제4
--지역(regions) 에 속한 나라들을 지역이름 (region_name), 나라이름 (country_name_=) 으로 
--출력하되 지역이름( 오름차순 ), 나라이름( 내림차순 ) 으로 정렬하세요
--(25건

select re.region_name
        ,co.country_name
from regions re, countries co
where re.region_id = co.region_id
order by region_name asc, co.country_name desc;

---문제 6
--나라별로 어떠한 부서들이 위치하고 있는지 파악하려고 합니다
--나라명 , 나라아이디 , 도시명 , 도시아이디 , 부서명 , 부서아이디를 나라명 (오름차순) 로 정렬하여
--출력하세요
--값이 없는 경우 표시하지 않습니다
--(27건

select  co.country_name
        ,co.country_id
        ,lo.city
        ,lo.country_id
        ,de.department_name
        ,de.department_id
from departments de, locations lo, countries co
where de.location_id = lo.location_id
and lo.country_id = co.country_id
order by co.country_name asc;


--문제7
--job_history 테이블은 과거의 담당업무의 데이터를 가지고 있다
--과거의 업무아이디 (job_id_ 가 'AC_ACCOUNT ’로 근무한 사원의 사번 , 이름 풀네임 ),
--업무아이 디 , 시작일 , 종료일을 출력하세요
--이름은 first_name 과 last_name 을 합쳐 출력합니다
--(2건

select em.first_name || em.last_name
        ,em.job_id
        ,jh.start_date
        ,jh.end_date
from job_history jh, employees em
where jh.employee_id = em.employee_id
and jh.job_id = 'AC_ACCOUNT';


--문제8
--각 부서 (department) 에 대해서 부서번호 (department_id), 부서이름 (department_name),
--매니저(manager) 의 이름 (first_name), 위치 (locations) 한 도시 (city), 나라 (countries) 의 
--이름(countries_name) 그리고 지역구분 (regions) 의 이름 (resion_name) 까지 전부 출력해 보세요
--(11건


--매니저아이디를 모르겠음

select de.department_id
        ,de.department_name
        ,de.manager_id
from employees em, departments de, locations lo, countries co, regions re
where 
em.department_id = de.department_id
and lo.location_id = de.location_id
and co.country_id = lo.country_id
and re.region_id = co.region_id;



--left join

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--left join 예제
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e left outer join departments d
on e.department_id = d.department_id;

--left join 오라클 표현법
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id(+);


--right join 

--equi join 테이터 106개 --> null은 포함되지 않는다
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id = d.department_id;

--right join 예제
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;

--right join 오라클 표현법
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e, departments d
where e.department_id(+) = d.department_id;

--right join --> left join
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e right outer join departments d
on e.department_id = d.department_id;


select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from departments d left outer join employees e
on e.department_id = d.department_id;

--full outer join
select  e.first_name,
        e.department_id,
        d.department_name,
        d.department_id
from employees e full outer join departments d
on e.department_id = d.department_id;


--*Self Join
select  e.employee_id,
        e.first_name,
        e.salary,
        e.phone_number,
        e.manager_id,
        m.employee_id,
        m.first_name ManagerName,
        m.phone_number
from employees e, employees m
where e.manager_id = m.employee_id;








