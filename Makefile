DB_HOST = "MYDB"
PG_NETWORK = "VPS_NETWORK"
PG_PWD = "2015!Sedana"
PG_USER = "kspps"
PG_DB = "ksp"
PG_STOREAGE = "$(pwd)/pg/data"
PG_PORT = "3500"

# Create postgres server docker
pg:
	docker rm -f $(DB_HOST) || true\
	&& docker network create $(PG_NETWORK) || true \
	&& docker run -d \
	--restart unless-stopped \
	--name $(DB_HOST) \
	--network $(PG_NETWORK) \
	-e POSTGRES_PASSWORD=$(PG_PWD) \
	-e POSTGRES_USER=$(PG_USER) \
	-e POSTGRES_DB=$(PG_DB) \
	-e PGDATA=/var/lib/postgresql/data/pgdata \
	-v $(PG_STOREAGE):/var/lib/postgresql/data \
	-p $(PG_PORT):5432 \
	postgres:15-alpine


# https://__@github.com/sob0994/nginx-cerbot-docker.git