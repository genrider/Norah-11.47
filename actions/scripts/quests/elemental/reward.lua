function onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
local config = {
	[2020] = {item = 5803, storage = Storage.Elemental.Reward},
	[2019] = {item = 6528, storage = Storage.Elemental.Reward},
	[2018] = {item = 2453, storage = Storage.Elemental.Reward}
}

local v = config[item.uid]
if v and player:getStorageValue(v.storage) == -1 then
	if player:getFreeCapacity() >= ItemType(v.item):getWeight() then
		if player:addItem(v.item, 1, false) then
			else
			return player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. ItemType(v.item):getName() .. ', but you have no room to take it.')
		end
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. '.')
			player:setStorageValue(v.storage, 1)
		else
			player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found a ' .. ItemType(v.item):getName() .. ' weighing ' .. string.format('%.2f', (ItemType(v.item):getWeight() / 100)) ..  ' oz it\'s too heavy.')
		end
	else
		player:sendTextMessage(MESSAGE_INFO_DESCR, "It is empty.")
end
return true
end