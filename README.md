# CSC-340-Assignment-03

# Detective Conan Character API

A REST API for exploring characters in Detective Conan Manga, built with Spring Boot using a layered architecture. Data is stored in PostgreSQL (Neon).

## Feature

- Create, read, update, and delete characters.
- Partial, case-insensitive search by name.
- Filter by role requirements.
- Been validation with clear HTTP status code (400, 404).
- Configured entirely through environment variables (no secrets in the repo).

## Tech Stack

| Area | Technology |
|------|------------|
| Language | Java 25 |
| Framework | Spring Boot (Web, Data JPA, Validation) |
| Database | PostgreSQL on [Neon](https:/neon.com) |
| Build | Maven |

Generate a starter project at [start.spring.io](https://start.spring.io) with : **Spring Web, Spring Data JPA, Validation, PostgreSQL Driver**.

## Architecture

The app uses four layers. Each layer talks only to the one below it. 

```
HPPT request
    |
Controller    - maps URLs to methods, validates input, returns HTTP responses
    |
Service       - business logic and orchestration, throws domain exceptions
    |
Repository    - data access (Spring Data JPA), generates SQL
    |
Entity        - Java class mapped to the `characters` table
    |
PostgreSQL (Neon)
```

### Project Structure

```
src/main/java/com/csc340/conan_api/characters/
    CharacterController.java
    CharacterService.java
    CharacterRepository.java
    DCCharacter.java
    Roles.java
    CharacterNotFoundException.java
src/main/resources/
    application.properties
```


## Data Model

**DCCharacter** (table `characters`)

| Field | Type | Rules |
|-------|------|-------|
| `id` | Long | Generated automatically |
| `name` | String | Required, not blank |
| `description` | String | Required, not blank |
| `roles` | Enum: `DETECTIVE`, `FBI`, `CIVILIAN`, `BLACK_ORGANIZATION`, `POLICE` | Required |
| `age ` | Integer | Must be positive if not null |

## API Reference

Base path: `/api/characters`

| Method | Path | Description | Success |
|--------|------|-------------|---------|
| GET | `/api/characters` | List all characters (supported filters below) | 200 |
| GET | `/api/characters/{id}` | Get one character by ID | 200 |
| POST | `/api/characters` | Add a character | 201 |
| PUT | `/api/characters/{id}` | Update a character | 200 |
| DELETE | `/api/characters/{id}` | Delete a character  | 204 |
| GET | `/api/characters?roles=POLICE` | Filter by `roles` category | 200 |
| GET | `/api/characters?name=abc` | Search by name (partial, case-insensitive) | 200 |

### Query parameters for `GET  /api/characters`

| Parameter | Example | Behavior |
|-----------|---------|----------|
| `name` | `?name=a` | Partial, case-insensitive match ('a' finds "Takagi Wataru", and "Akai Shuichi") |
| `roles` | `?roles=FBI` | Exact match on  `DETECTIVE`, `FBI`, `CIVILIAN`, `BLACK_ORGANIZATION`, or `POLICE` |

Blank or missing parameters are ignored.

### Example request

```http
POST /api/plant
Content-Type: application/json

{
    "age": 17,
    "description": "The main character of the manga - a brilliant high school detective who was shrunk by a mysterious crime syndicate.",
    "name": "Kudo Shinichi",
    "roles": "DETECTIVE"
}
```

### Status codes

| Code | Meaning |
|------|---------|
| 200 | OK |
| 201 | Created |
| 204 | Deleted, no content |
| 400 | Validation failed or malformed request (for example, an invalid `roles` value) |
| 404 | Character with that id does not exist |


## Deployment (Render)
 
Render has no native Java runtime, so the app is deployed with Docker.
 
1. Add a `Dockerfile` at the repository root:
```dockerfile
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q -DskipTests package
 
FROM eclipse-temurin:25-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-jar", "app.jar"]
```
 
2. Push the repository to GitHub.
3. In Render, create a **Web Service**, connect the repo, choose the **Docker** runtime and the **Free** instance type.
4. Add the  `SPRING_DATASOURCE_URL` environment variable (value only, no quotes).
5. Deploy, then open `https://detective-conan-characters.onrender.com/api/characters`

### Free-tier notes

- Render free services sleep after roughly 15 minutes of inactivity, so the first request afterward can take up to a minute.
- Neon scales idle databases to zero, which adds a short delay on the first query.
- Render's file system is ephemeral. All persistent data lives in Neon.
