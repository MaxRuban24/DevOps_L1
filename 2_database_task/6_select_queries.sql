-- 6. Construct and execute SELECT operator with WHERE, GROUP BY and ORDER BY.

USE metalcatalogue;

select count(Songname) as Songs_amount, BandName
from Songs
where not BandName = 'Sabaton'
group by BandName
order by Songs_amount desc;

