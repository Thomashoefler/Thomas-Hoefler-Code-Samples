CREATE PROCEDURE AcsLib.FacilityEmpls_sp

	@FacilityChoice integer
AS

/*------------------------------------------------------------------------------
CREATED: April 3, 2022
AUTHOR: Thomas Hoefler
DESCRIPTION: Show the Employees assigned to each facility
 PARAMETER: Choice of facility by facilityId
CHANGE HISTORY
Date	Modified By		Notes
TBD
-------------------------------------------------------------------------------*/

SELECT f.facilityid, f.facilityAddress, f.facilitycity, f.facilityState, f.facilityZipCode, e.Employeeid, e.EmployeeFirstName,e.EmployeeMiddleName, e.EmployeeLastName
FROM AccessibleLibrary.AcsLib.Facility f
INNER JOIN AccessibleLibrary.AcsLib.Employee e 
  ON e.FacilityId = f.FacilityId
WHERE f.FacilityId = @FacilityChoice