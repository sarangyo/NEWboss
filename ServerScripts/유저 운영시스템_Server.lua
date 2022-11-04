local Super_Admin = {'감사해', '수니몬', 'TEST_1', '감사해'} 
--최고운영자(모든권한)

local Assi_Admin = {'없음요들레이요를레이이 히히'}
--부운영자(밴, 출두, 소환, 인밴창고 보기), (아이템 지급, 회수권한 없음)

for _, v in ipairs(Super_Admin) do Super_Admin[v] = true end
for _, v in ipairs(Assi_Admin) do Assi_Admin[v] = true end
local Every_Admin = {}
for _, v in ipairs(Super_Admin) do table.insert(Every_Admin, v) end
for _, v in ipairs(Assi_Admin) do table.insert(Every_Admin, v) end
for _, v in ipairs(Every_Admin) do Every_Admin[v] = true end

function Operation(unit)
	local p = {name={}}
	
	for i, v in pairs(Server.players) do
		local u = v.unit
		local I = tostring(i)
		
		table.insert(p.name, (u.player.name:gsub('/','')))
	end

	unit.FireEvent("send_operation", Utility.JSONSerialize(p))
end


Server.GetTopic("Item_remove").Add(function(N, q, w)
	local Q = tonumber(q)
	
	if Nickname_data[N] then
		local u = Nickname_data[N]
		if Super_Admin[unit.player.name] then
			u.RemoveItem(Q, tonumber(w), false)
			u.SendCenterLabel('<color=#00FFFF>관리자가 '..Server.GetItem(Q).name..' 아이템을 '..w..'개 회수하였습니다.</color>')
			u.SendSay('<color=#00FFFF>관리자가 '..Server.GetItem(Q).name..' 아이템을 '..w..'개 회수하였습니다.</color>')
			unit.SendCenterLabel('회수완료')
		else
			unit.SendCenterLabel('Super_Admin의 권한입니다.')
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("Item_Add").Add(function(N, q, w)
	local Q = tonumber(q)
	
	if Nickname_data[N] then
		local u = Nickname_data[N]
		if Super_Admin[unit.player.name] then
			u.AddItem(Q, tonumber(w), false)
			u.SendCenterLabel('<color=#00FFFF>관리자가 '..Server.GetItem(Q).name..' 아이템을 '..w..'개 부여하였습니다.</color>')
			u.SendSay('<color=#00FFFF>관리자가 '..Server.GetItem(Q).name..' 아이템을 '..w..'개 부여하였습니다.</color>')
			unit.SendCenterLabel('부여완료')
		else
			unit.SendCenterLabel('Super_Admin의 권한입니다.')
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("var_get").Add(function(N, q)
	local Q = tonumber(q)
	
	if Nickname_data[N] then
		local u = Nickname_data[N]
		unit.SendCenterLabel(Q..'번 변수값 : '..u.GetVar(Q))
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("var_set").Add(function(N, q, w)
	local Q = tonumber(q)
	
	if Nickname_data[N] then
		local u = Nickname_data[N]
		if Super_Admin[unit.player.name] then
			u.SetVar(Q, tonumber(w))
			unit.SendCenterLabel('변경완료')
		else
			unit.SendCenterLabel('Super_Admin의 권한입니다.')
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("summon").Add(function(name)
	local u = Nickname_data[name]
	if u then
		unit.field.JoinUnit(u, Point(unit.x, unit.y))
		if Assi_Admin[unit.player.name] then
			Server.SendSay('부운영자 '..unit.player.name..'님이 '.. u.player.name..' 님을 ['..unit.field.name.. '] 으로 소환하였습니다.')
		end

	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("appear").Add(function(name)
	local u = Nickname_data[name]
	if u then
		u.field.JoinUnit(unit, Point(u.x, u.y))
		if Assi_Admin[unit.player.name] then
			Server.SendSay('부운영자 '..unit.player.name..'님이 '.. u.player.name..' 님의 ['..u.field.name.. '] 맵으로 출두하였습니다.')
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("Warehouse").Add(function(Name, ID)
	local u = Nickname_data[Name]
	if u then
		if ID == '인벤' then
			local list = {name=Name, id=ID, item={}, size=#u.player.GetItems()}
			for j, v in ipairs(u.player.GetItems()) do
				list.item[j] = {dataID=v.dataID, count=v.count, level=v.level, id=v.id}
			end
			unit.FireEvent("viewStorage", Utility.JSONSerialize(list))
			if Assi_Admin[unit.player.name] then
				Server.SendSay('부운영자 '..unit.player.name..'님이 '.. u.player.name..' 님의 [인벤]을 확인합니다.')
			end

		else
			local list = {name=Name, id=ID, item={}, size=#u.player.GetStorageItems(ID)}
			for j, v in ipairs(u.player.GetStorageItems(ID)) do
				list.item[j] = {dataID=v.dataID, count=v.count, level=v.level}
			end
			unit.FireEvent("viewStorage", Utility.JSONSerialize(list))
			if Assi_Admin[unit.player.name] then
				Server.SendSay('부운영자 '..unit.player.name..'님이 '.. u.player.name..' 님의 [창고]를 확인합니다.')
			end
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Server.GetTopic("아이템내놔").Add(function(name, id, ID, key)
	local u = Nickname_data[name]
	if u then
		if Super_Admin[unit.player.name] then
			if ID == '인벤' then
				u.RemoveItemByID(id, u.player.GetItem(id).count, false)
				--u.SendSay('<color=#00FFFF>관리자가 특정 아이템을 회수하였습니다.</color>')
				unit.SendCenterLabel('회수완료')
			else
				local data = u.player.GetStorageItems(ID)[key]
				u.player.RemoveStorageItem(ID, data.dataID, data.count)
				unit.SendCenterLabel('회수완료\n<color=#BDBDBD>같은 아이템의 경우, 적은 아이템부터 회수가 가능함.</color>')
			end
		else
			unit.SendCenterLabel('Super_Admin의 권한입니다.')
		end
	else
		unit.SendCenterLabel('유저가 존재하지 않습니다.')
	end
end)

Unit_data = {}
Unit_dataID = {}
Nickname_data = {}
local function onJoinPlayer(RPlayer)
	local u = RPlayer.unit
	Unit_data[RPlayer.id] = u
	Unit_dataID[u.id] = u
	local id = RPlayer.id
	local name = u.player.name
	Nickname_data[name] = u
end
Server.onJoinPlayer.Add(onJoinPlayer)

