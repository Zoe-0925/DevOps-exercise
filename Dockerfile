# First stage: create index.html
FROM alpine:latest as builder

RUN echo '<p>Hello World</p>' > /index.html

# Second stage: set up Nginx and copy the index.html from the first stage
FROM nginx:stable-alpine

# Copy the index.html from the builder stage
COPY --from=builder /index.html /usr/share/nginx/html/index.html

# Create a custom entrypoint script
RUN echo $'#!/bin/sh\n\
echo "starting nginx"\n\
nginx -g "daemon off;"' > /docker-entrypoint.sh \
    && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
