RegisterNetEvent('JD_permcheck.SendChat')
AddEventHandler('JD_permcheck.SendChat', function(message)
	local _message = message
	TriggerEvent('chat:addMessage', {color = { 0, 125, 255},multiline = true,args = {"[JD_PermCheck]", _message}})
end)