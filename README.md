







For the problem where databases where not getting created , i have found a solution which worked. After diving deep into the logs of this container nlp-ml-app_users-db_1  , I came to know that create.sql  was not getting copied into this directory /docker-entrypoint-initdb.d. 

The solution is outlined as below. Every time I made a change to python files or Dockerfiles at the project , I was missing to build the Docker Image . 

Missed Command : docker-compose buildDue to this i used run the below commands except the missed command. 

Step 1. docker-compose stop
Step 2. docker-compose rm
Step 3. docker-compose down -v 
Step 4. docker-compose build
Step 5. docker-compose up -d

Adding this green-colored command to the set of commands that need to be run solved the problem .  When I ran   docker-compose exec users python manage.py recreate_db ,  no more I faced an error.
