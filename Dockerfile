FROM ubuntu:20.04

# Prepare the system
RUN apt-get update && \
    apt-get install -y curl nano git openjdk-11-jre python3 golang-go software-properties-common gnupg2 lsb-release && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Prepare the system
RUN apt-get update && \
    apt-get install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

# Prepare and start the jenkins Agent
ENV JENKINS_URL="http://localhost:8080"
ENV JENKINS_AGENT_NAME="agent-01"
ENV JENKINS_AGENT_SECRET="1234"
ADD start-agent.sh /
RUN ["chmod", "+x", "/start-agent.sh"]
CMD ./start-agent.sh
