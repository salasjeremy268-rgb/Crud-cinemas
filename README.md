# CRUD Películas — Spring Boot

Aplicación web de gestión de películas desarrollada con **Spring Boot 3.2.5** y **Java 21**, siguiendo el patrón **MVC**. Permite realizar las cuatro operaciones básicas de un CRUD (Crear, Leer, Actualizar y Eliminar) sobre un catálogo de películas almacenado en una base de datos **MySQL**, con una interfaz renderizada del lado del servidor usando **Thymeleaf** y estilizada con **Bootstrap 5**.

## Características

- 🎬 **Listado de películas** en una tabla con título, director, género, año y calificación.
- ➕ **Formulario de creación**: agrega nuevas películas con título, director, género (selección de lista predefinida), año y calificación (0–10).
- ✏️ **Edición en línea**: al pulsar "Editar", el formulario se autocompleta con los datos de la película seleccionada y cambia a modo actualización.
- 🗑️ **Eliminación** con confirmación mediante diálogo del navegador antes de borrar un registro.
- 💾 **Persistencia con Spring Data JPA / Hibernate**, usando MySQL como base de datos.
- 🎨 **Interfaz responsiva** con Bootstrap 5 e iconos de Bootstrap Icons.
- 🗄️ **Script SQL incluido** (`peliculas_script.sql`) para crear la base de datos, la tabla y cargar datos de ejemplo.

## Estructura del proyecto

```
Proyecto-CRUD-Peliculas/
├── src/main/java/com/example/crud_peliculas/
│   ├── CrudPeliculasApplication.java     # Clase principal (punto de entrada de Spring Boot)
│   ├── controller/
│   │   └── PeliculaController.java       # Rutas: listar, guardar, editar, eliminar
│   ├── model/
│   │   └── Pelicula.java                 # Entidad JPA (tabla "peliculas")
│   └── repository/
│       └── PeliculaRepository.java       # Repositorio JPA (CRUD automático)
├── src/main/resources/
│   ├── application.properties            # Configuración de conexión a MySQL
│   └── templates/
│       └── index.html                    # Vista única (formulario + tabla) con Thymeleaf
├── src/test/java/.../CrudPeliculasApplicationTests.java
├── peliculas_script.sql                  # Script de creación de BD y datos de ejemplo
├── pom.xml                               # Dependencias y configuración de Maven
└── mvnw / mvnw.cmd                       # Maven Wrapper (no requiere Maven instalado)
```

## Tecnologías utilizadas

- **Java 21**
- **Spring Boot 3.2.5** (Spring Web, Spring Data JPA, Thymeleaf)
- **MySQL** (mysql-connector-j)
- **Hibernate** como proveedor JPA
- **Bootstrap 5** y **Bootstrap Icons** (vía CDN)
- **Maven** (con wrapper incluido)

## Requisitos previos

- Tener instalado **JDK 21**.
- Tener **MySQL Server** instalado y en ejecución.
- No es necesario instalar Maven por separado (el proyecto incluye `mvnw`).

## Cómo ejecutar

1. Ejecuta el script `peliculas_script.sql` en tu servidor MySQL para crear la base de datos `crud_peliculas`, la tabla `peliculas` y los datos de ejemplo.
2. Abre `src/main/resources/application.properties` y ajusta `spring.datasource.username` y `spring.datasource.password` según tu configuración de MySQL (por defecto: usuario `root`, contraseña vacía).
3. Desde la raíz del proyecto, ejecuta:
   - Linux/Mac: `./mvnw spring-boot:run`
   - Windows: `mvnw.cmd spring-boot:run`
   
   (También puedes ejecutar `CrudPeliculasApplication.java` directamente desde tu IDE).
4. Cuando la consola muestre `Started CrudPeliculasApplication`, abre tu navegador en `http://localhost:8080`.

## Posibles mejoras futuras

- Separar la lógica de negocio en una capa de **Service**, en lugar de acceder al repositorio directamente desde el controlador.
- Agregar **validaciones del lado del servidor** (`@Valid` + `BindingResult`) con mensajes de error personalizados.
- Añadir **búsqueda y filtrado** de películas por título, género o año.
- Implementar **paginación** en el listado para catálogos grandes.
- Agregar pruebas unitarias más completas (actualmente solo se verifica que el contexto de Spring cargue correctamente).
- Incluir un archivo `.gitignore` para excluir la carpeta `target/` del control de versiones.
