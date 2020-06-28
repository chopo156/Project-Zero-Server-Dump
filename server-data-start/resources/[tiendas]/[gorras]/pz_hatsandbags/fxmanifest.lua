fx_version 'adamant'

game 'gta5'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server.lua',
	'locales/en.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client.lua',
	'locales/en.lua'
}

dependencies {
	'es_extended',
	'esx_skin',
    'skinchanger',
    'esx_datastore'
}
