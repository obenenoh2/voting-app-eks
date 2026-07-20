#!/bin/sh

# Redis health check script
# Checks if Redis is responding to PING command

if redis-cli PING | grep -q "PONG"; then
    exit 0
else
    exit 1
fi
