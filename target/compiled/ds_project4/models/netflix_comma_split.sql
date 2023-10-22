

SELECT
    * EXCEPT(
        date_added,
        country,
        listed_in,
        `cast`,
        director
    ),
    CASE
        WHEN date_added <> "" THEN PARSE_DATE("%B %d, %Y", date_added)
        ELSE NULL
    END AS date_added,
    
    SPLIT(country, ',')
 AS country,
    
    SPLIT(listed_in, ',')
 AS listed_in,
    
    SPLIT(`cast`, ',')
 AS `cast`,
    
    SPLIT(director, ',')
 AS director
FROM
    `summer-gadget-399414`.`netflix`.`netflix`