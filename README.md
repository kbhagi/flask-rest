### database users_dev does not exist

For the problem where databases where not getting created , i have found a solution which worked. After diving deep into the logs of this container nlp-ml-app_users-db_1  , I came to know that ``create.sql``  was not getting copied into this directory ```/docker-entrypoint-initdb.d```

The solution is outlined as below. Every time I made a change to python files or Dockerfiles at the project , I was missing to build the Docker Image . 

## Missed Command : ```docker-compose build```
Due to this i used run the below commands except the missed command.

```
1. docker-compose stop
2. docker-compose rm
3. docker-compose down -v
4. docker-compose build
5. docker-compose up -d
```

Adding this **docker-compose build** to the set of commands that need to be run solved the problem .  When I ran   ```docker-compose exec users python manage.py recreate_db ```,  no more I faced an error.

I would like to take a pull-request to your project on Github or wherever you are maintaining it . So that folks going through the tutorial and new to docker don't face the issue 
