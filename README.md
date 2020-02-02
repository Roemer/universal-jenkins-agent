# Universal Jenkins Agent
An universal image for a multifunctional Jenkins agent.

## Contents of the Image
This image contains the following things:

- Based on Ubuntu Image
- Nano
- Git Client
- Java
- Python3
- Docker CLI

## Starting modes
This image can be used in at least two modes:

### As a standalone Jenkins Agent
To use this image as a permanent agent, create a new Docker container based on this image and add the following environment variables:
`JENKINS_URL` = The full url of Jenkins without leading slash
`JENKINS_AGENT_NAME` = The name of the permanent agent you created in Jenkins
`JENKINS_AGENT_SECRET` = The secred of the permanent agent you created in Jenkins

The container does on start download the latest `agent.jar` from the given Jenkins and starts it with the given parameters.

For this, no additional Jenkins plugins are needed.

### As an on-demand Docker container which Jenkins attaches to
In this mode, a container is started based on this image and Jenkins attaches to it.
For this, the [Jenkins Docker Plugin](https://plugins.jenkins.io/docker-plugin) is needed and the `Docker Agent Template`s `Connect method` needs to be set to `Attach Docker container`.

### As an on-demand standalone Docker container
In this mode, a container is started based on this image which automatically connects to jenkins.
For this, the [Jenkins Docker Plugin](https://plugins.jenkins.io/docker-plugin) is needed and the `Docker Agent Template`s `Connect method` needs to be set to `Connect with JNLP`.
Also in the `EntryPoint Arguments`, the same environment variables as in the standalone Jenkins Agent needs to be set.

### As a Docker Swarm Agent
TODO
For this, the [Jenkins Docker Swarm Plugin](https://plugins.jenkins.io/docker-swarm) is needed.
