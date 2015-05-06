# nuagebec-docker-PHP-libodbcfb-client

Simple always updated Ubuntu docker images with SSH access and supervisord. This docker running apache and php that connect to an external ODBC source with firebird

It include some tools like :

- python 2.7 & 3
- ruby 1.9
- wget
- vim-nox
- git
- tar
- ca-certificates


and the following package

- curl 
- apache2 
- libapache2-mod-php5 
- php5-mysql 
- php5-gd 
- php5-curl 
- php-pear 
- php-mail 
- mysql-client 
- php-apc 
- unixodbc 
- unixodbc-dev 
- php5-interbase 
- php5-odbc 
- libmyodbc 


The 2013 libOdbcFb 64bits client Version 2.0.2 is installed more information : http://www.firebirdsql.org/en/odbc-driver/

Usage
-----

To create the image `nuagebec/php-libodbcfb-client` with Ubuntu,
execute the following commands on the nuagebec-ubuntu master branch:

        git checkout master
        docker build -t nuagebec/php-libodbcfb-client .

Running nuagebec/PHP-libOdbcFb-client
--------------------

To run a container from the image you created earlier binding it to port 2222 in
all interfaces, execute:

        docker run -d -p 0.0.0.0:2222:22 nuagebec/php-libodbcfb-client

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

        docker logs <CONTAINER_ID>

You will see an output like the following:

        ========================================================================
        You can now connect to this Ubuntu container via SSH using:

            ssh -p <port> root@<host>
        and enter the root password 'U0iSGVUCr7W3' when prompted

        Please remember to change the above password as soon as possible!
        ========================================================================

In this case, `U0iSGVUCr7W3` is the password allocated to the `root` user.

Done!


Setting a specific password for the root account
------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

        docker run -d -p 0.0.0.0:2222:22 -e ROOT_PASS="mypass" nuagebec/php-libodbcfb-client



Deactivating ssh server
-----------------------

you may not like to have a running ssh server use SSH_SERVER=false to prevent starting it. Default is true


        docker run -e SSH_SERVER=false nuagebec/php-libodbcfb-client


Specific configuration
----------------------


Add your specific php.ini configuration in config/php.ini

Add your specific apache configuration in config/000-default.conf

Add your specific odbc.ini configuration in config/odbc.ini



