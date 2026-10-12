-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2026-10-11 15:52:15 CLST
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ASOCIACION 
    ( 
     cod_asociacion    NUMBER (6)  NOT NULL , 
     nombre_asociacion VARCHAR2 (100)  NOT NULL , 
     fecha_creacion    DATE  NOT NULL , 
     tipo              VARCHAR2 (1)  NOT NULL 
    ) 
;

ALTER TABLE ASOCIACION 
    ADD CONSTRAINT ASOCIACION_PK PRIMARY KEY ( cod_asociacion ) ;

CREATE TABLE CLUB_FUTBOL 
    ( 
     cod_club                      NUMBER (6)  NOT NULL , 
     nombre_club                   VARCHAR2 (100)  NOT NULL , 
     patrimonio                    NUMBER (14,2)  NOT NULL , 
     direccion                     VARCHAR2 (100)  NOT NULL , 
     ASOCIACION_cod_asociacion     NUMBER (6) , 
     HISTORIAL_CLUB_cod_trabajador NUMBER (6) , 
     HISTORIAL_CLUB_cod_clib       NUMBER 
    ) 
;

ALTER TABLE CLUB_FUTBOL 
    ADD CONSTRAINT CLUB_FUTBOL_PK PRIMARY KEY ( cod_club ) ;

