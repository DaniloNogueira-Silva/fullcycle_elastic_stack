# METRICBEAT

FROM docker.elastic.co/beats/metricbeat:7.13.0

USER root
COPY beats/metric/metricbeat.yml /usr/share/metricbeat/metricbeat.yml
RUN chmod 600 /usr/share/metricbeat/metricbeat.yml && chown root:root /usr/share/metricbeat/metricbeat.yml
USER metricbeat

# HEARTBEAT
FROM docker.elastic.co/beats/heartbeat:7.13.0

USER root

# Copia o arquivo heartbeat.yml para o container
COPY beats/heartbeat/heartbeat.yml /usr/share/heartbeat/heartbeat.yml

# Altera permissões do arquivo para garantir que o usuário heartbeat tenha permissão
RUN chmod 644 /usr/share/heartbeat/heartbeat.yml && chown root:root /usr/share/heartbeat/heartbeat.yml

# Restaura o usuário para o default (heartbeat)
USER heartbeat
