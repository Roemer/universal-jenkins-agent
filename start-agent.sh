AGENT_JAR_URL="${JENKINS_URL}/jnlpJars/agent.jar"

curl --connect-timeout 20 --max-time 60 -o agent.jar $AGENT_JAR_URL
java -jar agent.jar -url ${JENKINS_URL} -name ${JENKINS_AGENT_NAME} -secret $JENKINS_AGENT_SECRET -noReconnect -workDir /tmp
