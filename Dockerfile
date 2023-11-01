# Use an official Maven runtime as the base image
FROM maven:latest AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project file
COPY pom.xml .

# Download and cache Maven dependencies
RUN mvn dependency:go-offline -B

# Copy the application source code
COPY src ./src

# Build the application with Maven
# Build the application with Maven and print contents of the target directory
RUN mvn package -DskipTests && ls -l /app/target


# Use an official OpenJDK runtime as the base image
FROM openjdk:latest

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file from the build stage to the container
COPY --from=build /app/target/amca.jar .

# Command to run the application
CMD ["java", "-jar", "amca.jar"]
