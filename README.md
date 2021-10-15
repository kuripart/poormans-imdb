# Poorman's IMDB
API to query movies/tv shows and their reviews.

## Development
Can follow [Docker Docs](https://docs.docker.com/samples/rails/) for a quickstart on setting up a dockerised rails app


## How to start the containers?

Ensure you have docker and docker-compose installed. Run the following:

```bash
docker-compose up -d --build
```

```bash
> docker ps
CONTAINER ID   IMAGE               COMMAND                  CREATED          STATUS         PORTS                    NAMES
a90fed91cebe   poormans-imdb_web   "entrypoint.sh bash …"   11 seconds ago   Up 8 seconds   0.0.0.0:3000->3000/tcp   poormans-imdb-web-1
372bd696b1f5   postgres            "docker-entrypoint.s…"   24 hours ago     Up 9 seconds   5432/tcp                 poormans-imdb-db-1
```

Shell into the rails container:

```bash
docker exec -it $CONTAINER_ID bash
```

## How to Migrate Schema and Load Data?

After running an interactive shell inside the container, run these separately:

```bash
rails db:migrate
rails db:seed
```

Or run this script:
```bash
sh ./scripts/migrate.sh
```

## How to access DB?

Run inside the container:

```bash
PGPASSWORD=password psql -h db -U postgres myapp_development
```

## How to check tables have been created and data has been loaded?

Run queries to check tables have been created and populated. Eg:

```sql
myapp_development=# \d
                  List of relations
 Schema |         Name         |   Type   |  Owner
--------+----------------------+----------+----------
 public | actors               | table    | postgres
 public | actors_id_seq        | sequence | postgres
 public | ar_internal_metadata | table    | postgres
 public | directors            | table    | postgres
 public | directors_id_seq     | sequence | postgres
 public | media                | table    | postgres
 public | media_id_seq         | sequence | postgres
 public | reviews              | table    | postgres
 public | reviews_id_seq       | sequence | postgres
 public | schema_migrations    | table    | postgres
(10 rows)

myapp_development=# select name, dob, sex from actors limit 5;
              name               |    dob     | sex 
---------------------------------+------------+-----
 Tori Luettgen Stamm             | 1992-07-05 | f
 Micah Hilpert Lockman           | 2000-02-10 | f
 Jacque Pagac Gutmann II         | 1996-06-25 | m
 Wendi Wyman Flatley             | 1996-03-30 | m
 Rep. Elinore Abbott Schamberger | 1978-05-04 | m
(5 rows)
```

## Teardown

```bash
docker-compose down --volumes
```
