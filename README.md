# Eastflower.ru

Personal Culinary Blog of Elena Tsoy.
# Cold Dev Start

## 1. Remove `.gitkeep` file

```sh
rm db/PGSQL/.gitkeep
```

You need it to avoid a problem with Cold Run and Initialization of a new database (PSQL message: `If you want to create a new database system, either remove or empty the directory`)

## 2. Run PSQL container

```sh
cd docker

docker compose -f dev.docker-compose.yml up psql
```

New initial PSQL database will be created in `db/PGSQL`.

## 3. Restore `.gitkeep` file

Restore the `.gitkeep` that was removed recently.

From the root of the project.

```sh
touch db/PGSQL/.gitkeep
```

## 4. Put database backup file in `shared`

PSQL container has an access to the `shared` folder in the root folder of the application.

We sould like to use this folder to share files across containers.

```sh
cd shared

scp rails@123.60.120.180:/home/rails/DUMPS/eastflower.ru.2022_10_09_15_22.pq.sql .
```

## 5. Create Database inside `PSQL` container

Be sure that PSQL container is running, or restart it.

```sh
docker ps
```

<img src="./docs/docker-ps-1.png" />

```sh
docker exec eastflower-psql-1 bash /shared/create_eastflower_db.sh
```

## 5. Load the Database

```
docker exec eastflower-psql-1 bash -c "pg_restore -h localhost -d eastflower -U rails /shared/eastflower.ru.2022_10_09_15_22.pq.sql"
```

## 6. Run the project

```sh
docker exec -ti eastflower-rails-1 /bin/bash
```

```sh
$ cd home
$ rails s
```
