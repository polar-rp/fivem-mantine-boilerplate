function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

local function openPrinter()
  local input = lib.inputDialog('Drukarka', {
    {type = 'input', label = 'Wpisz url', description = 'URL musi się kończyć końcówką .png', placeholder = 'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png', required = true},
  })
  local url = input[1]
  if not url then return end
  lib.print.info(url)
  local printed = lib.callback.await('viral_printer:createDocument', false, url)
end

RegisterCommand("testprinter", function()
  openPrinter()
end)

function OpenUI(data)
  TriggerEvent("ox_inventory:disarm", true)
  lib.disableRadial(true)
  exports.ox_target:disableTargeting(true)
  LocalPlayer.state.invHotkeys = false
  LocalPlayer.state.invBusy = true
  SendReactMessage('setVisible', true)
  SendReactMessage("sendDocument", {
      url = 'https://e1.pngegg.com/pngimages/757/312/png-clipart-mia-khalifa.png',
      author = 5
  })

  SetNuiFocus(true, true)
end

function CloseUI()
  SetNuiFocus(false, false)
  SendReactMessage('setVisible', false)

  lib.disableRadial(false)
  exports.ox_target:disableTargeting(false)
  LocalPlayer.state.invHotkeys = true
  LocalPlayer.state.invBusy = false
end

-- Całe UI
RegisterNUICallback('hideFrame', function(_, cb)
  CloseUI()
  cb("ok")
end)