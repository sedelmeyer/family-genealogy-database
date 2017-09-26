/*
		Author: 		Michael sedelmeyer
		Version:		1.1
		Published: 	2017-09-26

		You can find the latest version of this file, as well as
		supporting documentation, including a visual representation
		of the associated data model, for family_postgres_create.sql
		at: https://github.com/sedelmeyer/family-genealogy-database

		The following SQL code is compatible with PostgreSQL version 9.6
		and has not been tested with any other SQL database engines.

		The purpose of this SQL code is to create a relational database used
		to record, maintain, query, and report on personal family
		genealogical data.

		This genealogy database has not been tested for compatibility with
		the latest Genealogical Data Communication (GEDCOM) Standard.
*/

CREATE TABLE "individual" (
	"individual_id" 			serial NOT NULL,
	"name_last" 					varchar NOT NULL,
	"name_first" 					varchar NOT NULL,
	"name_middle" 				varchar,
	"name_maiden" 				varchar,
	"name_familiar" 			varchar,
	"gender" 							char(1) NOT NULL,
	"date_birth" 					DATE NOT NULL,
	"date_death" 					DATE,
	"place_birth" 				varchar NOT NULL,
	"place_death" 				varchar,
	"cause_death" 				varchar,
	"individual_notes" 		text NOT NULL,
	CONSTRAINT individual_pk
		PRIMARY KEY ("individual_id")
) WITH (
  OIDS=FALSE
);

CREATE TABLE "parent_type" (
	"parent_type_id" 				serial NOT NULL,
	"parent_type_name" 			varchar NOT NULL,
	"parent_type_notes"			text,
	CONSTRAINT parent_type_pk
		PRIMARY KEY ("parent_type_id")
) WITH (
	OIDS=FALSE
);

CREATE TABLE "parent" (
	"parent_id" 						serial NOT NULL,
	"individual_id" 				integer NOT NULL,
	"parent_individual_id" 	integer NOT NULL,
	"parent_type" 					integer NOT NULL,
	"parent_notes" 					text,
	CONSTRAINT parent_pk
		PRIMARY KEY ("parent_id"),
	CONSTRAINT parent_fk0
		FOREIGN KEY ("individual_id")
		REFERENCES "individual"("individual_id"),
	CONSTRAINT parent_fk1
		FOREIGN KEY ("parent_individual_id")
		REFERENCES "individual"("individual_id"),
	CONSTRAINT parent_fk2
		FOREIGN KEY ("parent_type_id")
		REFERENCES "individual"("individual_id")
) WITH (
	OIDS=FALSE
);

