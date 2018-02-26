<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'lifequilt');

/** MySQL database username */
define('DB_USER', 'lifequilt');

/** MySQL database password */
define('DB_PASSWORD', 'TheQuilt1');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'zl_% vKT%wNh%UdQ,Q/PFb]5Ylo;dEHn:hFEBYiI]EBD:6!$>!F/W+8&YNs(R3; ');
define('SECURE_AUTH_KEY',  'Evk.tZS,E ?!?[r4U%QY-E8=TO_Js8w9;<0$Yh)(-H9b~Ao&L^kgn[2C4y%MpTeM');
define('LOGGED_IN_KEY',    'd8JV9{7&C!-4Q$*H^-P(tnO~V`}6D% Ac8(iO*Raw5;/QvX!RMh*w72/Qdc|}e<f');
define('NONCE_KEY',        '2kZJYYaQEs)$TTr$oYa^9Ft[5;ey&k?l{A5QZ:2mD1z<=N!I8>SU$vX7l>$CIjI!');
define('AUTH_SALT',        'd*0GjzJYd/wO`RDc#[>wI?18(zdH<)t/4-+p}ynu~*&?#@msJ|eT0~q)Z=gxKO^j');
define('SECURE_AUTH_SALT', '<f/M_0^$xA+%x^5u5VwKFgj7fy3nNb@TNgL}Z$t>17YWLj,V.J795I4z2VrFb+7k');
define('LOGGED_IN_SALT',   '8kO%C5UzKI,}7RZ,wT<_,E$S3t1=Y{I.fVoaDf?r&LuPLT|:!(bcwZ9kV?$eH|7M');
define('NONCE_SALT',       'hYW ZW6Ejqeh$OAdP)CiLWY>q8(@v$_az.K|)4k{609Ap`oXeP=t]Fvq=h0G.DWg');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
/* define('WP_DEBUG', true); */

/* Allow External Access */
define( 'WP_ACCESSIBLE_HOSTS', 'api.wordpress.org,*.github.com');

define('WP_ALLOW_MULTISITE', true );
define('MULTISITE', true);
define('SUBDOMAIN_INSTALL', false);
define('DOMAIN_CURRENT_SITE', 'localhost');
define('PATH_CURRENT_SITE', '/');
define('SITE_ID_CURRENT_SITE', 1);
define('BLOG_ID_CURRENT_SITE', 1);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/**
 * get home url from absolute path
 * @return string url to main site
 * lafif@astahdziq.in
 */
function get_dynamic_home_url(){
    $base_dir  = ABSPATH; // Absolute path
    $doc_root  = preg_replace("!${_SERVER['SCRIPT_NAME']}$!", '', $_SERVER['SCRIPT_FILENAME']);
    $base_url  = preg_replace("!^${doc_root}!", '', $base_dir);
    $protocol  = empty($_SERVER['HTTPS']) ? 'http' : 'https';
    $port      = $_SERVER['SERVER_PORT'];
    $disp_port = ($protocol == 'http' && $port == 80 || $protocol == 'https' && $port == 443) ? '' : ":$port";
    $domain    = $_SERVER['SERVER_NAME'];
    $home_url  = "${protocol}://${domain}${disp_port}${base_url}";

    return $home_url;
} 
$url = get_dynamic_home_url();

define('WP_SITEURL', $url);
define('WP_HOME', $url);

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
