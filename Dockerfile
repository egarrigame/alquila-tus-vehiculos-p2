# Builder
FROM eclipse-temurin:25 as builder
WORKDIR /app

# instalar maven
RUN apt-get update && apt-get install -y maven

# Copiar pom y código
COPY pom.xml .
COPY src ./src

# Construir el JAR
RUN mvn clean package -DskipTests

# JAR resultado y JaVA jre
FROM eclipse-temurin:25-jre
WORKDIR /app

# Copiar el JAR
COPY --from=builder /app/target/*.jar app.jar

# Puerto Spring Boot
EXPOSE 8080

# Ejecución
ENTRYPOINT ["java", "-jar", "app.jar"]
