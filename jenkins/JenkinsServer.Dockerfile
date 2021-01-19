ARG JENKINS_VERSION=2.60
FROM jenkins/jenkins:$JENKINS_VERSION

ARG PLUGIN_MANAGER_TOOL_VERSION=1.0.2
RUN wget https://github.com/jenkinsci/plugin-installation-manager-tool/releases/download/plugin-management-parent-pom-$PLUGIN_MANAGER_TOOL_VERSION/jenkins-plugin-manager-$PLUGIN_MANAGER_TOOL_VERSION.jar -O /usr/share/jenkins/ref/jenkins-plugin-manager.jar
ENV JENKINS_UC_EXPERIMENTAL=https://updates.jenkins.io/experimental
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

COPY jenkinsStart.sh /usr/local/bin/jenkinsStart.sh
ENTRYPOINT ["tini", "--", "/usr/local/bin/jenkinsStart.sh"]

