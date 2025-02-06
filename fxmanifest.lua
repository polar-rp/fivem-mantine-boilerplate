fx_version "cerulean"
use_fxv2_oal 'yes'
lua54 'yes'
author 'bialymodelu'
game 'gta5'

shared_scripts {
    '@ox_lib/init.lua',
    '@ox_core/lib/init.lua',
    'config.lua',
}

ui_page 'web/build/index.html'

client_scripts {
  'client/*.lua',
}
server_script {
  'client/*.lua',
}

files {
	'web/build/index.html',
	'web/build/**/*',
}