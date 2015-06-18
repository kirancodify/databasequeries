---- Versioning concept in two different data sources---

----Create two tables :

		table.schemaName = "SCHEMANAME";
		table.tableType = COLUMNSTORE;
		table.description = "ERP Material";
		table.columns = [
		 					{ name = "MaterialId"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "MaterialDesc"; sqlType = NVARCHAR; nullable = false; length =10;}, 
		 					{ name = "PlantId"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "Source"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "StandardPrice"; sqlType = DECIMAL; nullable = false; precision = 15; scale = 2; defaultValue = "0";} 
		 					];
		 					
		table.primaryKey.pkcolumns = ["MaterialId"];
		
		table.schemaName = "SCHEMANAME";
		table.tableType = COLUMNSTORE;
		table.description = "PLC Material";
		table.columns = [
		 					{ name = "MaterialId"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "MaterialDesc"; sqlType = NVARCHAR; nullable = false; length =10;}, 
		 					{ name = "PlantId"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "Source"; sqlType = NVARCHAR; nullable = false; length =10;},
		 					{ name = "StandardPrice"; sqlType = DECIMAL; nullable = false; precision = 15; scale = 2; defaultValue = "0";} 
		 					
		 					];
		 					
		table.primaryKey.pkcolumns = ["MaterialId"];
----Insert Data into two tables with common values
	
		//ERP TABLE:
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('P-100','Pump','1000','ERP',50);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('A-100','Axil','1000','ERP',10);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('B-100','Bolt','1000','ERP',30);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('C-100','Crank','1000','ERP',30);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('D-100','Dirt','1000','ERP',60);
		Insert into "SCHEMA"."package.userId.application.data::materialERP" values('F-100','Fan','1000','ERP',70);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('G-100','Gel','1000','ERP',70);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('H-100','Hammer','1000','ERP',70);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('I-100','I-Plank','1000','ERP',90);
		insert into "SCHEMA"."package.userId.application.data::materialERP" values('J-100','Jack','1000','ERP',100);
		
		//PLC TABLE:
		insert into "SCHEMA"."package.userId.application.data::materialPLC" values('P-100','Pump','1000','PLC',75);
		insert into "SCHEMA"."package.userId.application.data::materialPLC" values('A-100','Axil','1000','PLC',15);
		insert into "SCHEMA"."package.userId.application.data::materialPLC" values('B-100','Bolt','1000','PLC',35);
		insert into "SCHEMA"."package.userId.application.data::materialPLC" values('N-100','Nut','1000','PLC',90);
		insert into "SCHEMA"."package.userId.application.data::materialPLC" values('O-100','Oil','1000','PLC',100);

-----Database Trigger
	
		CREATE TRIGGER Material_Trigger_Insert_Update
		AFTER INSERT OR UPDATE ON "SCHEMA"."package.userId.application.data::materialERP"
		REFERENCING NEW ROW newmaterialid
		FOR EACH ROW
		WHEN (NEW.ID > 0)
		BEGIN
		DELETE FROM "SCHEMA"."package.userId.application.data::materialPLC"
		WHERE "SCHEMA"."package.userId.application.data::materialPLC"."MaterialId" = :newmaterialid."MaterialId";
		END;
		
		CREATE TRIGGER Material_Trigger_Delete
		AFTER DELETE ON "SCHEMA"."package.userId.application.data::materialERP"
		REFERENCING OLD ROW oldmaterialid
		FOR EACH ROW
		BEGIN
		DELETE FROM "SCHEMA"."package.userId.application.data::materialPLC"
		WHERE "SCHEMA"."package.userId.application.data::materialPLC"."MaterialId" = :oldmaterialid."MaterialId";
		END;
		
-----		Testing : insert into "SCHEMA"."package.userId.application.data::materialERP" values('N-100','Nut','1000','PLC',77);
		
-----SQL Query
		
		(SELECT * FROM "SCHEMA"."package.userId.application.data::materialERP")union (select * from "SCHEMA"."package.userId.application.data::materialPLC");



