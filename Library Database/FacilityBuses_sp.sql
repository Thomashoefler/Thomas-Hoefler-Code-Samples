CREATE PROCEDURE AcsLib.FacilityBuses_sp

AS

/*------------------------------------------------------------------------------
CREATED: April 3, 2022
AUTHOR: Thomas Hoefler
DESCRIPTION: Show the Buses assigned to each facility

CHANGE HISTORY
Date	Modified By		Notes
TBD
-------------------------------------------------------------------------------*/

SELECT f.facilityid, f.facilityAddress, f.facilitycity, f.facilityState, f.facilityZipCode, b.BusId, b.inservice, b.make,b.model,b.year
FROM AccessibleLibrary.AcsLib.Facility f
INNER JOIN AccessibleLibrary.AcsLib.Buses b ON f.FacilityId = b.FacilityId
ORDER BY f.facilityid, b.BusId