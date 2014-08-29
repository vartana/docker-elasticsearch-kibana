## Dockerfile for ElasticSearch and Kibana

Simple and lightweight docker image to run Elasticsearch server and Kibana front-end.

### Usage

    docker run -d -p 80:80 -p 9200:9200 nshou/elasticsearch-kibana

Now you can connect to Elasticsearch by `localhost:9200` and its Kibana front-end by `localhost:80`.

