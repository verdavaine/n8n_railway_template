FROM n8nio/n8n

ARG PGPASSWORD
ARG PGHOST
ARG PGPORT
ARG PGDATABASE
ARG PGUSER

ARG USERNAME
ARG PASSWORD

ENV DB_TYPE=postgresdb
ENV DB_POSTGRESDB_DATABASE=$PGDATABASE
ENV DB_POSTGRESDB_HOST=$PGHOST
ENV DB_POSTGRESDB_PORT=$PGPORT
ENV DB_POSTGRESDB_USER=$PGUSER
ENV DB_POSTGRESDB_PASSWORD=$PGPASSWORD

ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=$USERNAME
ENV N8N_BASIC_AUTH_PASSWORD=$PASSWORD

ENV ENABLE_ALPINE_PRIVATE_NETWORKING=true

# Change to the new n8n directory
WORKDIR /home/node/.n8n

# Ensure the 'node' user owns the /home/node/.n8n directory
# This is crucial for permission management
RUN chown -R node:node /home/node/.n8n

# Switch to 'node' user for security purposes
USER node

# Start n8n with the 'start' command
CMD ["/home/node/.n8n", "start"]
