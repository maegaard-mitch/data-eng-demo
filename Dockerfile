# builder image
FROM python:3.10-bookworm as builder

# pin poetry version to match local
RUN pip install poetry==1.7.1

# set poetry env vars for build determinism
ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR=/tmp/poetry_cache

WORKDIR /app

COPY pyproject.toml poetry.lock ./
# add dummy readme for caching
RUN touch README.md

# use buildkit cache mount
# --without: don't install additional dependencies
# --no-root: avoid installing current project into venv
RUN --mount=type=cache,target=$POETRY_CACHE_DIR poetry install --without dev --no-root

# runtime image
FROM python:3.10-slim as runtime

ENV VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:$PATH"

COPY --from=builder ${VIRTUAL_ENV} ${VIRTUAL_ENV}

COPY src ./src

ENTRYPOINT ["python", "src"]
