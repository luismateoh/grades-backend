CREATE TABLE "Institucion" (
                               "InstitucionId"  SERIAL  NOT NULL,
                               "Nit" integer   NOT NULL,
                               "Nombre" varchar(50)   NOT NULL,
                               "Telefono" varchar(20)   NOT NULL,
                               "Direccion" varchar(50)   NOT NULL,
                               "Correo" varchar(100)   NOT NULL,
                               CONSTRAINT "pk_Institucion" PRIMARY KEY (
                                                                        "InstitucionId"
                                   )
);

CREATE TABLE "Periodo" (
                           "Fecha_inicio" decimal(12,2)   NOT NULL,
                           "Fecha_fin" integer   NOT NULL,
                           "Anio" integer   NOT NULL,
                           "InstitucionId" integer   NOT NULL,
                           "PeriodoId" integer   NOT NULL
);

CREATE TABLE "Usuario" (
                           "UsuarioId"  SERIAL  NOT NULL,
                           "Identificacion" integer   NOT NULL,
                           "Nombre" varchar(40)   NOT NULL,
                           "Apellido" varchar(50)   NOT NULL,
                           "Telefono" varchar(50)   NOT NULL,
                           "Sexo" varchar(15)   NOT NULL,
                           "Direccion" varchar(50)   NOT NULL,
                           "Correo" varchar(50)   NOT NULL,
                           "contrasena" varchar(50)   NOT NULL,
                           "Rol" varchar(20)   NOT NULL,
                           "Grado" varchar(30)   NOT NULL,
                           "Profesion" varchar(40)   NOT NULL,
                           CONSTRAINT "pk_Usuario" PRIMARY KEY (
                                                                "UsuarioId"
                               )
);

CREATE TABLE "Materias" (
                            "MateriaId" integer   NOT NULL,
                            "Nombre" varchar(40)   NOT NULL,
                            "PeriodoId" integer   NOT NULL,
                            "ProfesorId" integer   NOT NULL,
                            CONSTRAINT "pk_Materias" PRIMARY KEY (
                                                                  "MateriaId"
                                )
);

CREATE TABLE "DefinicionNota" (
                                  "DefinicionNotaId" integer   NOT NULL,
                                  "Descripcion" varchar(100)   NOT NULL,
                                  "Porcentaje" integer   NOT NULL,
                                  "MateriaId" integer   NOT NULL,
                                  CONSTRAINT "pk_DefinicionNota" PRIMARY KEY (
                                                                              "DefinicionNotaId"
                                      )
);

CREATE TABLE "Matriculados" (
                                "MateriaId" integer   NOT NULL,
                                "UsarioId" integer   NOT NULL,
                                CONSTRAINT "pk_Matriculados" PRIMARY KEY (
                                                                          "MateriaId","UsarioId"
                                    )
);

CREATE TABLE "Notas" (
                         "NotaId"  SERIAL  NOT NULL,
                         "DefinicionNotaId" integer   NOT NULL,
                         "UsuarioId" integer   NOT NULL,
                         "Nota" integer   NOT NULL,
                         CONSTRAINT "pk_Notas" PRIMARY KEY (
                                                            "NotaId"
                             )
);

ALTER TABLE "Periodo" ADD CONSTRAINT "fk_Periodo_InstitucionId" FOREIGN KEY("InstitucionId")
    REFERENCES "Institucion" ("InstitucionId");

ALTER TABLE "Materias" ADD CONSTRAINT "fk_Materias_MateriaId" FOREIGN KEY("MateriaId")
    REFERENCES "DefinicionNota" ("MateriaId");

ALTER TABLE "Materias" ADD CONSTRAINT "fk_Materias_PeriodoId" FOREIGN KEY("PeriodoId")
    REFERENCES "Periodo" ("PeriodoId");

ALTER TABLE "Materias" ADD CONSTRAINT "fk_Materias_ProfesorId" FOREIGN KEY("ProfesorId")
    REFERENCES "Usuario" ("UsuarioId");

ALTER TABLE "Matriculados" ADD CONSTRAINT "fk_Matriculados_MateriaId" FOREIGN KEY("MateriaId")
    REFERENCES "Materias" ("MateriaId");

ALTER TABLE "Matriculados" ADD CONSTRAINT "fk_Matriculados_UsarioId" FOREIGN KEY("UsarioId")
    REFERENCES "Usuario" ("UsuarioId");

ALTER TABLE "Notas" ADD CONSTRAINT "fk_Notas_DefinicionNotaId" FOREIGN KEY("DefinicionNotaId")
    REFERENCES "DefinicionNota" ("DefinicionNotaId");

ALTER TABLE "Notas" ADD CONSTRAINT "fk_Notas_UsuarioId" FOREIGN KEY("UsuarioId")
    REFERENCES "Usuario" ("UsuarioId");

