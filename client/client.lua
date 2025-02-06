function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

function OpenUI()
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