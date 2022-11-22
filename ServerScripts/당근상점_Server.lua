local data = {}
data['2'] = {}
data['2'].item_dataID = 77 -- 재화가 될 아이템
data['2'][1] = {id=14, cost=40}
data['2'][2] = {id=78, cost=484}
data['2'][3] = {id=81, cost=0}
data['2'][4] = {id=83, cost=484}
data['2'][5] = {id=201, cost=560}
data['2'][6] = {id=124, cost=1073}
data['2'][7] = {id=125, cost=2950}
data['2'][8] = {id=126, cost=11105}


data['3'] = {}
data['3'].item_dataID = 77
data['3'][1] = {id=223, cost=4780}
data['3'][2] = {id=251, cost=4780}
data['3'][3] = {id=252, cost=7500}
data['3'][4] = {id=230, cost=1050}
data['3'][5] = {id=231, cost=1550}
data['3'][6] = {id=233, cost=2150}
data['3'][7] = {id=234, cost=2750}
data['3'][8] = {id=235, cost=3650}

data['4'] = {}
data['4'].item_dataID = 224
data['4'][1] = {id=283, cost=5}
data['4'][2] = {id=279, cost=1}
data['4'][3] = {id=280, cost=3}
data['4'][4] = {id=281, cost=5}
data['4'][5] = {id=290, cost=3}
data['4'][6] = {id=291, cost=3}
data['4'][7] = {id=292, cost=3}
data['4'][8] = {id=288, cost=1}
data['4'][9] = {id=297, cost=3}
data['4'][10] = {id=302, cost=5}
data['4'][11] = {id=307, cost=7}
data['4'][12] = {id=312, cost=10}
data['4'][13] = {id=314, cost=3}
data['4'][14] = {id=315, cost=4}
data['4'][15] = {id=316, cost=5}
data['4'][16] = {id=317, cost=7}
data['4'][17] = {id=318, cost=9}
data['4'][18] = {id=319, cost=11}
data['4'][19] = {id=320, cost=13}
data['4'][20] = {id=321, cost=15}
data['4'][21] = {id=323, cost=1}
data['4'][22] = {id=324, cost=4}
data['4'][23] = {id=323, cost=1}
data['4'][24] = {id=323, cost=1}
data['4'][25] = {id=323, cost=1}
data['4'][26] = {id=323, cost=1}
data['4'][27] = {id=323, cost=1}
data['4'][28] = {id=323, cost=1}
data['4'][29] = {id=323, cost=1}
data['4'][30] = {id=323, cost=1}
data['4'][31] = {id=323, cost=1}
data['4'][32] = {id=324, cost=4}
data['4'][33] = {id=324, cost=4}
data['4'][34] = {id=324, cost=4}
data['4'][35] = {id=324, cost=4}
data['4'][36] = {id=324, cost=4}
data['4'][37] = {id=324, cost=4}
data['4'][38] = {id=324, cost=4}
data['4'][39] = {id=324, cost=4}
data['4'][40] = {id=324, cost=4}

data['5'] = {}
data['5'].item_dataID = 224
data['5'][1] = {id=283, cost=5}
data['5'][2] = {id=140, cost=5}
data['5'][3] = {id=347, cost=150}
data['5'][4] = {id=253, cost=40}
data['5'][5] = {id=281, cost=25}
data['5'][6] = {id=253, cost=45}
data['5'][7] = {id=416, cost=45}
data['5'][8] = {id=505, cost=100}
data['5'][9] = {id=505, cost=100}
data['5'][10] = {id=505, cost=100}
data['5'][11] = {id=505, cost=100}
data['5'][12] = {id=505, cost=100}
data['5'][13] = {id=507, cost=200}

data['6'] = {}
data['6'].item_dataID = 419
data['6'][1] = {id=483, cost=777777}
data['6'][2] = {id=489, cost=777777}
data['6'][3] = {id=495, cost=777777}
data['6'][4] = {id=505, cost=8500}
data['6'][5] = {id=505, cost=8500}
data['6'][6] = {id=505, cost=8500}
data['6'][7] = {id=505, cost=8500}
data['6'][8] = {id=505, cost=8500}
data['6'][9] = {id=510, cost=85000}
data['6'][10] = {id=511, cost=189200}

data['7'] = {}
data['7'].item_dataID = 417
data['7'][1] = {id=508, cost=500}
data['7'][2] = {id=524, cost=200}
data['7'][3] = {id=525, cost=200}

local user_data = {}
for i=1, 300 do
	user_data[i] = false
end

Server.GetTopic("정수상점_data").Add(function(var)
	local t = unit.GetStringVar(var)
	if t == '' or t == nil then
		unit.SetStringVar(var, Utility.JSONSerialize(user_data))
	end
	
	local stringvar = tostring(var)
	unit.FireEvent('정수상점_start', Utility.JSONSerialize(data[stringvar]), unit.CountItem(data[stringvar].item_dataID), data[stringvar].item_dataID, unit.GetStringVar(var), var)
end)

Server.GetTopic("정수상점_구매시도").Add(function(num, var)
	local stringvar = tostring(var)
	local count = unit.CountItem(data[stringvar].item_dataID)
	if count >= data[stringvar][num].cost then
		unit.RemoveItem(data[stringvar].item_dataID, data[stringvar][num].cost, false)
		unit.AddItem(data[stringvar][num].id, 1, false)
		unit.SendCenterLabel('구매에 성공하였습니다!')
		unit.FireEvent('정수상점_구매성공', num, unit.CountItem(data[stringvar].item_dataID))
		local T = Utility.JSONParse(unit.GetStringVar(var))
		T[num] = true
		unit.SetStringVar(var, Utility.JSONSerialize(T))
	else
		unit.FireEvent('정수상점_구매실패')
	end
end)























