PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app" varchar(255) NOT NULL, "name" varchar(255) NOT NULL, "applied" datetime NOT NULL);
INSERT INTO django_migrations VALUES(1,'contenttypes','0001_initial','2022-08-14 19:57:26.319122');
INSERT INTO django_migrations VALUES(2,'auth','0001_initial','2022-08-14 19:57:26.353127');
INSERT INTO django_migrations VALUES(3,'admin','0001_initial','2022-08-14 19:57:26.376133');
INSERT INTO django_migrations VALUES(4,'admin','0002_logentry_remove_auto_add','2022-08-14 19:57:26.400144');
INSERT INTO django_migrations VALUES(5,'admin','0003_logentry_add_action_flag_choices','2022-08-14 19:57:26.425143');
INSERT INTO django_migrations VALUES(6,'contenttypes','0002_remove_content_type_name','2022-08-14 19:57:26.467151');
INSERT INTO django_migrations VALUES(7,'auth','0002_alter_permission_name_max_length','2022-08-14 19:57:26.490157');
INSERT INTO django_migrations VALUES(8,'auth','0003_alter_user_email_max_length','2022-08-14 19:57:26.511165');
INSERT INTO django_migrations VALUES(9,'auth','0004_alter_user_username_opts','2022-08-14 19:57:26.527164');
INSERT INTO django_migrations VALUES(10,'auth','0005_alter_user_last_login_null','2022-08-14 19:57:26.552172');
INSERT INTO django_migrations VALUES(11,'auth','0006_require_contenttypes_0002','2022-08-14 19:57:26.561174');
INSERT INTO django_migrations VALUES(12,'auth','0007_alter_validators_add_error_messages','2022-08-14 19:57:26.584180');
INSERT INTO django_migrations VALUES(13,'auth','0008_alter_user_username_max_length','2022-08-14 19:57:26.608183');
INSERT INTO django_migrations VALUES(14,'auth','0009_alter_user_last_name_max_length','2022-08-14 19:57:26.630188');
INSERT INTO django_migrations VALUES(15,'auth','0010_alter_group_name_max_length','2022-08-14 19:57:26.651194');
INSERT INTO django_migrations VALUES(16,'auth','0011_update_proxy_permissions','2022-08-14 19:57:26.666198');
INSERT INTO django_migrations VALUES(17,'auth','0012_alter_user_first_name_max_length','2022-08-14 19:57:26.690203');
INSERT INTO django_migrations VALUES(18,'sessions','0001_initial','2022-08-14 19:57:26.711208');
INSERT INTO django_migrations VALUES(19,'pharmaceutics','0001_initial','2022-08-14 20:00:20.136818');
INSERT INTO django_migrations VALUES(20,'pharmaceutics','0002_molecule_litpka','2022-08-14 20:08:38.454212');
INSERT INTO django_migrations VALUES(21,'pharmaceutics','0003_alter_molecule_functionalgroups_alter_molecule_logp','2022-08-14 20:11:36.502267');
INSERT INTO django_migrations VALUES(22,'pharmaceutics','0004_rename_litpka_molecule_literaturepka_and_more','2022-08-14 20:15:44.227415');
INSERT INTO django_migrations VALUES(23,'pharmaceutics','0005_molecule_reference','2022-08-14 20:34:24.854221');
INSERT INTO django_migrations VALUES(24,'pharmaceutics','0006_remove_molecule_functionalgroups_and_more','2022-08-15 18:07:46.741428');
CREATE TABLE IF NOT EXISTS "auth_group_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "group_id" integer NOT NULL REFERENCES "auth_group" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "permission_id" integer NOT NULL REFERENCES "auth_permission" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "django_admin_log" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "action_time" datetime NOT NULL, "object_id" text NULL, "object_repr" varchar(200) NOT NULL, "change_message" text NOT NULL, "content_type_id" integer NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED, "action_flag" smallint unsigned NOT NULL CHECK ("action_flag" >= 0));
CREATE TABLE IF NOT EXISTS "django_content_type" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "app_label" varchar(100) NOT NULL, "model" varchar(100) NOT NULL);
INSERT INTO django_content_type VALUES(1,'admin','logentry');
INSERT INTO django_content_type VALUES(2,'auth','permission');
INSERT INTO django_content_type VALUES(3,'auth','group');
INSERT INTO django_content_type VALUES(4,'auth','user');
INSERT INTO django_content_type VALUES(5,'contenttypes','contenttype');
INSERT INTO django_content_type VALUES(6,'sessions','session');
INSERT INTO django_content_type VALUES(7,'pharmaceutics','protein');
INSERT INTO django_content_type VALUES(8,'pharmaceutics','aminoacid');
INSERT INTO django_content_type VALUES(9,'pharmaceutics','molecule');
INSERT INTO django_content_type VALUES(10,'pharmaceutics','molecule_fg_pka');
INSERT INTO django_content_type VALUES(11,'pharmaceutics','functionalgroup');
CREATE TABLE IF NOT EXISTS "auth_permission" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "content_type_id" integer NOT NULL REFERENCES "django_content_type" ("id") DEFERRABLE INITIALLY DEFERRED, "codename" varchar(100) NOT NULL, "name" varchar(255) NOT NULL);
INSERT INTO auth_permission VALUES(1,1,'add_logentry','Can add log entry');
INSERT INTO auth_permission VALUES(2,1,'change_logentry','Can change log entry');
INSERT INTO auth_permission VALUES(3,1,'delete_logentry','Can delete log entry');
INSERT INTO auth_permission VALUES(4,1,'view_logentry','Can view log entry');
INSERT INTO auth_permission VALUES(5,2,'add_permission','Can add permission');
INSERT INTO auth_permission VALUES(6,2,'change_permission','Can change permission');
INSERT INTO auth_permission VALUES(7,2,'delete_permission','Can delete permission');
INSERT INTO auth_permission VALUES(8,2,'view_permission','Can view permission');
INSERT INTO auth_permission VALUES(9,3,'add_group','Can add group');
INSERT INTO auth_permission VALUES(10,3,'change_group','Can change group');
INSERT INTO auth_permission VALUES(11,3,'delete_group','Can delete group');
INSERT INTO auth_permission VALUES(12,3,'view_group','Can view group');
INSERT INTO auth_permission VALUES(13,4,'add_user','Can add user');
INSERT INTO auth_permission VALUES(14,4,'change_user','Can change user');
INSERT INTO auth_permission VALUES(15,4,'delete_user','Can delete user');
INSERT INTO auth_permission VALUES(16,4,'view_user','Can view user');
INSERT INTO auth_permission VALUES(17,5,'add_contenttype','Can add content type');
INSERT INTO auth_permission VALUES(18,5,'change_contenttype','Can change content type');
INSERT INTO auth_permission VALUES(19,5,'delete_contenttype','Can delete content type');
INSERT INTO auth_permission VALUES(20,5,'view_contenttype','Can view content type');
INSERT INTO auth_permission VALUES(21,6,'add_session','Can add session');
INSERT INTO auth_permission VALUES(22,6,'change_session','Can change session');
INSERT INTO auth_permission VALUES(23,6,'delete_session','Can delete session');
INSERT INTO auth_permission VALUES(24,6,'view_session','Can view session');
INSERT INTO auth_permission VALUES(25,7,'add_protein','Can add protein');
INSERT INTO auth_permission VALUES(26,7,'change_protein','Can change protein');
INSERT INTO auth_permission VALUES(27,7,'delete_protein','Can delete protein');
INSERT INTO auth_permission VALUES(28,7,'view_protein','Can view protein');
INSERT INTO auth_permission VALUES(29,8,'add_aminoacid','Can add amino acid');
INSERT INTO auth_permission VALUES(30,8,'change_aminoacid','Can change amino acid');
INSERT INTO auth_permission VALUES(31,8,'delete_aminoacid','Can delete amino acid');
INSERT INTO auth_permission VALUES(32,8,'view_aminoacid','Can view amino acid');
INSERT INTO auth_permission VALUES(33,9,'add_molecule','Can add molecule');
INSERT INTO auth_permission VALUES(34,9,'change_molecule','Can change molecule');
INSERT INTO auth_permission VALUES(35,9,'delete_molecule','Can delete molecule');
INSERT INTO auth_permission VALUES(36,9,'view_molecule','Can view molecule');
INSERT INTO auth_permission VALUES(37,10,'add_molecule_fg_pka','Can add molecule_f g_p ka');
INSERT INTO auth_permission VALUES(38,10,'change_molecule_fg_pka','Can change molecule_f g_p ka');
INSERT INTO auth_permission VALUES(39,10,'delete_molecule_fg_pka','Can delete molecule_f g_p ka');
INSERT INTO auth_permission VALUES(40,10,'view_molecule_fg_pka','Can view molecule_f g_p ka');
INSERT INTO auth_permission VALUES(41,11,'add_functionalgroup','Can add functional group');
INSERT INTO auth_permission VALUES(42,11,'change_functionalgroup','Can change functional group');
INSERT INTO auth_permission VALUES(43,11,'delete_functionalgroup','Can delete functional group');
INSERT INTO auth_permission VALUES(44,11,'view_functionalgroup','Can view functional group');
CREATE TABLE IF NOT EXISTS "auth_group" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(150) NOT NULL UNIQUE);
CREATE TABLE IF NOT EXISTS "auth_user" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "password" varchar(128) NOT NULL, "last_login" datetime NULL, "is_superuser" bool NOT NULL, "username" varchar(150) NOT NULL UNIQUE, "last_name" varchar(150) NOT NULL, "email" varchar(254) NOT NULL, "is_staff" bool NOT NULL, "is_active" bool NOT NULL, "date_joined" datetime NOT NULL, "first_name" varchar(150) NOT NULL);
INSERT INTO auth_user VALUES(1,'pbkdf2_sha256$320000$DzqoWNMZdQ1neS7A8VYyZG$qVoufT+aWLE9MbFAy85OKiPBZVakT+3f/07GlqCGumE=','2022-08-14 20:03:00.617364',1,'harold','','haroldng@usc.edu',1,1,'2022-08-14 20:02:38.779256','');
CREATE TABLE IF NOT EXISTS "django_session" ("session_key" varchar(40) NOT NULL PRIMARY KEY, "session_data" text NOT NULL, "expire_date" datetime NOT NULL);
INSERT INTO django_session VALUES('dlnfrnpzsp8nodvgaios38vlg3lx3fjw','.eJxVjDsOwjAQBe_iGlnxZ_2hpOcM1q69xgGUSHFSIe4OkVJA-2bmvUTCbW1p67yksYizUOL0uxHmB087KHecbrPM87QuI8ldkQft8joXfl4O9--gYW_fOriKynoaiK0m8AqRI-UQ2HPOZF2MYIDrYDVrXRgCBA_GGA9Vc3Di_QHxWDe8:1oNJp6:lmz5YUv0IohtxDG0t-Fr0ohE_ctp2es3xiCOUSSMPqk','2022-08-28 20:03:00.624367');
CREATE TABLE IF NOT EXISTS "pharmaceutics_functionalgroup" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" varchar(15) NOT NULL, "ionizable" bool NOT NULL, "polar" bool NOT NULL, "parent_pKa" real NOT NULL, "aromatic" bool NOT NULL);
CREATE TABLE IF NOT EXISTS "pharmaceutics_protein" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Name" varchar(50) NOT NULL);
CREATE TABLE IF NOT EXISTS "pharmaceutics_molecule_fg_pka" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "index" integer NOT NULL, "pKa" real NOT NULL, "pKa_type" varchar(7) NOT NULL, "FunctionalGroup_id" bigint NOT NULL REFERENCES "pharmaceutics_functionalgroup" ("id") DEFERRABLE INITIALLY DEFERRED, "Molecule_id" bigint NOT NULL REFERENCES "pharmaceutics_molecule" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "pharmaceutics_aminoacid" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "ionizable" bool NOT NULL, "polar" bool NOT NULL, "aromatic" bool NOT NULL, "full_carbon_count" integer NOT NULL, "branched" bool NOT NULL, "essential" bool NOT NULL, "singlet_code" varchar(1) NOT NULL, "triplet_code" varchar(3) NOT NULL, "charge" varchar(9) NOT NULL, "sulfur" bool NOT NULL, "volume" varchar(11) NOT NULL, "Molecule_id" bigint NOT NULL UNIQUE REFERENCES "pharmaceutics_molecule" ("id") DEFERRABLE INITIALLY DEFERRED);
CREATE TABLE IF NOT EXISTS "pharmaceutics_molecule" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "Molecule_Name" varchar(50) NOT NULL, "SMILES" varchar(200) NOT NULL, "LiteraturePka" real NULL, "Reference" varchar(9) NOT NULL, "Difficulty" varchar(1000) NOT NULL);
INSERT INTO pharmaceutics_molecule VALUES(1,'Acetaminophen','CC(=O)NC1=CC=C(C=C1)O',9.580000000000000071,'doi.org/10.1016/j.chroma.2013.01.018','easy');
INSERT INTO pharmaceutics_molecule VALUES(2,'Allopurinol','C1=NNC2=C1C(=O)NC=N2',9.3000000000000007105,'https://www.accessdata.fda.gov/drugsatfda_docs/label/2020/020298s010lbl.pdf','hard');
INSERT INTO pharmaceutics_molecule VALUES(3,'Amitriptyline','CN(C)CCC=C1C2=CC=CC=C2CCC3=CC=CC=C31',9.4000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(4,'Amlodipine','CCOC(=O)C1=C(NC(=C(C1C2=CC=CC=C2Cl)C(=O)OC)C)COCCN',8.5999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(5,'Amphetamine ','CC(CC1=CC=CC=C1)N',9.9000000000000003552,'accessdata.fda.gov/drugsatfda_docs/label/2013/021303s026lbl.pdf','easy');
INSERT INTO pharmaceutics_molecule VALUES(6,'Aspirin','CC(=O)OC1=CC=CC=C1C(=O)O',3.5600000000000000532,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(7,'Atenolol','CC(C)NCC(COC1=CC=C(C=C1)CC(=O)N)O',9.5999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(8,'Atomoxetine','CC1=CC=CC=C1OC(CCNC)C2=CC=CC=C2',10.099999999999999644,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(9,'Atorvastatin','CC(C)C1=C(C(=C(N1CCC(CC(CC(=O)O)O)O)C2=CC=C(C=C2)F)C3=CC=CC=C3)C(=O)NC4=CC=CC=C4',4.4599999999999999644,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(10,'Azelastine','CN1CCCC(CC1)N2C(=O)C3=CC=CC=C3C(=N2)CC4=CC=C(C=C4)Cl',9.8200000000000002842,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(11,'Benazepril','CCOC(=O)C(CCC1=CC=CC=C1)NC2CCC3=CC=CC=C3N(C2=O)CC(=O)O',3.7299999999999999822,'doi.org/10.1016/j.ejpb.2015.02.028','easy');
INSERT INTO pharmaceutics_molecule VALUES(12,'Benztropine','CN1C2CCC1CC(C2)OC(C3=CC=CC=C3)C4=CC=CC=C4',10.0,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(13,'Bisoprolol','CC(C)NCC(COC1=CC=C(C=C1)COCCOC(C)C)O',9.5700000000000002842,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(14,'Buspirone','C1CCC2(C1)CC(=O)N(C(=O)C2)CCCCN3CCN(CC3)C4=NC=CC=N4',7.5999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(15,'Celecoxib','CC1=CC=C(C=C1)C2=CC(=NN2C3=CC=C(C=C3)S(=O)(=O)N)C(F)(F)F',11.099999999999999644,'accessdata.fda.gov/drugsatfda_docs/label/2021/020998s056lbl.pdf','hard');
INSERT INTO pharmaceutics_molecule VALUES(16,'Chlorhexidine','C1=CC(=CC=C1NC(=NC(=NCCCCCCN=C(N)N=C(N)NC2=CC=C(C=C2)Cl)N)N)Cl',10.77999999999999936,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(17,'Chlorpheniramine','CN(C)CCC(C1=CC=C(C=C1)Cl)C2=CC=CC=N2',9.1600000000000001421,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(18,'Cimetidine','CC1=C(N=CN1)CSCCNC(=NC)NC#N',7.1100000000000003197,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(19,'Citalopram','CN(C)CCCC1(C2=C(CO1)C=C(C=C2)C#N)C3=CC=C(C=C3)F',9.5,'10.1515/CCLM.2007.108','easy');
INSERT INTO pharmaceutics_molecule VALUES(20,'Clarithromycin','CCC1C(C(C(C(=O)C(CC(C(C(C(C(C(=O)O1)C)OC2CC(C(C(O2)C)O)(C)OC)C)OC3C(C(CC(O3)C)N(C)C)O)(C)OC)C)C)O)(C)O',8.9900000000000002131,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(21,'Clindamycin','CCCC1CC(N(C1)C)C(=O)NC(C2C(C(C(C(O2)SC)O)O)O)C(C)Cl',7.7199999999999997513,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(22,'Clonidine','C1CN=C(N1)NC2=C(C=CC=C2Cl)Cl',8.2599999999999997868,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(23,'Clotrimazole','C1=CC=C(C=C1)C(C2=CC=CC=C2)(C3=CC=CC=C3Cl)N4C=CN=C4',4.7000000000000001776,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(24,'Clozapine','CN1CCN(CC1)C2=NC3=C(C=CC(=C3)Cl)NC4=CC=CC=C42',7.6299999999999998934,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(25,'Codeine','CN1CCC23C4C1CC5=C2C(=C(C=C5)OC)OC3C(C=C4)O',8.2200000000000006394,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(26,'Colchicine','CC(=O)NC1CCC2=CC(=C(C(=C2C3=CC=C(C(=O)C=C13)OC)OC)OC)OC',1.8500000000000000888,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(27,'Cyclobenzaprine','CN(C)CCC=C1C2=CC=CC=C2C=CC3=CC=CC=C31',8.4700000000000006394,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(28,'Cyclosporin','CCC1C(=O)N(CC(=O)N(C(C(=O)NC(C(=O)N(C(C(=O)NC(C(=O)NC(C(=O)N(C(C(=O)N(C(C(=O)N(C(C(=O)N(C(C(=O)N1)C(C(C)CC=CC)O)C)C(C)C)C)CC(C)C)C)CC(C)C)C)C)C)CC(C)C)C)C(C)C)CC(C)C)C)C',6.9000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(29,'Dextromethorphan','CN1CCC23CCCCC2C1CC4=C3C=C(C=C4)OC',8.3000000000000007105,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(30,'Diazepam','CN1C(=O)CN=C(C2=C1C=CC(=C2)Cl)C3=CC=CC=C3',3.2999999999999998223,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(31,'Diclofenac','C1=CC=C(C(=C1)CC(=O)O)NC2=C(C=CC=C2Cl)Cl',3.9900000000000002131,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(32,'Dicyclomine','CCN(CC)CCOC(=O)C1(CCCCC1)C2CCCCC2',9.0,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(33,'Diphenhydramine','CN(C)CCOC(C1=CC=CC=C1)C2=CC=CC=C2',9.1199999999999992184,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(34,'Doxepin','CN(C)CCC=C1C2=CC=CC=C2COC3=CC=CC=C31',8.9600000000000008526,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(35,'Erythromycin','CCC1C(C(C(C(=O)C(CC(C(C(C(C(C(=O)O1)C)OC2CC(C(C(O2)C)O)(C)OC)C)OC3C(C(CC(O3)C)N(C)C)O)(C)O)C)C)O)(C)O',8.5999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(36,'Escitalopram','CN(C)CCCC1(C2=C(CO1)C=C(C=C2)C#N)C3=CC=C(C=C3)F',9.5,'10.1515/CCLM.2007.108','easy');
INSERT INTO pharmaceutics_molecule VALUES(37,'Ethinyl estradiol','CC12CCC3C(C1CCC2(C#C)O)CCC4=C3C=CC(=C4)O',10.400000000000000355,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(38,'Ezetimibe','C1=CC(=CC=C1C2C(C(=O)N2C3=CC=C(C=C3)F)CCC(C4=CC=C(C=C4)F)O)O',9.6600000000000001421,'doi.org/10.1080%2F10915810500527093','easy');
INSERT INTO pharmaceutics_molecule VALUES(39,'Famotidine','C1=C(N=C(S1)N=C(N)N)CSCCC(=NS(=O)(=O)N)N',6.7599999999999997868,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(40,'Fentanyl','CCC(=O)N(C1CCN(CC1)CCC2=CC=CC=C2)C3=CC=CC=C3',8.4000000000000003552,'accessdata.fda.gov/drugsatfda_docs/label/2014/019813s063lbl.pdf','easy');
INSERT INTO pharmaceutics_molecule VALUES(41,'Fluconazole','C1=CC(=C(C=C1F)F)C(CN2C=NC=N2)(CN3C=NC=N3)O',1.7600000000000000088,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(42,'Fluvoxamine','COCCCCC(=NOCCN)C1=CC=C(C=C1)C(F)(F)F',8.6999999999999992894,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(43,'Furosemide','C1=COC(=C1)CNC2=CC(=C(C=C2C(=O)O)S(=O)(=O)N)Cl',3.7999999999999998223,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(44,'Glimepiride','CCC1=C(CN(C1=O)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCC(CC3)C)C',6.2000000000000001776,'products.sanofi.ca/en/amaryl.pdf','hard');
INSERT INTO pharmaceutics_molecule VALUES(45,'Glipizide','CC1=CN=C(C=N1)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCCCC3',5.9000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(46,'Glyburide','COC1=C(C=C(C=C1)Cl)C(=O)NCCC2=CC=C(C=C2)S(=O)(=O)NC(=O)NC3CCCCC3',5.2999999999999998223,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(47,'Haloperidol','C1CN(CCC1(C2=CC=C(C=C2)Cl)O)CCCC(=O)C3=CC=C(C=C3)F',8.9600000000000008526,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(48,'Hydrocodone','CN1CCC23C4C1CC5=C2C(=C(C=C5)OC)OC3C(=O)CC4',8.3000000000000007105,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(49,'Hydromorphone','CN1CCC23C4C1CC5=C2C(=C(C=C5)O)OC3C(=O)CC4',8.1500000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(50,'Hyoscyamine','CN1C2CCC1CC(C2)OC(=O)C(CO)C3=CC=CC=C3',9.6799999999999997157,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(51,'Ibuprofen','CC(C)CC1=CC=C(C=C1)C(C)C(=O)O',4.4500000000000001776,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(52,'Imipramine','CN(C)CCCN1C2=CC=CC=C2CCC3=CC=CC=C31',9.6199999999999992184,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(53,'Indomethacin','CC1=C(C2=C(N1C(=O)C3=CC=C(C=C3)Cl)C=CC(=C2)OC)CC(=O)O',4.2999999999999998223,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(54,'Lamotrigine','C1=CC(=C(C(=C1)Cl)Cl)C2=C(N=C(N=N2)N)N',5.7000000000000001776,'accessdata.fda.gov/drugsatfda_docs/label/2009/022251,020764s029,020241s036lbl.pdf','hard');
INSERT INTO pharmaceutics_molecule VALUES(55,'Lidocaine','CCN(CC)CC(=O)NC1=C(C=CC=C1C)C',7.9599999999999999644,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(56,'Lisinopril','C1CC(N(C1)C(=O)C(CCCCN)NC(CCC2=CC=CC=C2)C(=O)O)C(=O)O',2.5,'Jatte, K. P., Chakole, R. D., & Charde, M. S. (2021). Degradation profiling of lisinopril and hydrochlorothiazide by RP- HPLC method with QbD approach. Asian Journal of Pharmaceutical Analysis, 11(4) Retrieved from http://libproxy.usc.edu/login?url=https://www.proquest.com/scholarly-journals/degradation-profiling-lisinopril/docview/2618789859/se-2?accountid=14749','easy');
INSERT INTO pharmaceutics_molecule VALUES(57,'Loperamide','CN(C)C(=O)C(CCN1CCC(CC1)(C2=CC=C(C=C2)Cl)O)(C3=CC=CC=C3)C4=CC=CC=C4',8.6600000000000001421,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(58,'Losartan','CCCCC1=NC(=C(N1CC2=CC=C(C=C2)C3=CC=CC=C3C4=NNN=N4)CO)Cl',4.9000000000000003552,'doi.org/10.1016/0731-7085(96)01740-2','hard');
INSERT INTO pharmaceutics_molecule VALUES(59,'Metformin','CN(C)C(=N)N=C(N)N',12.400000000000000355,'https://www.accessdata.fda.gov/drugsatfda_docs/label/2006/021748s002lbl.pdf','hard');
INSERT INTO pharmaceutics_molecule VALUES(60,'Methadone','CCC(=O)C(CC(C)N(C)C)(C1=CC=CC=C1)C2=CC=CC=C2',8.25,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(61,'Methylphenidate','COC(=O)C(C1CCCCN1)C2=CC=CC=C2',8.9000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(62,'Metoprolol','CC(C)NCC(COC1=CC=C(C=C1)CCOC)O',9.5500000000000007105,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(63,'Metronidazole','CC1=NC=C(N1CCO)[N+](=O)[O-]',2.6200000000000001065,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(64,'Minoxidil','C1CCN(CC1)C2=NC(=N)N(C(=C2)N)O',4.6100000000000003197,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(65,'Mirtazepine','CN1CCN2C(C1)C3=CC=CC=C3CC4=C2N=CC=C4',7.0999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(66,'Morphine','CN1CCC23C4C1CC5=C2C(=C(C=C5)O)OC3C(C=C4)O',8.2100000000000008526,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(67,'Naloxone','C=CCN1CCC23C4C(=O)CCC2(C1CC5=C3C(=C(C=C5)O)O4)O',7.9400000000000003907,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(68,'Naltrexone','C1CC1CN2CCC34C5C(=O)CCC3(C2CC6=C4C(=C(C=C6)O)O5)O',8.3800000000000007815,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(69,'Naproxen','CC(C1=CC2=C(C=C1)C=C(C=C2)OC)C(=O)O',4.1500000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(70,'Nitrofurantoin','C1C(=O)NC(=O)N1N=CC2=CC=C(O2)[N+](=O)[O-]',7.0,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(71,'Nortriptyline','CNCCC=C1C2=CC=CC=C2CCC3=CC=CC=C31',10.099999999999999644,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(72,'Ondansetron','CC1=NC=CN1CC2CCC3=C(C2=O)C4=CC=CC=C4N3C',7.4000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(73,'Oxybutynin','CCN(CC)CC#CCOC(=O)C(C1CCCCC1)(C2=CC=CC=C2)O',7.0,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(74,'Oxycodone','CN1CCC23C4C(=O)CCC2(C1CC5=C3C(=C(C=C5)OC)O4)O',8.5299999999999993605,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(75,'Paroxetine','C1CNCC(C1C2=CC=C(C=C2)F)COC3=CC4=C(C=C3)OCO4',9.5099999999999997868,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(76,'Penicillin','CC1(C(N2C(S1)C(C2=O)NC(=O)CC3=CC=CC=C3)C(=O)O)C',2.7299999999999999822,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(77,'Phenazopyridine','C1=CC=C(C=C1)N=NC2=C(N=C(C=C2)N)N',5.1500000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(78,'Phentermine','CC(C)(CC1=CC=CC=C1)N',10.109999999999999431,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(79,'Phenytoin','C1=CC=C(C=C1)C2(C(=O)NC(=O)N2)C3=CC=CC=C3',8.3100000000000004973,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(80,'Promethazine','CC(CN1C2=CC=CC=C2SC3=CC=CC=C31)N(C)C',8.9900000000000002131,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(81,'Propranolol','CC(C)NCC(COC1=CC=CC2=CC=CC=C21)O',9.5299999999999993605,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(82,'Pseudoephedrine','CC(C(C1=CC=CC=C1)O)NC',9.2200000000000006394,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(83,'Risperidone','CC1=C(C(=O)N2CCCCC2=N1)CCN3CCC(CC3)C4=NOC5=C4C=CC(=C5)F',8.1999999999999992894,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(84,'Scopolamine','CN1C2CC(CC1C3C2O3)OC(=O)C(CO)C4=CC=CC=C4',7.5499999999999998223,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(85,'Sertraline','CNC1CCC(C2=CC=CC=C12)C3=CC(=C(C=C3)Cl)Cl',9.4800000000000004263,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(86,'Sildenafil','CCCC1=NN(C2=C1N=C(NC2=O)C3=C(C=CC(=C3)S(=O)(=O)N4CCN(CC4)C)OCC)C',8.6999999999999992894,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(87,'Solifenacin ','C1CN2CCC1C(C2)OC(=O)N3CCC4=CC=CC=C4C3C5=CC=CC=C5',8.5,'DOI: 10.2165/00003088-200948050-00001','easy');
INSERT INTO pharmaceutics_molecule VALUES(88,'Sumatriptan','CNS(=O)(=O)CC1=CC2=C(C=C1)NC=C2CCN(C)C',9.5,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(89,'Tamoxifen','CCC(=C(C1=CC=CC=C1)C2=CC=C(C=C2)OCCN(C)C)C3=CC=CC=C3',8.7100000000000008526,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(90,'Temazepam','CN1C2=C(C=C(C=C2)Cl)C(=NC(C1=O)O)C3=CC=CC=C3',1.6000000000000000888,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(91,'Terazosin','COC1=C(C=C2C(=C1)C(=NC(=N2)N3CCN(CC3)C(=O)C4CCCO4)N)OC',7.0999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(92,'Tramadol','CN(C)CC1CCCCC1(C2=CC(=CC=C2)OC)O',9.4100000000000001421,'accessdata.fda.gov/drugsatfda_docs/label/2010/022370s000lbl.pdf','easy');
INSERT INTO pharmaceutics_molecule VALUES(93,'Trazodone','C1CN(CCN1CCCN2C(=O)N3C=CC=CC3=N2)C4=CC(=CC=C4)Cl',6.7099999999999999644,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(94,'Triamterene','C1=CC=C(C=C1)C2=NC3=C(N=C(N=C3N=C2N)N)N',6.2000000000000001776,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(95,'Valproate','CCCC(CCC)C(=O)O',4.5999999999999996447,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(96,'Venlafaxine','CN(C)CC(C1=CC=C(C=C1)OC)C2(CCCCC2)O',9.5,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(97,'Verapamil','CC(C)C(CCCN(C)CCC1=CC(=C(C=C1)OC)OC)(C#N)C2=CC(=C(C=C2)OC)OC',8.9000000000000003552,'doi.org/10.1016/S0099-5428(07)33001-3','easy');
INSERT INTO pharmaceutics_molecule VALUES(98,'Warfarin','CC(=O)CC(C1=CC=CC=C1)C2=C(C3=CC=CC=C3OC2=O)O',5.0,'doi.org/10.1016/S0099-5428(07)33001-3','hard');
INSERT INTO pharmaceutics_molecule VALUES(99,'Zolmitriptan','CN(C)CCC1=CNC2=C1C=C(C=C2)CC3COC(=O)N3',9.6400000000000005684,'astrazeneca.ca/content/dam/az-ca/downloads/productinformation/zomig-product-monograph-en.pdf','easy');
INSERT INTO pharmaceutics_molecule VALUES(100,'Zolpidem','CC1=CC=C(C=C1)C2=C(N3C=C(C=CC3=N2)C)CC(=O)N(C)C',6.1600000000000001421,'doi.org/10.1016/j.ejps.2020.105534','hard');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('django_migrations',24);
INSERT INTO sqlite_sequence VALUES('django_admin_log',0);
INSERT INTO sqlite_sequence VALUES('django_content_type',11);
INSERT INTO sqlite_sequence VALUES('auth_permission',44);
INSERT INTO sqlite_sequence VALUES('auth_group',0);
INSERT INTO sqlite_sequence VALUES('auth_user',1);
INSERT INTO sqlite_sequence VALUES('pharmaceutics_molecule',100);
CREATE UNIQUE INDEX "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" ("group_id", "permission_id");
CREATE INDEX "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" ("group_id");
CREATE INDEX "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" ("permission_id");
CREATE UNIQUE INDEX "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" ("user_id", "group_id");
CREATE INDEX "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" ("user_id");
CREATE INDEX "auth_user_groups_group_id_97559544" ON "auth_user_groups" ("group_id");
CREATE UNIQUE INDEX "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" ("user_id", "permission_id");
CREATE INDEX "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" ("user_id");
CREATE INDEX "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" ("permission_id");
CREATE INDEX "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" ("content_type_id");
CREATE INDEX "django_admin_log_user_id_c564eba6" ON "django_admin_log" ("user_id");
CREATE UNIQUE INDEX "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" ("app_label", "model");
CREATE UNIQUE INDEX "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" ("content_type_id", "codename");
CREATE INDEX "auth_permission_content_type_id_2f476e4b" ON "auth_permission" ("content_type_id");
CREATE INDEX "django_session_expire_date_a5c62663" ON "django_session" ("expire_date");
CREATE INDEX "pharmaceutics_molecule_fg_pka_FunctionalGroup_id_5e80e549" ON "pharmaceutics_molecule_fg_pka" ("FunctionalGroup_id");
CREATE INDEX "pharmaceutics_molecule_fg_pka_Molecule_id_98c2fa2c" ON "pharmaceutics_molecule_fg_pka" ("Molecule_id");
COMMIT;
