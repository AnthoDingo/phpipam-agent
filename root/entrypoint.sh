#!/bin/sh
set -e

if [ -f /usr/share/zoneinfo/$TZ ]; then
  #setup-timezone -z $TZ
  echo "$TZ" > /etc/timezone
  dpkg-reconfigure -f noninteractive tzdata
  echo "[Date]\ndate.timezone = $TZ" >/usr/local/etc/php/conf.d/99_tz.ini
else
  echo "[Date]\ndate.timezone = UTC" >/usr/local/etc/php/conf.d/99_tz.ini
fi

case "$SCAN_INTERVAL" in
  5m)  echo "*/5 *   *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "*/5 *   *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  10m) echo "*/10 *  *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "*/10 *  *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  15m) echo "*/15 *  *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "*/15 *  *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  30m) echo "*/30 *  *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "*/30 *  *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  1h)  echo "0 *  *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 *  *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  2h)  echo "0 */2 *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 */2 *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  4h)  echo "0 */4 *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 */4 *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  6h)  echo "0 */6 *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 */6 *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  12h) echo "0 */12 *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 */12 *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
  *)   echo "0 * *  *  *  php /phpipam/index.php update > /dev/stdout 2>/dev/stderr" >/var/spool/cron/crontabs/root
       echo "0 * *  *  *  php /phpipam/index.php discover > /dev/stdout 2>/dev/stderr" >>/var/spool/cron/crontabs/root
  ;;
esac

chmod 644 /var/spool/cron/crontabs/root

# Run one time on Container start
php /phpipam/index.php update
php /phpipam/index.php discover

# Start supervisord
/usr/bin/supervisord