#!/bin/bash

# Render start script
echo "Starting Horary Astrology API on port $PORT"

# Install dependencies if not cached
if [ ! -d "/opt/render/project/.venv" ]; then
    echo "Installing dependencies..."
    pip install -r backend/requirements.txt
fi

# Start the application
exec gunicorn wsgi:application \
    --bind 0.0.0.0:$PORT \
    --workers 1 \
    --timeout 120 \
    --access-logfile - \
    --error-logfile -
