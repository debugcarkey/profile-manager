composer install
rm -rf /app/.env
doppler secrets download --project $DOPPLER_PROJECT --token $DOPPLER_TOKEN --format=env --no-file > /app/.env
php artisan migrate
php -S 0.0.0.0:80 -t public