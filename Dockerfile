FROM python:3.7
ENV PYTHONUNBUFFERED=1
RUN mkdir /code
WORKDIR /code
COPY Pipfile /code/
RUN pip install pipenv
COPY Pipfile Pipfile.lock ./
RUN pipenv install
COPY ./mysite/ ./
EXPOSE 8000

# Remove "pipenv run", add the bind argument
# (No need to repeat `command:` in `docker-compose.yml`)
CMD pipenv run python manage.py runserver 0.0.0.0:8000
