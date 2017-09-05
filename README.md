# family-genealogy-database

## Summary

**This repository contains the SQL code, data model, and supporting materials for a personal Family Genealogy Database implemented with PostgreSQL.**<P>

* The purpose of this SQL code is to create a relational database used
to record, maintain, query, and report on personal family genealogical data.<P>
* The SQL code contained within this repository is compatible with **PostgreSQL version 9.6** and has not been tested with any other SQL database engines.<P>
* **Please Note:** This genealogy database has not been tested for compatibility with the latest *Genealogical Data Communication (GEDCOM) Standard*.
<BR>

## Data Model

The current version of the data model (2017-09-03) contains the following tables listed below: 

1. individual
1. family
1. relationship
1. occupation
1. education 
1. health_condition
1. relationship_type
1. role_type
1. occupation_type
1. health_condition_type
1. education_type
1. individual_memory
1. family_event
1. individual_memory_object
1. family_event_object
1. object_type

**Additional documentation will be added soon.**

See the embedded PNG below for a visual representation of these tables and associated fields, field types, and logical relationships comprising the current data model:

![Family Genealogy Data Model](https://github.com/sedelmeyer/family-genealogy-database/blob/master/family_datamodel.png?raw=true)
<BR>

## See Also

Special thanks to **Barry Williams**, whose [suggested data model on databaseanswers.com](http://databaseanswers.org/data_models/genealogy/index.htm) was my starting point while building this model.
