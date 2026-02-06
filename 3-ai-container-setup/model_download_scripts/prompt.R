Please write an R program using data.table to do the following:

1. Read a file called 'offices.csv' into a data.table called 'offices'.
This table has two text columns: 'employee_id' and 'work_address'.
2. Read a file called 'homes.csv' into a data.table called 'homes'.
This table has two text columns: 'employee_id' and 'home_address'.
3. Produce a joined data.table 'result' on column 'employee_id'. The
output table should have text columns 'employee_id', 'work_address'
and 'home_address' and only have a row if the 'employee_id' exists
in both input tables.
4. Write the joined table to 'result.csv'.
