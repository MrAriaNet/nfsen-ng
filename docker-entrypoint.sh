#!/bin/bash
set -e

# If settings.php does not exist in config volume, copy default
if [ ! -f /config/nfsen/settings.php ]; then
    echo "No settings.php found in /config/nfsen. Copying default..."
    cp /var/www/html/nfsen-ng/backend/settings/settings.php.dist /config/nfsen/settings.php
fi

# Link settings.php to NFSen-NG directory
ln -sf /config/nfsen/settings.php /var/www/html/nfsen-ng/backend/settings/settings.php

# Ensure correct ownership
chown -R www-data:www-data /var/www/html
chown -R www-data:www-data /data/nfsen
chown -R www-data:www-data /config/nfsen

# Execute container command
exec "$@"
