### Quick start

```bash 
# run as mysql backend 
git clone https://github.com/amancevice/docker-superset.git
cd docker-superset/examples/mysql
# Start Redis & MySQL services
docker-compose up -d redis mysql
# Wait for services to come up fully...
# Start Superset
docker-compose up -d superset
# Wait for Superset to come up fully...
# Initialize Superset DB
docker-compose exec superset superset-demo
# or `docker-compose exec superset superset-init` if no demo data needed
# Play around in demo...
# Bring everything down
docker-compose down -v
```

### Ref 
- https://github.com/amancevice/docker-superset/tree/master/examples
