# NFL Big Data Bowl 2024

This repository contains my work for the NFL Big Data Bowl 2024. The majority of the code is contained in the Code_Notebook.Rmd file.

All of the original CSV files provided by the competition were converted to RDS files. Due to its size, the tracking data used up a lot of memory. To avoid this and to make it easier to query all 9 weeks at once, I combined all 9 weeks together into one table and saved it as a SQLite database. The Code_Notebook.Rmd file queries this database filtered on the plays of interest instead of querying all records.
 
