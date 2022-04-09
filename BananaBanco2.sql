CREATE DATABASE bd_escola;

USE bd_escola;

CREATE TABLE tb_aluno
(
id_aluno int unsigned not null auto_increment,
nm_aluno varchar(45),
ds_prontuario varchar(45),
dt_nascimento DATE,
PRIMARY KEY (id_aluno)
);
CREATE TABLE tb_curso
(
id_curso int unsigned not null auto_increment,
nm_curso varchar(45),
ds_sigla varchar(5),
ds_data_periodo ENUM('BIM', 'SEM') not null,
tp_duracao TINYINT unsigned not null,
dt_inicio DATE,
ds_periodo ENUM('mat', 'vesp', 'noturno'),
PRIMARY KEY (id_curso)
);
CREATE TABLE tb_matricula
(
id_matricula int unsigned not null auto_increment,
tp_situacao ENUM('MATRIC', 'CONCLU'),
id_aluno int unsigned default null,
id_curso int unsigned default null,
PRIMARY KEY(id_matricula),
constraint fk_aluno foreign key (id_aluno) references tb_aluno (id_aluno),
constraint fk_curso foreign key (id_curso) references tb_curso (id_curso)
);
CREATE TABLE tb_area
(
id_area int unsigned not null auto_increment,
nm_area varchar(45),
PRIMARY KEY (id_area)
);
CREATE TABLE tb_materia
(
id_materia int unsigned not null auto_increment,
nm_materia varchar(45),
ds_sigla varchar(5),
ds_semestre TINYINT,
qt_aluas_semana INT,
qt_total_aulas INT,
id_curso int unsigned default null,
id_area int unsigned default null,
PRIMARY KEY (id_materia),
constraint fk_curso foreign key (id_curso) references tb_curso (id_curso),
constraint fk_area foreign key (id_area) references tb_area (id_area)
);
CREATE TABLE tb_aluno_materia
(
id_aluno_materia int unsigned not null auto_increment,
id_aluno int unsigned default null,
id_materia int unsigned default null,
ds_situacao varchar(45) not null,
PRIMARY KEY(id_aluno_materia),
constraint fk_aluno foreign key (id_aluno) references tb_aluno (id_aluno),
constraint fk_materia foreign key (id_materia) references tb_materia (id_materia)
);
CREATE TABLE tb_turma
(
id_turma int unsigned not null auto_increment,
cd_turmal char(2),
id_materia int unsigned default null,
PRIMARY KEY (id_turma),
constraint fk_materia foreign key (id_materia) references tb_materia (id_materia)
);
CREATE TABLE tb_aluno_turma
(
id_aluno_turma varchar(45) not null,
id_aluno int unsigned default null,
id_turma int unsigned default null,
ds_situacao varchar(45) not null,
PRIMARY KEY(id_aluno_turma),
constraint fk_aluno foreign key (id_aluno) references tb_aluno (id_aluno),
constraint fk_turma foreign key (id_turma) references tb_turma (id_turma)
);
CREATE TABLE tb_aluno
(
id_aluno int unsigned not null auto_increment,
nm_aluno varchar(45),
ds_prontuario varchar(45),
dt_nascimento DATE,
PRIMARY KEY (id_aluno)
);

