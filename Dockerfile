FROM openjdk:8u191-jre-alpine3.8
WORKDIR /usr/share/yummy_dir
ADD /target/selenium-docker.jar                 selenium-docker.jar
ADD /target/selenium-docker-tests.jar           selenium-docker-tests.jar
ADD /target/libs                                libs
ADD /src/test/resources/run/run_chrome.xml      run_chrome.xml
ADD /src/test/resources/run/run_firefox.xml     run_firefox.xml
ENTRYPOINT java -cp selenium-docker.jar:selenium-docker-tests.jar:libs/* -DHUB_HOST=$HUB_HOST org.testng.TestNG $SUITE_FILE