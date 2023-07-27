FROM python:3.11-slim-bullseye
EXPOSE 5000
WORKDIR /app
COPY ./requirements.txt requirements.txt
# Actualizar pip
RUN python3 -m pip install --upgrade pip
# Instalar dependencias
RUN pip install --no-cache-dir --upgrade -r requirements.txt
# RUN apt-get update && apt-get install -y mariadb-client
# RUN mysql -h mariadb -u root -ppassword bdtestsqlalchemy < /create_tables.sql
# Instala las dependencias del proyecto
COPY . .
CMD ["flask", "run", "--host", "0.0.0.0"]
# CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:create_app()"]