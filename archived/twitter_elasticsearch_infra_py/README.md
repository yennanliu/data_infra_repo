### Quick start (dev)
```bash

cd ~ && git clone https://github.com/yennanliu/data_infra_repo.git
cd ~ && data_infra_repo/twitter_elasticsearch_infra_py && docker-compose up -f docker-compose.yml up 

```

### Access the services (dev)
* Full text search for “obama”: http://localhost:9200/sentiment/_search?q=obama
* Author/Twitter username search: http://localhost:9200/sentiment/_search?q=author:allvoices
* Sentiment search: http://localhost:9200/sentiment/_search?q=sentiment:positive
* Sentiment and “obama” search: http://localhost:9200/sentiment/_search?q=sentiment:positive&message=obama