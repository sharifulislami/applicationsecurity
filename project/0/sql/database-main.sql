
DROP TABLE IF EXISTS `<DB_PREFIX>content-protection`;
DROP TABLE IF EXISTS `<DB_PREFIX>dnsbl-databases`;
DROP TABLE IF EXISTS `<DB_PREFIX>ip-whitelist`;
DROP TABLE IF EXISTS `<DB_PREFIX>proxy-settings`;
DROP TABLE IF EXISTS `<DB_PREFIX>settings`;
DROP TABLE IF EXISTS `<DB_PREFIX>spam-settings`;
DROP TABLE IF EXISTS `<DB_PREFIX>sqli-settings`;
DROP TABLE IF EXISTS `<DB_PREFIX>users`;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>content-protection` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `function` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `alert` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `<DB_PREFIX>content-protection` (`id`, `function`, `enabled`, `alert`, `message`) VALUES
(1, 'rightclick', 'No', 'Yes', 'Context Menu not allowed'),
(2, 'rightclick_images', 'No', 'Yes', 'Context Menu on Images not allowed'),
(3, 'cut', 'No', 'Yes', 'Cut not allowed'),
(4, 'copy', 'No', 'Yes', 'Copy not allowed'),
(5, 'paste', 'No', 'Yes', 'Paste not allowed'),
(6, 'drag', 'No', 'No', ''),
(7, 'drop', 'No', 'No', ''),
(8, 'printscreen', 'No', 'Yes', 'It is not allowed to use the Print Screen button'),
(9, 'print', 'No', 'Yes', 'It is not allowed to Print'),
(10, 'view_source', 'No', 'Yes', 'It is not allowed to view the source code of the site'),
(11, 'offline_mode', 'No', 'Yes', 'You have no access to save the page'),
(12, 'iframe_out', 'No', 'No', ''),
(13, 'exit_confirmation', 'No', 'Yes', 'Do you really want to exit our website?'),
(14, 'selecting', 'No', 'No', '');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>dnsbl-databases` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `database` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `<DB_PREFIX>dnsbl-databases` (`id`, `database`) VALUES
(1, 'sbl.spamhaus.org'),
(2, 'xbl.spamhaus.org');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>ip-whitelist` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `ip` char(15) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>proxy-settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `protection` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection2` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection3` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `logging` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `autoban` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `redirect` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '<PROJECTSECURITY_PATH>/pages/proxy',
  `mail` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `<DB_PREFIX>proxy-settings` (`id`, `protection`, `protection2`, `protection3`, `logging`, `autoban`, `redirect`, `mail`) VALUES
(1, 'Yes', 'No', 'No', 'Yes', 'No', '<PROJECTSECURITY_PATH>/pages/proxy', 'No');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `realtime_protection` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `mail_notifications` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `countryban_blacklist` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `jquery_include` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `error_reporting` int(11) NOT NULL DEFAULT '1',
  `display_errors` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All Project SECURITY settings will be stored here.';

INSERT INTO `<DB_PREFIX>settings` (`id`, `email`, `mail_notifications`, `realtime_protection`, `countryban_blacklist`, `jquery_include`, `error_reporting`, `display_errors`) VALUES
(1, 'admin@mail.com', 'Yes', 'Yes', 'Yes', 'No', 1, 0);

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>spam-settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `protection` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `logging` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `redirect` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '<PROJECTSECURITY_PATH>/pages/spammer',
  `autoban` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `mail` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `<DB_PREFIX>spam-settings` (`id`, `protection`, `logging`, `redirect`, `autoban`, `mail`) VALUES
(1, 'No', 'Yes', '<PROJECTSECURITY_PATH>/pages/spammer', 'No', 'No');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>sqli-settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `protection` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection2` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection3` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection4` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection5` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection6` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `protection7` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `logging` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `redirect` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '<PROJECTSECURITY_PATH>/pages/blocked',
  `autoban` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No',
  `mail` char(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'No'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `<DB_PREFIX>sqli-settings` (`id`, `protection`, `protection2`, `protection3`, `protection4`, `protection5`, `protection6`, `protection7`, `logging`, `redirect`, `autoban`, `mail`) VALUES
(1, 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'Yes', 'No', 'Yes', '<PROJECTSECURITY_PATH>/pages/blocked', 'No', 'No');

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `<DB_PREFIX>users` (
  `id` int(11) NOT NULL AUTO_INCREMENT primary key,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;