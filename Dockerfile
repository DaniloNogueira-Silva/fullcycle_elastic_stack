FROM docker.elastic.co/beats/metricbeat:7.13.0

USER root
COPY beats/metric/metricbeat.yml /usr/share/metricbeat/metricbeat.yml
RUN chmod 600 /usr/share/metricbeat/metricbeat.yml && chown root:root /usr/share/metricbeat/metricbeat.yml
USER metricbeat
