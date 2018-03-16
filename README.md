# Docker Elasticsearch container

Run with the following command. Elastic, Kibana, logstash and proxy are all attached to the 'elk' network:

docker run -d --network elk --name elastic -h elastic milobahg/elastic:latest
