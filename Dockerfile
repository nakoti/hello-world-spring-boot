# Start with a base image that includes Maven and Java
FROM maven:3.8.4-jdk-11

# Set the working directory
WORKDIR /app

# Copy the Maven project files (pom.xml and source code)
COPY ./pom.xml ./   # Copy pom.xml first (for caching dependencies)
COPY ./src ./src   # Copy source code

# Run Maven to build the application
RUN mvn clean install

# Copy the pre-built JAR file 
ADD ./target/myproject-0.0.1-SNAPSHOT.jar /myproject-0.0.1-SNAPSHOT.jar

# Add your run.sh script
ADD ./run.sh /run.sh

# Give execute permissions to the script
RUN chmod a+x /run.sh

# Expose the application port
EXPOSE 8080

# Default command to run the application
CMD ["/run.sh"]
