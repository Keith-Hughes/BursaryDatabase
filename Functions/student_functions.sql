

-- the view is stored in the views folder. 
-- first create it before you run this.
CREATE FUNCTION  fn_search_students_from_institution (
@text_search varchar(120))

RETURNS TABLE
AS
RETURN(
SELECT * FROM vw_Get_ALL_students_Applications
WHERE InstitutionName LIKE '%'+@text_search+'%'
)


