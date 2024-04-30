# data-eng-demo

Data Engineering Demo

Tools to showcase:

- Python
- SQL
- GCP
- dbt
- Docker
- Poetry
- Terraform
- Airflow

## Local Setup

Setup venv and install dependencies from Poetry:

```sh
./bin/setup_venv.sh
```

You can activate a virtualenv using the following poetry command. Note, that you must explicitly deactivate the virtualenv when you are done.

```sh
poetry shell
...
exit
```

Alternatively, commands can be run within the virtualenv for a given package using poetry in the root of the package, like the following:

```sh
poetry run ...
```
