[findLastPayment]
select 
	cro.year, 
	sum(cro.basic) as basic,
	sum(cro.sef) as sef 
from cashreceiptitem_rpt_online cro 
where cro.rptledgerid = $P{objid}
and cro.year = $P{year}
group by year 