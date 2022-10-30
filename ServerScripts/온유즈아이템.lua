
Server.onUseItem.Add(function(unit, item)
	local id = item.dataID
	if id == 418 then
		local itemOp = Utility.GetItemOptions(item)
		if #itemOp >= 1 then
			local value = itemOp[1].value
			unit.AddGameMoney(value)
			unit.SendCenterLabel(value..' 골드를 획득하였습니다.')
		end
	end
end)