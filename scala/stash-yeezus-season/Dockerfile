FROM openjdk:8-jre

WORKDIR /opt

RUN mkdir /opt/conf

EXPOSE 4535
ADD docker/service/stash-yeezus-season.jar /opt
ADD conf/application.conf /opt/conf/application.conf

CMD ["java", "-cp", "stash-yeezus-season.jar", "-Dconfig.file=conf/application.conf", "stash.yeezus-season.Server"]
