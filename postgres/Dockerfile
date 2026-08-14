FROM postgres:16

#segun la documentacion en si coloco mi ".sql" en docker-entrypoint-initdb.d 
#se ejecuta automaticamente
COPY init.sql /docker-entrypoint-initdb.d/init.sql 