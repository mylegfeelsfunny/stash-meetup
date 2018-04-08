FROM openjdk:8-jre

WORKDIR /opt

RUN mkdir /opt/conf

EXPOSE 4535
ADD docker/service/stash-sample.jar /opt
ADD conf/application.conf /opt/conf/application.conf

CMD ["java", "-cp", "stash-sample.jar", "-Dconfig.file=conf/application.conf", "stash.sample.Server"]
