
CREATE PROCEDURE AcsLib.GenreCount_sp

AS

/*------------------------------------------------------------------------------
CREATED: April 3, 2022
AUTHOR: Thomas Hoefler
DESCRIPTION: show the genre and count of books that exist on inservice buses

CHANGE HISTORY
Date	Modified By		Notes
TBD
-------------------------------------------------------------------------------*/

SELECT b.Genre, count(*) as GenreCt 
FROM AccessibleLibrary.AcsLib.books b
WHERE b.Busid in
	(SELECT b1.busid 
	FROM AccessibleLibrary.AcsLib.buses b1 
	WHERE b1.inService = 'Yes')
GROUP BY b.Genre