FROM sonarsource/sonar-scanner-cli:4.3

LABEL version="0.0.1" \
      repository="https://github.com/sonarsource/sonarcloud-github-action" \
      homepage="https://github.com/sonarsource/sonarcloud-github-action" \
      maintainer="SonarSource" \
      com.github.actions.name="SonarCloud Scan" \
      com.github.actions.description="Scan your code with SonarCloud to detect bugs, vulnerabilities and code smells in more than 25 programming languages." \
      com.github.actions.icon="check" \
      com.github.actions.color="green"

ARG SONAR_SCANNER_HOME=/opt/sonar-scanner
ARG NODEJS_HOME=/opt/nodejs
ARG SONAR_SCANNER_VERSION=4.3.0.2102
ARG NODEJS_VERSION=v8.12.0

ENV SONAR_SCANNER_HOME=${SONAR_SCANNER_HOME} \
    SONAR_SCANNER_VERSION=${SONAR_SCANNER_VERSION} \
    NODEJS_HOME=${NODEJS_HOME} \
    NODEJS_VERSION=${NODEJS_VERSION}

ENV PATH=${PATH}:${SONAR_SCANNER_HOME}/bin:${NODEJS_HOME}/bin

WORKDIR /opt

# https://help.github.com/en/actions/creating-actions/dockerfile-support-for-github-actions#user
USER root

# Prepare entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
