<?php

/**
 * Import default values
 */
require('config.dist.php');

/**
 * database connection details
 ******************************/
getenv('IPAM_DATABASE_HOST') ? $config['db']['host'] = getenv('IPAM_DATABASE_HOST') : false;
getenv('IPAM_DATABASE_USER') ? $config['db']['user'] = getenv('IPAM_DATABASE_USER') : false;
getenv('IPAM_DATABASE_PASS') ? $config['db']['pass'] = getenv('IPAM_DATABASE_PASS') : false;
getenv('IPAM_DATABASE_NAME') ? $config['db']['name'] = getenv('IPAM_DATABASE_NAME') : false;
getenv('IPAM_DATABASE_PORT') ? $config['db']['port'] = getenv('IPAM_DATABASE_PORT') : false;

/**
 * agent settings
 */
$config['key'] = getenv('AGENT_KEY');
$config['api']['key'] = getenv('API_KEY');

getenv('IPAM_METHOD') ? $config['method'] = getenv('IPAM_METHOD') : false;
getenv('IPAM_PINGPATH') ? $config['pingpath'] = getenv('IPAM_PINGPATH') : false;

getenv('IPAM_RESET_AUTODISCOVER') ? $config['reset_autodiscover_addresses'] = getenv('IPAM_RESET_AUTODISCOVER') : false;
getenv('IPAM_REMOVE_INACTIVE') ? $config['remove_inactive_dhcp'] = getenv('IPAM_REMOVE_INACTIVE') : false;