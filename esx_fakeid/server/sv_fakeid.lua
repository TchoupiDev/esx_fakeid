ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_fakeid:SetFirstName')
AddEventHandler('esx_fakeid:SetFirstName', function(ID, firstName)
    local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= 10000 then
		local newfirstname = xPlayer.getName()
        xPlayer.removeMoney(10000)
		SetFirstName(identifier, firstName)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Votre nouveau prénom est '.. newfirstname ..'' })
	elseif xPlayer.getAccount('bank').money >= 10000 then
		local newfirstname = xPlayer.getName()
		xPlayer.removeAccountMoney('bank', 10000)
		SetFirstName(identifier, firstName)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Votre nouveau prénom est '.. newfirstname ..'' })
	else
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Vous n\'avez pas assez d\'argent !' })
	end
end)

RegisterServerEvent('esx_fakeid:SetLastName')
AddEventHandler('esx_fakeid:SetLastName', function(ID, lastName)
    local identifier = ESX.GetPlayerFromId(ID).identifier
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getMoney() >= 10000 then
		local newlastname = xPlayer.getName()
        xPlayer.removeMoney(10000)
		SetLastName(identifier, lastName)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Votre nouveau nom est '.. lastName ..''})
	elseif xPlayer.getAccount('bank').money >= 10000 then
		local newlastname = xPlayer.getName()
		xPlayer.removeAccountMoney('bank', 10000)
		SetLastName(identifier, lastName)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Votre nouveau prénom est '.. lastName ..'' })
	else
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Vous n\'avez pas assez d\'argent !' })
	end
end)

function SetFirstName(identifier, firstName)
	MySQL.Async.execute('UPDATE `users` SET `firstname` = @firstname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@firstname']		= firstName
	})
end

function SetLastName(identifier, lastName)
	MySQL.Async.execute('UPDATE `users` SET `lastname` = @lastname WHERE identifier = @identifier', {
		['@identifier']		= identifier,
		['@lastname']		= lastName
	})
end

RegisterNetEvent('esx_fakeid:SetVisum')
AddEventHandler('esx_fakeid:SetVisum', function(type, price)
	local _source = source	
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
		TriggerEvent('esx_license:addLicense', _source, type, function()
		end)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Voici votre nouvel licence  '.. type ..'' })
	elseif xPlayer.getAccount('bank').money >= price then
		xPlayer.removeAccountMoney('bank', price)
		TriggerEvent('esx_license:addLicense', _source, type, function()
		end)
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Voici votre nouvel licence '.. type ..'' })
	else
		--TriggerClientEvent('mythic_notify:client:SendAlert', xPlayer.source, { type = 'inform', text = 'Vous n\'avez pas assez d\'argent !' })
	end
end)