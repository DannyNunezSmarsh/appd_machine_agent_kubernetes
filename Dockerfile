FROM openjdk:7
ADD start_machine_agent_kubernetes.sh .
CMD ["./start_machine_agent_kubernetes.sh"]
