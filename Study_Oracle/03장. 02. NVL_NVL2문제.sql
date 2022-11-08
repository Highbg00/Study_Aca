1. NVL(대상, NULL일때 반환표현)
--     ￣￣￣￣￣￣￣￣￣￣￣￣

2. NVL2(대상, NULL이 아닐때, NULL일때)
--            ￣￣￣￣￣￣￣￣￣￣￣￣


커미션을 받는 사원은       총급여 = 급여 + 커미션금액, 
   커미션요율에는 커미션요율, 커미션요율표시는 커미션요율을 '0.00'형태로 표시,     
   커미션금액은 커미션금액"    을 표현해주고
커미션을 받지 않는 사원은  총급여 = 급여로만 계산하고  
   커미션요율에는 0,          커미션요율표시는 '커미션요율없음'으로 표시, 
   커미션금액은 0"             으로 표현

사번, 성, 급여, 커미션요율, 커미션요율표시, 커미션금액, 총급여 조회
employee_id last_name salary 커미션요율(NVL) 커미션요율표시(NVL) 커미션요율표시(NVL2) 커미션금액(NVL) 커미션금액(NVL2) 총급여(NVL) 총급여(NVL2)
-----------------------------------------------------------------------------------------------------------------------------------------------
SELECT  employee_id 사번, last_name 성, salary 급여, 
        NVL(commission_pct,0) "커미션요율(NVL)", 
        NVL(TO_CHAR(commission_pct,'0.00'),'커미션요율없음') "커미션요율표시(NVL)", 
        NVL2(commission_pct, TO_CHAR(commission_pct,'0.00'), '커미션요율없음') "커미션요율표시(NVL2)", 
        salary * NVL(commission_pct,0) "커미션금액(NVL)", 
        salary * NVL2(commission_pct, commission_pct, 0) "커미션금액(NVL2)", 
        salary + salary * NVL(commission_pct,0) "총급여(NVL)",
        salary + salary * NVL2(commission_pct,commission_pct, 0) "총급여(NVL)2"
FROM    employees;














