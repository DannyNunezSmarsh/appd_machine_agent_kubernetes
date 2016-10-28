FROM openjdk:7
ADD start_machine_agent_kubernetes.sh .
COPY /appd_machine_agent/ /appd_machine_agent
CMD ["./start_machine_agent_kubernetes.sh"]
