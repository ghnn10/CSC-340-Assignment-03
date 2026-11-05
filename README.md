# CSC-340-Assignment-03

# Detective Conan Character API

A REST API for exploring characters in Detective Conan Manga, built with Spring Boot using a layered architecture. Data is stored in PostgreSQL (Neon).

Live URL on Render: [https://detective-conan-characters.onrender.com/characters]

## Feature

- Create, read, update, and delete characters.
- Partial, case-insensitive search by name.
- Filter by role requirements.
- Browse, add, view, edit and delete characters through a server-rendered web interface.
- Upload character picture, character without a picture use a placeholder. 
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
Browser -- CharacterUiController -- FreeMarker templates (HTML)
                  |
JSON client -- CharacterController
                  |
             CharacterService
                  |
          CharacterRepository (JPA)
                  |
          DCCharacter entity / PostgreSQL (Neon)
```

### Project Structure

```
src/main/java/com/csc340/conan_api/characters/
    CharacterController.java
    CharacterUiController.java
    CharacterService.java
    CharacterRepository.java
    DCCharacter.java
    Roles.java
    CharacterNotFoundException.java
src/main/resources/
    application.properties
    templates/                 FreeMarker views for the MVC interface
        about.ftlh
        character-form.ftlh
        details.ftlh
        error.ftlh
        index.ftlh
        layout.ftlh
    static/css/styles.css      Web interface styles
    static/thumbnails/         Uploaded pictures and placeholder image
```

## MVC Web Interface

Start the application and open `http://localhost:8080/` to use the browser interface.

| Method | Path | Description |
|--------|------|-------------|
| GET | `/characters` | Character gallery; optional filter with `name` and `role` query parameters |
| GET | `/characters/new` | Show the add character form |
| POST | `/characters` | Create a character and optionally upload its picture, age, first appearance, background and personality |
| GET | `/characters/{id}` | Show character details |
| GET | `/characters/{id}/edit` | Show the edit character form |
| POST | `/characters/{id}` | Update character detail |
| POST | `/characters/{id}/delete` | Delete a character |
| GET | `/characters/about` | Explain the application and its request flow |

Character pictures are served from `/thumbnails/`; wher a character has no picture, the interface displays `character-placeholder.svg`


## Data Model

**DCCharacter** (table `characters`)

| Field | Type | Rules |
|-------|------|-------|
| `id` | Long | Generated automatically |
| `name` | String | Required, not blank |
| `description` | String | Required, not blank |
| `roles` | Enum: `DETECTIVE`, `FBI`, `CIVILIAN`, `BLACK_ORGANIZATION`, `POLICE`, `OTHER` | Required |
| `age ` | Integer | Must be positive if not null |
| `thumbnailUrl` | String | Optional uploaded picture filename |
| `background` | String | Optional character background |
| `personality` | String | Optional character personality |
| `firstAppearance` | String | Optional character first appearance |


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
| both | `?name=qa&role=POLICE` | Both filter must match |

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

## Configuration

The app reads its database settings from environment variables. Spring Boot maps these names automatically, so nothing secret is stored in `application.properties`.

| Variable | Example |
|----------|---------|
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://<neon-host>/<db>?sslmode=require` |
| `PORT` | Set by Render; defaults to `8080` locally |


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
5. Deploy, then open `https://detective-conan-characters.onrender.com/characters`

### Free-tier notes

- Render free services sleep after roughly 15 minutes of inactivity, so the first request afterward can take up to a minute.
- Neon scales idle databases to zero, which adds a short delay on the first query.
- Render's file system is ephemeral. All persistent data lives in Neon.
