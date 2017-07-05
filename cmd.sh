#!/bin/bash

# Maintainer : Yoasalfa R. C.

set -e

# Check if runs in development or production
if [ "$ENV" = 'DEV' ]; then
	echo "Running Development Server"
	exec python "identidock.py"
else
	echo "Running Production Server"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi
