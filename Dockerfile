FROM python:3.9.2-buster
MAINTAINER Paweł Klata <pawelklata@gmail.com>

# Create virtual environment
# Upgrade PIP in virtual environment to latest version
RUN python -m venv appenv && \
    . /appenv/bin/activate && \
    python -m pip install pip --upgrade

# Add entrypoint script
ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

LABEL application=todobackend