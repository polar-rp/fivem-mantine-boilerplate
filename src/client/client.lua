function SendReactMessage(action, data)
  SendNUIMessage({
    action = action,
    data = data
  })
end

function OpenUI(data)
  TriggerEvent("ox_inventory:disarm", true)
  lib.disableRadial(true)
  exports.ox_target:disableTargeting(true)
  LocalPlayer.state.invHotkeys = false
  LocalPlayer.state.invBusy = true
  
  SendReactMessage('setVisible', true)
  
  if data then
    SendReactMessage('setData', data)
  end
  
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

RegisterNUICallback('hideFrame', function(_, cb)
  CloseUI()
  cb("ok")
end)

RegisterCommand("testui", function()
  OpenUI({
    title = "Przykładowe UI",
    message = "To jest minimalny boilerplate"
  })
end, false)

RegisterNUICallback('submitData', function(data, cb)
  lib.print.info(data)
  cb("ok")
end)