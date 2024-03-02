FROM mysql/mysql-server:latest

ENV MYSQL_ROOT_PASSWORD=rammy
ENV MYSQL_DATABASE=csc468

COPY cattle_data.csv /cattle_data.csv
COPY populate_database.sql /docker-entrypoint-initdb.d/

# Modify MySQL configuration to allow remote connections
RUN echo "bind-address = 0.0.0.0" >> /etc/my.cnf

# Grant privileges to allow connections from remote hosts
RUN echo "GRANT ALL PRIVILEGES ON csc468.* TO 'root'@'%' WITH GRANT OPTION;" > /docker-entrypo$

EXPOSE 3306