CREATE TABLE COMUNA 
    ( 
     cod_comuna        NUMBER (4)  NOT NULL , 
     nombre_comuna     VARCHAR2 (100)  NOT NULL , 
     cod_region        NUMBER (4)  NOT NULL , 
     REGION_cod_region NUMBER (4)  NOT NULL 
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_PK PRIMARY KEY ( cod_comuna ) ;

CREATE TABLE ESCUELA_FUTBOL 
    ( 
     cod_escuela     NUMBER (6)  NOT NULL , 
     nombre_escuela  VARCHAR2 (100)  NOT NULL , 
     capacidad       NUMBER (6)  NOT NULL , 
     fecha_fundacion DATE  NOT NULL 
    ) 
;

ALTER TABLE ESCUELA_FUTBOL 
    ADD CONSTRAINT ESCUELA_FUTBOL_PK PRIMARY KEY ( cod_escuela ) ;

CREATE TABLE HISTORIAL_CLUB 
    ( 
     cod_trabajador         NUMBER (6)  NOT NULL , 
     cod_clib               NUMBER  NOT NULL , 
     fecha_inicio           DATE  NOT NULL , 
     fecha_fin              DATE  NOT NULL , 
     JUGADOR_cod_trabajador NUMBER (6) 
    ) 
;

ALTER TABLE HISTORIAL_CLUB 
    ADD CONSTRAINT HISTORIAL_CLUB_PK PRIMARY KEY ( cod_trabajador, cod_clib ) ;

CREATE TABLE IDIOMA 
    ( 
     cod_idioma                    NUMBER (4)  NOT NULL , 
     nombre_idioma                 VARCHAR2 (50)  NOT NULL , 
     JUGADOR_IDIOMA_cod_tranajador NUMBER (6) , 
     JUGADOR_IDIOMA_cod_idioma     NUMBER (4) 
    ) 
;

ALTER TABLE IDIOMA 
    ADD CONSTRAINT IDIOMA_PK PRIMARY KEY ( cod_idioma ) ;

CREATE TABLE JUGADOR 
    ( 
     cod_trabajador            NUMBER (6)  NOT NULL , 
     cod_trabajador1           NUMBER (6)  NOT NULL , 
     puesto                    VARCHAR2 (30)  NOT NULL , 
     premios_acumulados        NUMBER (12,2)  NOT NULL , 
     cod_escuela               NUMBER (6) , 
     anio_fin_amateur          NUMBER (4) , 
     cod_asociacion            NUMBER (6)  NOT NULL , 
     ASOCIACION_cod_asociacion NUMBER (6)  NOT NULL , 
     cod_escuela1              NUMBER (6)  NOT NULL 
    ) 
;

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_PK PRIMARY KEY ( cod_trabajador ) ;

CREATE TABLE JUGADOR_IDIOMA 
    ( 
     cod_tranajador         NUMBER (6)  NOT NULL , 
     cod_idioma             NUMBER (4)  NOT NULL , 
     nivel_dominio          VARCHAR2 (30)  NOT NULL , 
     JUGADOR_cod_trabajador NUMBER (6) 
    ) 
;

ALTER TABLE JUGADOR_IDIOMA 
    ADD CONSTRAINT JUGADOR_IDIOMA_PK PRIMARY KEY ( cod_tranajador, cod_idioma ) ;

CREATE TABLE NACIONALIDAD 
    ( 
     cod_nacionalidad          NUMBER (6)  NOT NULL , 
     nombre_nacionalidad       VARCHAR2 (50)  NOT NULL , 
     TRABAJADOR_cod_trabajador NUMBER (6) 
    ) 
;

ALTER TABLE NACIONALIDAD 
    ADD CONSTRAINT NACIONALIDAD_PK PRIMARY KEY ( cod_nacionalidad ) ;

CREATE TABLE PERSONAL_PLANTA 
    ( 
     cod_trabajador     NUMBER (6)  NOT NULL , 
     cod_trabajador1    NUMBER (6)  NOT NULL , 
     cantidad_horas     NUMBER (4) , 
     valor_horas_extras NUMBER (10,2) 
    ) 
;

ALTER TABLE PERSONAL_PLANTA 
    ADD CONSTRAINT PERSONAL_PLANTA_PK PRIMARY KEY ( cod_trabajador ) ;

CREATE TABLE REGION 
    ( 
     cod_region    NUMBER (4)  NOT NULL , 
     nombre_region VARCHAR2 (100)  NOT NULL 
    ) 
;

ALTER TABLE REGION 
    ADD CONSTRAINT REGION_PK PRIMARY KEY ( cod_region ) ;

CREATE TABLE TRABAJADOR 
    ( 
     cod_trabajador             NUMBER (6)  NOT NULL , 
     rut                        NUMBER (8)  NOT NULL , 
     dv                         VARCHAR2 (1)  NOT NULL , 
     nombres                    VARCHAR2 (50)  NOT NULL , 
     apellitos                  VARCHAR2 (50)  NOT NULL , 
     sueldo_base                NUMBER (10,2)  NOT NULL , 
     fecha_nacimiento           DATE  NOT NULL , 
     genero                     VARCHAR2 (20)  NOT NULL , 
     estado_civil               VARCHAR2 (20)  NOT NULL , 
     telefono_movil             VARCHAR2 (15)  NOT NULL , 
     direccion                  VARCHAR2 (100)  NOT NULL , 
     cod_comuna                 NUMBER (4)  NOT NULL , 
     COMUNA_cod_comuna          NUMBER (4)  NOT NULL , 
     CLUB_FUTBOL_cod_club       NUMBER (6) , 
     ESCUELA_FUTBOL_cod_escuela NUMBER (6)  NOT NULL , 
     cod_nacionalidad           NUMBER (6)  NOT NULL , 
     TIPO_TRABAJADOR            VARCHAR2 (1) 
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_PK PRIMARY KEY ( cod_trabajador ) ;

ALTER TABLE CLUB_FUTBOL 
    ADD CONSTRAINT CLUB_FUTBOL_ASOCIACION_FK FOREIGN KEY 
    ( 
     ASOCIACION_cod_asociacion
    ) 
    REFERENCES ASOCIACION 
    ( 
     cod_asociacion
    ) 
;

ALTER TABLE CLUB_FUTBOL 
    ADD CONSTRAINT CLUB_FUTBOL_HISTORIAL_CLUB_FK FOREIGN KEY 
    ( 
     HISTORIAL_CLUB_cod_trabajador,
     HISTORIAL_CLUB_cod_clib
    ) 
    REFERENCES HISTORIAL_CLUB 
    ( 
     cod_trabajador,
     cod_clib
    ) 
;

ALTER TABLE COMUNA 
    ADD CONSTRAINT COMUNA_REGION_FK FOREIGN KEY 
    ( 
     REGION_cod_region
    ) 
    REFERENCES REGION 
    ( 
     cod_region
    ) 
;

ALTER TABLE HISTORIAL_CLUB 
    ADD CONSTRAINT HISTORIAL_CLUB_JUGADOR_FK FOREIGN KEY 
    ( 
     JUGADOR_cod_trabajador
    ) 
    REFERENCES JUGADOR 
    ( 
     cod_trabajador
    ) 
;

ALTER TABLE IDIOMA 
    ADD CONSTRAINT IDIOMA_JUGADOR_IDIOMA_FK FOREIGN KEY 
    ( 
     JUGADOR_IDIOMA_cod_tranajador,
     JUGADOR_IDIOMA_cod_idioma
    ) 
    REFERENCES JUGADOR_IDIOMA 
    ( 
     cod_tranajador,
     cod_idioma
    ) 
;

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_ASOCIACION_FK FOREIGN KEY 
    ( 
     ASOCIACION_cod_asociacion
    ) 
    REFERENCES ASOCIACION 
    ( 
     cod_asociacion
    ) 
;

ALTER TABLE JUGADOR_IDIOMA 
    ADD CONSTRAINT JUGADOR_IDIOMA_JUGADOR_FK FOREIGN KEY 
    ( 
     JUGADOR_cod_trabajador
    ) 
    REFERENCES JUGADOR 
    ( 
     cod_trabajador
    ) 
;

ALTER TABLE JUGADOR 
    ADD CONSTRAINT JUGADOR_TRABAJADOR_FK FOREIGN KEY 
    ( 
     cod_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     cod_trabajador
    ) 
;

ALTER TABLE NACIONALIDAD 
    ADD CONSTRAINT NACIONALIDAD_TRABAJADOR_FK FOREIGN KEY 
    ( 
     TRABAJADOR_cod_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     cod_trabajador
    ) 
;

ALTER TABLE PERSONAL_PLANTA 
    ADD CONSTRAINT PERSONAL_PLANTA_TRABAJADOR_FK FOREIGN KEY 
    ( 
     cod_trabajador
    ) 
    REFERENCES TRABAJADOR 
    ( 
     cod_trabajador
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_CLUB_FUTBOL_FK FOREIGN KEY 
    ( 
     CLUB_FUTBOL_cod_club
    ) 
    REFERENCES CLUB_FUTBOL 
    ( 
     cod_club
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_COMUNA_FK FOREIGN KEY 
    ( 
     COMUNA_cod_comuna
    ) 
    REFERENCES COMUNA 
    ( 
     cod_comuna
    ) 
;

ALTER TABLE TRABAJADOR 
    ADD CONSTRAINT TRABAJADOR_ESCUELA_FUTBOL_FK FOREIGN KEY 
    ( 
     ESCUELA_FUTBOL_cod_escuela
    ) 
    REFERENCES ESCUELA_FUTBOL 
    ( 
     cod_escuela
    ) 
;

CREATE OR REPLACE TRIGGER ARC_FKArc_1_PERSONAL_PLANTA 
BEFORE INSERT OR UPDATE OF cod_trabajador 
ON PERSONAL_PLANTA 
FOR EACH ROW 
DECLARE 
    d VARCHAR2 (1); 
BEGIN 
    SELECT A.TIPO_TRABAJADOR INTO d 
    FROM TRABAJADOR A 
    WHERE A.cod_trabajador = :new.cod_trabajador; 
    IF (d IS NULL OR d <> 'P') THEN 
        raise_application_error(-20223,'FK PERSONAL_PLANTA_TRABAJADOR_FK in Table PERSONAL_PLANTA violates Arc constraint on Table TRABAJADOR - discriminator column TIPO_TRABAJADOR doesn''t have value ''P'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/

CREATE OR REPLACE TRIGGER ARC_FKArc_1_JUGADOR 
BEFORE INSERT OR UPDATE OF cod_trabajador 
ON JUGADOR 
FOR EACH ROW 
DECLARE 
    d VARCHAR2 (1); 
BEGIN 
    SELECT A.TIPO_TRABAJADOR INTO d 
    FROM TRABAJADOR A 
    WHERE A.cod_trabajador = :new.cod_trabajador; 
    IF (d IS NULL OR d <> 'J') THEN 
        raise_application_error(-20223,'FK JUGADOR_TRABAJADOR_FK in Table JUGADOR violates Arc constraint on Table TRABAJADOR - discriminator column TIPO_TRABAJADOR doesn''t have value ''J'''); 
    END IF; 
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        NULL; 
    WHEN OTHERS THEN 
        RAISE; 
END; 
/



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            12
-- CREATE INDEX                             0
-- ALTER TABLE                             25
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
