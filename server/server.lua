RegisterCommand("checkperms", function(source, args, rawCommand)
	local pid = tonumber(args[1])
	for i = 1, #Config.ServerPerms do
		if IsPlayerAceAllowed(pid, Config.ServerPerms[i]) then
			TriggerClientEvent('JD_permcheck.SendChat', source, GetPlayerName(pid).." ^*^2Does^0^r have ^*"..Config.ServerPerms[i])
		else
			TriggerClientEvent('JD_permcheck.SendChat', source, GetPlayerName(pid).." ^*^1Doesn't^0^r have ^*"..Config.ServerPerms[i])
		end
	end
end)


-- version check
Citizen.CreateThread(
	function()
		local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
		if vRaw and Config.versionCheck then
			local v = json.decode(vRaw)
			PerformHttpRequest(
				'https://raw.githubusercontent.com/JokeDevil/JD_permCheck/master/version.json',
				function(code, res, headers)
					if code == 200 then
						local rv = json.decode(res)
						if rv.version ~= v.version then
							print(
								([[^1

-------------------------------------------------------
JD_permCheck
UPDATE: %s AVAILABLE
CHANGELOG: %s
-------------------------------------------------------
^0]]):format(
									rv.version,
									rv.changelog
								)
							)
						end
					else
						print('JD_permCheck unable to check version')
					end
				end,
				'GET'
			)
		end
	end
)
