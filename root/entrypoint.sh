#!/bin/sh

if [ -f /usr/share/zoneinfo/$TZ ]; then
  setup-timezone -z $TZ
  echo -e "[Date]\ndate.timezone = $TZ" >/usr/local/etc/php/conf.d/99_tz.ini
else
  echo -e "[Date]\ndate.timezone = UTC" >/usr/local/etc/php/conf.d/99_tz.ini
fi

case "$SCAN_INTERVAL" in
  5m)  echo "*/5 *   *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "*/5 *   *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  10m) echo "*/10 *  *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "*/10 *  *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  15m) echo "*/15 *  *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "*/15 *  *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  30m) echo "*/30 *  *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "*/30 *  *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  1h)  echo "0 *  *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 *  *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  2h)  echo "0 */2 *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 */2 *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  4h)  echo "0 */4 *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 */4 *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  6h)  echo "0 */6 *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 */6 *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  12h) echo "0 */12 *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 */12 *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
  *)   echo "0 * *  *  *  php /phpipam/index.php update >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
       echo "0 * *  *  *  php /phpipam/index.php discover >> /var/log/cron.log 2>&1" >>/etc/cron.d/phpipam
  ;;
esac

cron
tail -f /var/log/cron.log