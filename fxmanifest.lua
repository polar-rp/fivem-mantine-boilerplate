fx_version "cerulean"
use_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

author 'bialymodelu'


shared_scripts {
    '@ox_lib/init.lua',
    '@ox_core/lib/init.lua',
}

ui_page 'web/build/index.html'

client_scripts {
  'src/client/*.lua',
}
server_script {
  'src/server/*.lua',
}

files {
	'web/build/index.html',
	'web/build/**/*',
}