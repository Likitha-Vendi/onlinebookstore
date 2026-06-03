FROM tomcat:9.0

# remove default ROOT
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# copy project as ROOT app
COPY WebContent/ /usr/local/tomcat/webapps/ROOT/
COPY src/main/webapp/ /usr/local/tomcat/webapps/ROOT/

EXPOSE 8080
CMD ["catalina.sh", "run"]
