FROM tomcat:8
COPY target/java-example.war /opt/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
