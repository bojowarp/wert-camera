local QBCore = exports['qb-core']:GetCoreObject()

local WebHook = "https://discord.com/api/webhooks/1062917780015427584/Oxl5ARG8K1Oxs827OUo1Zr0gfZqfo_MM6rkBOMSAM55lg3AOPS2Vqi9Khs4mdpTJGzuP"

QBCore.Functions.CreateUseableItem("camera", function(source, item)
    local src = source
    TriggerClientEvent("wert-camera:client:use-camera", src)
end)

QBCore.Functions.CreateUseableItem("photo", function(source, item)
    local src = source
    if item.info and item.info.photourl then
        TriggerClientEvent("wert-camera:client:use-photo", src, item.info.photourl)
    end
end)

RegisterNetEvent("wert-camera:server:add-photo-item", function(url)
    local src = source
    local ply = QBCore.Functions.GetPlayer(source)
    if ply then
        local info = {
            photourl = url
        }
        ply.Functions.AddItem("photo", 1, nil, info)
    end
end)

QBCore.Functions.CreateCallback("wert-camera:server:webhook",function(source,cb)
	if WebHook ~= "" then
		cb(WebHook)
	else
		cb(nil)
	end
end)
