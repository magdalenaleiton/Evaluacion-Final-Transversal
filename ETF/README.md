# Evaluacion Final Transversal - PRY2204

## Modelamiento de Bases de Datos

### Descripcion del proyecto

Este proyecto corresponde a la Evaluacion Final Transversal de la asignatura PRY2204, Modelamiento de Bases de Datos. El objetivo es diseñar una base de datos relacionada con la Asociacion Nacional de Futbol Profesional (ANFP), considerando clubes de futbol, asociaciones, jugadores, trabajadores y escuelas de futbol.

### Objetivos

- Elaborar el modelo entidad-relacion.
- Construir el modelo logico y relacional.
- Identificar entidades, atributos, claves primarias y claves foraneas.
- Definir restricciones de integridad.
- Desarrollar sentencias SQL para crear y poblar tablas.
- Elaborar consultas SQL para obtener informacion de las asociaciones y los clubes.

### Herramientas utilizadas

- Oracle SQL Developer Data Modeler.
- Oracle SQL Developer.
- SQL para definicion y consulta de datos.
- GitHub para el almacenamiento y la entrega del proyecto.

### Archivos del proyecto

- `etf.dmd`: archivo del modelo de datos de Data Modeler.
- `ANFP.sql`: script SQL del proyecto.
- `etf/`: carpeta con archivos relacionados con el proyecto.

### Contenido del modelo

El diseño contempla las siguientes entidades y estructuras principales:

- Trabajador.
- Jugador.
- Personal de planta.
- Club de futbol.
- Asociacion.
- Escuela de futbol.
- Region y comuna.
- Nacionalidad.
- Historial de clubes.
- Idiomas asociados a jugadores.

### Consultas SQL

El script considera consultas orientadas a:

1. Obtener asociaciones profesionales creadas despues del año 2000, ordenadas por fecha de creacion.
2. Consultar clubes cuyo nombre contiene la letra "a", con patrimonio superior a 200.000.000 CLP, considerando asociaciones profesionales y mostrando el patrimonio en pesos chilenos y dolares estadounidenses.

### Estado del proyecto

Se incluyen los archivos del modelo de datos y el script SQL elaborado para la evaluacion. La ejecucion del script y la validacion de las consultas quedan pendientes de comprobar en una instancia funcional de Oracle Database.

### Autor

Estudiante: Pablo Robles

Asignatura: PRY2204 - Modelamiento de Bases de Datos

Institucion: Duoc UC
