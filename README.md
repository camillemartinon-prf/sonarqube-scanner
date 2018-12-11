# sonarqube-scanner
A simple sonarqube scanner Docker image.

## Basic Usage with Bitbucket Pipelines and SonarCloud
```bash
pipelines:
  default:
    - step:
        name: Sonar Scan
        image: pernodricard/sonarqube-scanner:latest
        script:
          - sonar-scanner -Dsonar.projectKey=$BITBUCKET_REPO_SLUG -Dsonar.organization=pernod-ricard -Dsonar.sources=. -Dsonar.host.url=https://sonarcloud.io -Dsonar.login=$SONARQUBE_TOKEN
```

Simply add yout SONARQUBE_TOKEN as a repository variable.