CREATE TABLE "family" (
	"family_id" serial NOT NULL,
	"family_head_1_id" integer NOT NULL,
	"family_head_2_id" integer,
	"family_name" varchar NOT NULL,
	"family_description" varchar,
	"family_date_start" DATE NOT NULL,
	"family_date_end" DATE,
	"family_notes_other" varchar,
	CONSTRAINT family_pk PRIMARY KEY ("family_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "relationship" (
	"relationship_id" serial NOT NULL,
	"relationship_type_id" integer NOT NULL,
	"family_id" integer NOT NULL,
	"individual_1_id" integer NOT NULL,
	"individual_2_id" integer NOT NULL,
	"Inidividual_1_role_id" integer NOT NULL,
	"Inidividual_2_role_id" integer NOT NULL,
	"relationship_date_start" DATE NOT NULL,
	"relationship_date_end" DATE,
	"relationship_notes" varchar,
	CONSTRAINT relationship_pk PRIMARY KEY ("relationship_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "occupation_type" (
	"occupation_type_id" serial NOT NULL,
	"profession_name" varchar NOT NULL,
	"profession_description" varchar,
	"profession_notes" varchar,
	CONSTRAINT occupation_type_pk PRIMARY KEY ("occupation_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "occupation" (
	"occupation_id" serial NOT NULL,
	"individual_id" integer NOT NULL,
	"occupation_type_id" integer NOT NULL,
	"profession_date_start" DATE NOT NULL,
	"profession_date_end" DATE,
	"profession_notes" varchar,
	CONSTRAINT occupation_pk PRIMARY KEY ("occupation_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "family_event" (
	"family_event_id" serial NOT NULL,
	"family_id" serial NOT NULL,
	"family_event_name" varchar NOT NULL,
	"family_event_date" DATE,
	"family_event_notes" varchar,
	CONSTRAINT family_event_pk PRIMARY KEY ("family_event_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "health_condition" (
	"health_condition_id" serial NOT NULL,
	"individual_id" integer NOT NULL,
	"health_condition_type_id" integer NOT NULL,
	"health_condition_notes" varchar,
	CONSTRAINT health_condition_pk PRIMARY KEY ("health_condition_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "health_condition_type" (
	"health_condition_type_id" serial NOT NULL,
	"health_condition_type_name" varchar NOT NULL,
	"health_condition_type_notes" varchar,
	CONSTRAINT health_condition_type_pk PRIMARY KEY ("health_condition_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "relationship_type" (
	"relationship_type_id" serial NOT NULL,
	"relationship_type_name" varchar NOT NULL,
	"relationship_type_notes" varchar,
	CONSTRAINT relationship_type_pk PRIMARY KEY ("relationship_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "education" (
	"education_id" serial NOT NULL,
	"individual_id" integer NOT NULL,
	"education_type_id" integer NOT NULL,
	"education_name" varchar,
	"education_institution" varchar,
	"education_field" varchar,
	"education_notes" varchar,
	CONSTRAINT education_pk PRIMARY KEY ("education_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "individual_memory" (
	"individual_memory_id" serial NOT NULL,
	"individual_id" integer NOT NULL,
	"individual_memory_name" varchar NOT NULL,
	"individual_memory_date" DATE,
	"individual_memory_notes" varchar,
	"individual_memory_object" bit,
	CONSTRAINT individual_memory_pk PRIMARY KEY ("individual_memory_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "education_type" (
	"education_type_id" serial NOT NULL,
	"education_type_name" varchar NOT NULL,
	"education_type_notes" varchar,
	CONSTRAINT education_type_pk PRIMARY KEY ("education_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "family_event_object" (
	"family_event_object_id" serial NOT NULL,
	"family_event_id" serial NOT NULL,
	"family_event_object_name" varchar NOT NULL,
	"family_event_object_file" bit NOT NULL,
	"family_event_object_notes" varchar,
	"family_event_object_type" integer NOT NULL,
	CONSTRAINT family_event_object_pk PRIMARY KEY ("family_event_object_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "object_type" (
	"object_type_id" serial NOT NULL,
	"object_type_name" varchar NOT NULL,
	"object_type_notes" varchar,
	CONSTRAINT object_type_pk PRIMARY KEY ("object_type_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "individual_memory_object" (
	"individual_memory_object_id" serial NOT NULL,
	"object_type_id" integer NOT NULL,
	"individual_memory_id" integer NOT NULL,
	CONSTRAINT individual_memory_object_pk PRIMARY KEY ("individual_memory_object_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "role_type" (
	"role_type_id" serial NOT NULL,
	"role_type_name" varchar NOT NULL,
	"role_type_notes" varchar NOT NULL,
	CONSTRAINT role_type_pk PRIMARY KEY ("role_type_id")
) WITH (
  OIDS=FALSE
);



ALTER TABLE "individual" ADD CONSTRAINT "individual_fk0" FOREIGN KEY ("parent_1_id") REFERENCES "individual"("individual_id");
ALTER TABLE "individual" ADD CONSTRAINT "individual_fk1" FOREIGN KEY ("parent_2_id") REFERENCES "individual"("individual_id");

ALTER TABLE "family" ADD CONSTRAINT "family_fk0" FOREIGN KEY ("family_head_1_id") REFERENCES "individual"("individual_id");
ALTER TABLE "family" ADD CONSTRAINT "family_fk1" FOREIGN KEY ("family_head_2_id") REFERENCES "individual"("individual_id");

ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk0" FOREIGN KEY ("relationship_type_id") REFERENCES "relationship_type"("relationship_type_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk1" FOREIGN KEY ("family_id") REFERENCES "family"("family_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk2" FOREIGN KEY ("individual_1_id") REFERENCES "individual"("individual_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk3" FOREIGN KEY ("individual_2_id") REFERENCES "individual"("individual_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk4" FOREIGN KEY ("Inidividual_1_role_id") REFERENCES "role_type"("role_type_id");
ALTER TABLE "relationship" ADD CONSTRAINT "relationship_fk5" FOREIGN KEY ("Inidividual_2_role_id") REFERENCES "role_type"("role_type_id");


ALTER TABLE "occupation" ADD CONSTRAINT "occupation_fk0" FOREIGN KEY ("individual_id") REFERENCES "individual"("individual_id");
ALTER TABLE "occupation" ADD CONSTRAINT "occupation_fk1" FOREIGN KEY ("occupation_type_id") REFERENCES "occupation_type"("occupation_type_id");

ALTER TABLE "family_event" ADD CONSTRAINT "family_event_fk0" FOREIGN KEY ("family_id") REFERENCES "family"("family_id");

ALTER TABLE "health_condition" ADD CONSTRAINT "health_condition_fk0" FOREIGN KEY ("individual_id") REFERENCES "individual"("individual_id");
ALTER TABLE "health_condition" ADD CONSTRAINT "health_condition_fk1" FOREIGN KEY ("health_condition_type_id") REFERENCES "health_condition_type"("health_condition_type_id");



ALTER TABLE "education" ADD CONSTRAINT "education_fk0" FOREIGN KEY ("individual_id") REFERENCES "individual"("individual_id");
ALTER TABLE "education" ADD CONSTRAINT "education_fk1" FOREIGN KEY ("education_type_id") REFERENCES "education_type"("education_type_id");

ALTER TABLE "individual_memory" ADD CONSTRAINT "individual_memory_fk0" FOREIGN KEY ("individual_id") REFERENCES "individual"("individual_id");


ALTER TABLE "family_event_object" ADD CONSTRAINT "family_event_object_fk0" FOREIGN KEY ("family_event_id") REFERENCES "family_event"("family_event_id");
ALTER TABLE "family_event_object" ADD CONSTRAINT "family_event_object_fk1" FOREIGN KEY ("family_event_object_type") REFERENCES "object_type"("object_type_id");


ALTER TABLE "individual_memory_object" ADD CONSTRAINT "individual_memory_object_fk0" FOREIGN KEY ("object_type_id") REFERENCES "object_type"("object_type_id");
ALTER TABLE "individual_memory_object" ADD CONSTRAINT "individual_memory_object_fk1" FOREIGN KEY ("individual_memory_id") REFERENCES "individual_memory"("individual_memory_id");
