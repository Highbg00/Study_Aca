-----------------------------------------------------------------------------------------------
--[연습문제 4-1]
--우리회사에 매니저로 있는 사원들이 누군인지 파악하고자 한다.
--매니저인 사원들의 manager_id 를 조회 --18개

SELECT  DISTINCT manager_id 매니저
FROM    employees
WHERE   manager_id IS NOT NULL;



-----------------------------------------------------------------------------------------------