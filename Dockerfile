FROM jenkins/jenkins

#secrets
COPY secrets /usr/share/jenkins/ref/secrets/
COPY credentials.xml /usr/share/jenkins/ref/credentials.xml
#maven
COPY maven/hudson.tasks.Maven.xml /usr/share/jenkins/ref/hudson.tasks.Maven.xml
COPY maven/jenkins.mvn.GlobalMavenConfig.xml /usr/share/jenkins/ref/jenkins.mvn.GlobalMavenConfig.xml
#general configurations
COPY config.xml /usr/share/jenkins/ref/config.xml
#jobs
COPY jobs/ /usr/share/jenkins/ref/jobs/
# Skip initial setup
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state
#install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY default-user.groovy /usr/share/jenkins/ref/init.groovy.d/
