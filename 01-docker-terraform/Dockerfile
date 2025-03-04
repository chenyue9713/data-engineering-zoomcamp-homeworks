FROM python:3.12.8

RUN apt-get install wget
RUN pip install pandas sqlalchemy psycopg2 
# install jypter notebook
RUN pip install jupyter

WORKDIR /app

COPY ./green_tripdata_2019-10.csv /app/green_tripdata_2019-10.csv
COPY ./taxi_zone_lookup.csv /app/taxi_zone_lookup.csv

EXPOSE 8888

ENTRYPOINT ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
