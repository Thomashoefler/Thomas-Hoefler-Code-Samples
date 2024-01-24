CREATE PROCEDURE AcsLib.EmpCustCount_sp

AS

/*------------------------------------------------------------------------------
CREATED: April 3, 2022
AUTHOR: Thomas Hoefler
DESCRIPTION: Show the number of employees and the number of customers for each route

CHANGE HISTORY
Date	Modified By		Notes
TBD
-------------------------------------------------------------------------------*/

SELECT ra.routeid, 'Employee' as Type, count(*) as CountPerRoute 
FROM AccessibleLibrary.AcsLib.routeAssignment ra 
GROUP BY ra.routeid

UNION

SELECT c.routeid, 'Customers' as Type, count(*) as CountPerRoute 
FROM AccessibleLibrary.AcsLib.customers c 
GROUP BY c.routeid

ORDER BY routeid