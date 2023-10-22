
  
    

    create or replace table `summer-gadget-399414`.`netflix`.`raw_movies_titles`
      
    
    

    OPTIONS()
    as (
      

with __dbt__cte__netflix_titles as (


SELECT
    * EXCEPT(
        date_added
    ),
    CASE
        WHEN date_added <> "" THEN PARSE_DATE("%B %d, %Y", date_added)
        ELSE NULL
    END AS date_added
FROM
    `summer-gadget-399414`.`netflix`.`netflix`
) SELECT
    *
FROM
    __dbt__cte__netflix_titles
WHERE
    type = 'Movie'
    );
  