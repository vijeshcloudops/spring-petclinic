
# Use Java 17 runtime only
FROM eclipse-temurin:17-jre

WORKDIR /app

# Create non-root application user
RUN useradd --system --create-home --shell /usr/sbin/nologin petclinic

USER petclinic

# Copy the already-built executable JAR
COPY target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-jar", "app.jar"]
