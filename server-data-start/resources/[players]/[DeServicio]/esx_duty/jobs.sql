INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offambulance','Off-Duty')
  ('offmechanic','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Cadete',12,'{}','{}'),
  ('offpolice',1,'officer','Oficial',24,'{}','{}'),
  ('offpolice',2,'officer2','Oficial II',36,'{}','{}'),
  ('offpolice',3,'officer3','Oficial III',48,'{}','{}'),
  ('offpolice',4,'detective','Detective',0,'{}','{}'),
  ('offpolice',5,'sergeant','Sargento',12,'{}','{}'),
  ('offpolice',6,'lieutenant','Teniente',24,'{}','{}'),
  ('offpolice',7,'commander','Comandante',36,'{}','{}'),
  ('offpolice',8,'subcaptain','Sub Capitan',48,'{}','{}'),
  ('offpolice',9,'captain','Capitan',0,'{}','{}'),
  ('offpolice',10,'adjboss','Jefe Adjunto',12,'{}','{}'),
  ('offpolice',11,'boss','Jefe de Policia',24,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulance',12,'{}','{}'),
  ('offambulance',1,'doctor','Doctor',24,'{}','{}'),
  ('offambulance',2,'chief_doctor','Chef',36,'{}','{}'),
  ('offambulance',3,'boss','Boss',48,'{}','{}')
  ('offmechanic',0,'recrue','Aprendiz',12,'{}','{}'),
  ('offmechanic',1,'novice','Empleado',24,'{}','{}'),
  ('offmechanic',2,'experimente','Veterano',36,'{}','{}'),
  ('offmechanic',3,'chief','Encargado',48,'{}','{}'),
  ('offmechanic',4,'boss','Jefe',48,'{}','{}')
;