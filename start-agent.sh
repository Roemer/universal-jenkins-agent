
AGENT_JAR_URL="${JENKINS_URL}/jnlpJars/agent.jar"
JNLP_URL="${JENKINS_URL}/computer/${JENKINS_AGENT_NAME}/slave-agent.jnlp "

curl --connect-timeout 20 --max-time 60 -o agent.jar $AGENT_JAR_URL
java -jar agent.jar -jnlpUrl $JNLP_URL -secret $JENKINS_AGENT_SECRET -noReconnect -workDir /tmp
