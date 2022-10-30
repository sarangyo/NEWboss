--[[
	제작 : 사랑요
	마음대로 사용하시고 마음껏 수정하세요.
	
	☑ 사용법
	서버에서 사용하려면 selling_start() 를 입력하시면 됩니다.
	클라이언트에서 사용하려면 Client.FireEvent("selling") 를 입력하시면 됩니다.
]]

Server.GetTopic("selling_end").Add(function(ID, su)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
		if Tem[i].count < su then
			unit.SendCenterLabel("수량이 부족합니다.")
			return
		end
		if unit.IsEquippedItem(p) then
			unit.SendCenterLabel("착용 중인 아이템은 판매할 수 없습니다.")
			return
		end
	end
	
	local sum = 0
	for i, p in pairs(id) do
		local Sem = Server.GetItem(Tem[i].dataID).sellerPrice
		sum = sum + Sem*su
		unit.RemoveItemByID(p, su, false)
	end
	--[[
	if unit.IsEquippedItemByDataID(138)==true then
		sum = math.floor(sum+sum*0.05)
	end]]
	
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

Server.GetTopic("selling_end2").Add(function(ID)
	local id = Utility.JSONParse(ID)
	local Tem = {}
	for i, p in pairs(id) do
		Tem[i] = unit.player.GetItem(p)
		if Tem[i] == nil then 
			unit.SendCenterLabel("비정상적 판매시도")
			return
		end
		if unit.IsEquippedItem(p) then
			unit.SendCenterLabel("착용 중인 아이템은 판매할 수 없습니다.")
			return
		end
	end
	
	local sum = 0
	local su = 0
	for i, p in pairs(id) do
		local Sem = Server.GetItem(Tem[i].dataID).sellerPrice * Tem[i].count
		sum = sum + Sem
		su = Tem[i].count
		unit.RemoveItemByID(p, su, false)
	end
	
	if unit.IsEquippedItemByDataID(138)==true then
		sum = math.floor(sum+sum*0.05)
	end
	
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

Server.GetTopic("selling_end3").Add(function(DATA_ID)
	local sum = Server.GetItem(DATA_ID).sellerPrice * unit.CountItem(DATA_ID)
	
	unit.RemoveItem(DATA_ID, unit.CountItem(DATA_ID), false)
	
	if unit.IsEquippedItemByDataID(138)==true then
		sum = math.floor(sum+sum*0.05)
	end
	
	unit.AddGameMoney(sum)
	unit.SendCenterLabel("<color=#81DAF5>아이템을 판매하여 "..sum.."골드를 획득하셨습니다.</color>")
end)

local function filter(Q, W, E)
	local text1, text2, text3 = "", (G_stat_text[W]):gsub('/', ''), ""
	
	if Q == 1 then
		text1 = '직업 '..text2..' +'..E
	elseif Q == 2 then
		text1 = '직업 '..text2..' +'..E..'%'
	elseif Q == 3 then
		text1 = '아이템 '..text2..' +'..E
	elseif Q == 4 then
		text1 = '아이템 '..text2..' +'..E..'%'
	else
		text1 = text2..' +'..E
	end
	
	text1 = text1.."\n"
	return text1
end


local function selling_start()
	local Q, W, E, R, T = {}, {}, {}, {}, {}
	local Tstr, Eq = {}, {}
	for i, p in pairs(unit.player.GetItems()) do
		table.insert(Q, p.dataID)
		table.insert(W, p.id)
		table.insert(E, p.count)
		table.insert(R, p.level)
		table.insert(T, Utility.GetItemOptions(p))
		table.insert(Tstr, '')
		table.insert(Eq, unit.IsEquippedItem(p.id))
	end
	for i, p in pairs(T) do
		for j, o in pairs(p) do
			Tstr[i] = Tstr[i]..filter(o.type, o.statID, o.value)
		end	
	end
	
	local q, w, e, r, t = Utility.JSONSerialize(Q), Utility.JSONSerialize(W), Utility.JSONSerialize(E), Utility.JSONSerialize(R), Utility.JSONSerialize(Tstr)
	local eq = Utility.JSONSerialize(Eq)
	unit.FireEvent("selling_start", q, w, e, r, t, eq)
end

Server.GetTopic("selling").Add(function()
	selling_start()
end)

