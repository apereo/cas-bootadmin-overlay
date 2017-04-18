CAS Spring Boot Admin Server Overlay Template
============================

Generic CAS Spring Boot Admin Server WAR overlay.

# Versions

```xml
<cas.version>5.1.x</cas.version>
```

# Requirements

* JDK 1.8+

# Build

To see what commands are available to the build script, run:

```bash
./build.sh help
```

To package the final web application, run:

```bash
./build.sh package
```

To update `SNAPSHOT` versions run:

```bash
./build.sh package -U
```

# Configuration

Create a `src/main/resources/application.properties` file to override default settings.

# Deployment

On a successful deployment via the following methods, the configuration server will be available at:

* `https://localhost:8444`

## Executable WAR

Run the configuration server web application as an executable WAR.

```bash
./build.sh run
```

## Spring Boot

Run the configuration server web application as an executable WAR via Spring Boot. This is most useful during development and testing.

```bash
./build.sh bootrun
```

## External

Deploy resultant `target/casbootadminserver.war`  to a servlet container of choice.