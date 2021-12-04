fx_version 'adamant'
game 'gta5'

dependency 'NativeUI'

client_script '@NativeUI/NativeUI.lua'

server_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/sv_fakeid.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/fr.lua',
	'config.lua',
	'src/RMenu.lua',
    'src/menu/RageUI.lua',
    'src/menu/Menu.lua',
    'src/menu/MenuController.lua',
    'src/components/*.lua',
    'src/menu/elements/*.lua',
    'src/menu/items/*.lua',
    'src/menu/panels/*.lua',
    'src/menu/panels/*.lua',
	'src/menu/windows/*.lua',
	'client/cl_fakeid.lua'
}