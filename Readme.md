PostgreSQL DP setting up

1. Install PostgreSQL

   sudo apt-get install python-pip python-dev libpq-dev postgresql postgresql-contrib


2. Create DB and add user

   sudo su - postgres                                                            (start PostgreSQL shell session)
   psql                                                                          (log into Postgres session)

   CREATE DATABASE demo;                                                         (create DB with name "demo")
   CREATE USER admin WITH PASSWORD 'admin';

   ALTER ROLE admin SET client_encoding TO 'utf8';                               ( setting the default encoding to UTF-8, which Django expects)

   ALTER ROLE admin SET default_transaction_isolation TO 'read committed';       (setting the default transaction isolation scheme to "read
                                                                                  committed")

   ALTER ROLE admin SET timezone TO 'UTC';                                       (setting the timezone)

   GRANT ALL PRIVILEGES ON DATABASE demo TO admin;                               (give user access rights to the DB)

   \q
   exit


3. Install in Django env psycopg2


4. Configure the Django settings.py

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'myproject',
        'USER': 'myprojectuser',
        'PASSWORD': 'password',
        'HOST': 'localhost',
        'PORT': '',
    }
}


