# Step 1: Build using Maven
FROM maven:3.8.6-openjdk-8 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Step 2: Run using Tomcat
FROM tomcat:9.0
COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/onlinebookstore.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
