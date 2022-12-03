-- Copyright 2021. 사랑요 All rights reserved
--
-- *주의사항
-- 쿨타임은 안전하게 5초 이상으로 해주세요.
-- 뽑기까지 대략 5초가 걸리는데, 5초안에 강제종료를 하면 아이템을 못받을 수도 있어요.
-- 강제 종료 시 복구가 불가하다는 점을 유저들에게 숙지시켜주세요.

--[[ 건들지 않아도 됨. ]]
--[[ ]] local box = {}
--[[ ]] function box.weight(t)
--[[ ]] 	local sum = 0
--[[ ]] 	for _, v in pairs(t) do
--[[ ]] 		sum = sum + v.chance
--[[ ]]		end
--[[ ]]
--[[ ]] 	local Rand = rand(0, sum)
--[[ ]] 	for k, v in pairs(t) do
--[[ ]] 		if Rand < v.chance then
--[[ ]] 			return k
--[[ ]]			end
--[[ ]] 		Rand = Rand - v.chance
--[[ ]]		end
--[[ ]]	end


-- 바꿔주셔야할 부분
box.options = {}
box.options.per = 1 -- 1% 미만의 확률을 가진 아이템은 서버알람이 뜸.
box.options.sum = {}
box.options[1] = { -- 벨류값이 0 이면 안됨.
	['18'] = {chance=10, min=1, max=1}, -- min최소 개수, max최대 개수(장비아이템은 무조건 1로 하시고 그 외에 재료, 소모품 등은 2 이상 해도돼요.)
	['19'] = {chance=9, min=1, max=1},
	['20'] = {chance=8, min=1, max=1},
	['21'] = {chance=7, min=1, max=1},
	['22'] = {chance=7, min=1, max=1},
	['23'] = {chance=6, min=1, max=1},
	['24'] = {chance=6, min=1, max=1},
	['37'] = {chance=10, min=1, max=1},
	['38'] = {chance=9, min=1, max=1},
	['39'] = {chance=8, min=1, max=1},
	['40'] = {chance=7, min=1, max=1},
	['41'] = {chance=6, min=1, max=1},
	['42'] = {chance=6, min=1, max=1},
	['43'] = {chance=6, min=1, max=1},
	['60'] = {chance=10, min=1, max=1},
	['61'] = {chance=10, min=1, max=1},
	['62'] = {chance=9, min=1, max=1},
	['63'] = {chance=8, min=1, max=1},
	['64'] = {chance=7, min=1, max=1},
	['65'] = {chance=6, min=1, max=1},
	['66'] = {chance=6, min=1, max=1},
	['87'] = {chance=10, min=1, max=1},
	['88'] = {chance=9, min=1, max=1},
	['89'] = {chance=8, min=1, max=1},
	['90'] = {chance=7, min=1, max=1},
	['91'] = {chance=6, min=1, max=1},
	['92'] = {chance=6, min=1, max=1},
	['93'] = {chance=6, min=1, max=1},
	['204'] = {chance=10, min=1, max=1},
	['205'] = {chance=9, min=1, max=1},
	['206'] = {chance=8, min=1, max=1},
	['207'] = {chance=7, min=1, max=1},
	['208'] = {chance=7, min=1, max=1},
	['209'] = {chance=6, min=1, max=1},
	['210'] = {chance=6, min=1, max=1},
	['384'] = {chance=8, min=1, max=1},
	['385'] = {chance=7, min=1, max=1},
	['386'] = {chance=7, min=1, max=1},
	['387'] = {chance=6, min=1, max=1},
	['388'] = {chance=6, min=1, max=1},
}
box.options[2] = { -- 벨류값이 0 이면 안됨.
	['25'] = {chance=28, min=1, max=1},
	['26'] = {chance=16, min=1, max=1},
	['27'] = {chance=14, min=1, max=1},
	['28'] = {chance=6, min=1, max=1},
	['29'] = {chance=6, min=1, max=1},
	['44'] = {chance=26, min=1, max=1},
	['45'] = {chance=16, min=1, max=1},
	['46'] = {chance=14, min=1, max=1},
	['47'] = {chance=6, min=1, max=1},
	['48'] = {chance=6, min=1, max=1},
	['67'] = {chance=30, min=1, max=1},
	['69'] = {chance=16, min=1, max=1},
	['70'] = {chance=14, min=1, max=1},
	['71'] = {chance=6, min=1, max=1},
	['94'] = {chance=26, min=1, max=1},
	['95'] = {chance=18, min=1, max=1},
	['96'] = {chance=16, min=1, max=1},
	['97'] = {chance=16, min=1, max=1},
	['98'] = {chance=14, min=1, max=1},
	['99'] = {chance=12, min=1, max=1},
	['100'] = {chance=6, min=1, max=1},
	['101'] = {chance=6, min=1, max=1},
	['211'] = {chance=28, min=1, max=1},
	['212'] = {chance=18, min=1, max=1},
	['213'] = {chance=16, min=1, max=1},
	['214'] = {chance=6, min=1, max=1},
	['215'] = {chance=6, min=1, max=1},
	['14'] = {chance=29, min=1, max=1},
	['78'] = {chance=20, min=1, max=1},
	['81'] = {chance=20, min=1, max=1},
	['83'] = {chance=20, min=1, max=1},
	['201'] = {chance=1, min=1, max=1},
	['223'] = {chance=1, min=1, max=1},
	['251'] = {chance=1, min=1, max=1},
	['252'] = {chance=1, min=1, max=1},
	['253'] = {chance=1, min=1, max=1},
	['389'] = {chance=8, min=1, max=1},
	['390'] = {chance=7, min=1, max=1},
	['391'] = {chance=7, min=1, max=1},
	['392'] = {chance=6, min=1, max=1},
}
box.options[3] = { -- 벨류값이 0 이면 안됨.
	['32'] = {chance=14, min=1, max=1},
	['33'] = {chance=8, min=1, max=1},
	['49'] = {chance=24, min=1, max=1},
	['50'] = {chance=22, min=1, max=1},
	['51'] = {chance=18, min=1, max=1},
	['52'] = {chance=16, min=1, max=1},
	['53'] = {chance=14, min=1, max=1},
	['54'] = {chance=12, min=1, max=1},
	['55'] = {chance=8, min=1, max=1},
	['56'] = {chance=8, min=1, max=1},
	['104'] = {chance=14, min=1, max=1},
	['105'] = {chance=22, min=1, max=1},
	['106'] = {chance=20, min=1, max=1},
	['107'] = {chance=20, min=1, max=1},
	['108'] = {chance=20, min=1, max=1},
	['109'] = {chance=20, min=1, max=1},
	['110'] = {chance=20, min=1, max=1},
	['111'] = {chance=18, min=1, max=1},
	['112'] = {chance=16, min=1, max=1},
	['113'] = {chance=14, min=1, max=1},
	['114'] = {chance=8, min=1, max=1},
	['115'] = {chance=8, min=1, max=1},
	['116'] = {chance=8, min=1, max=1},
	['117'] = {chance=8, min=1, max=1},
	['218'] = {chance=26, min=1, max=1},
	['219'] = {chance=22, min=1, max=1},
	['220'] = {chance=18, min=1, max=1},
	['221'] = {chance=8, min=1, max=1},
	['251'] = {chance=2, min=1, max=1},
	['252'] = {chance=2, min=1, max=1},
	['253'] = {chance=2, min=1, max=1},
	['393'] = {chance=28, min=1, max=1},
	['394'] = {chance=20, min=1, max=1},
	['395'] = {chance=16, min=1, max=1},
	['396'] = {chance=8, min=1, max=1},
	['496'] = {chance=15, min=6, max=13},
	['497'] = {chance=15, min=6, max=13},
	['498'] = {chance=15, min=6, max=13},
	['499'] = {chance=15, min=3, max=7},
	['526'] = {chance=15, min=2, max=5},
	['77'] = {chance=3, min=3333, max=6666},
}
box.options[4] = { -- 벨류값이 0 이면 안됨.
	['78'] = {chance=200, min=1, max=1},
	['81'] = {chance=200, min=1, max=2},
	['416'] = {chance=40, min=1, max=1},
	['83'] = {chance=120, min=1, max=1},
	['223'] = {chance=120, min=1, max=1},
	['251'] = {chance=120, min=1, max=1},
	['252'] = {chance=120, min=1, max=1},
	['253'] = {chance=150, min=1, max=1},
	['320'] = {chance=40, min=1, max=1},
	['321'] = {chance=30, min=1, max=1},
	['379'] = {chance=200, min=1, max=2},
	['380'] = {chance=200, min=1, max=2},
	['381'] = {chance=200, min=1, max=2},
	['382'] = {chance=200, min=1, max=2},
	['402'] = {chance=200, min=1, max=2},
	['407'] = {chance=20, min=1, max=1},
	['409'] = {chance=2, min=1, max=1},
	['410'] = {chance=2, min=1, max=1},
	['411'] = {chance=2, min=1, max=1},
	['412'] = {chance=2, min=1, max=1},
	['413'] = {chance=2, min=1, max=1},
	['414'] = {chance=2, min=1, max=1},
	['426'] = {chance=30, min=1, max=1},
	['427'] = {chance=4, min=1, max=1},
	['283'] = {chance=10, min=1, max=4},
	['496'] = {chance=50, min=14, max=25},
	['497'] = {chance=50, min=14, max=25},
	['498'] = {chance=50, min=14, max=25},
	['499'] = {chance=50, min=7, max=12},
	['526'] = {chance=50, min=4, max=8},
	['77'] = {chance=12, min=12222, max=24444},
	['505'] = {chance=20, min=1, max=1},
}
box.options[5] = { -- 음식상자
	['230'] = {chance=200, min=1, max=1},
	['231'] = {chance=200, min=1, max=1},
	['232'] = {chance=200, min=1, max=1},
	['233'] = {chance=200, min=1, max=1},
	['234'] = {chance=200, min=1, max=1},
	['235'] = {chance=190, min=1, max=1},
	['236'] = {chance=190, min=1, max=1},
	['237'] = {chance=190, min=1, max=1},
	['238'] = {chance=190, min=1, max=1},
	['239'] = {chance=190, min=1, max=1},
	['240'] = {chance=180, min=1, max=1},
	['241'] = {chance=180, min=1, max=1},
	['242'] = {chance=180, min=1, max=1},
	['243'] = {chance=180, min=1, max=1},
	['244'] = {chance=180, min=1, max=1},
	['245'] = {chance=170, min=1, max=1},
	['246'] = {chance=150, min=1, max=1},
	['247'] = {chance=140, min=1, max=1},
	['248'] = {chance=130, min=1, max=1},
	['249'] = {chance=120, min=1, max=1},
	['250'] = {chance=110, min=1, max=1},
	['254'] = {chance=100, min=1, max=1},
	['255'] = {chance=90, min=1, max=1},
	['256'] = {chance=90, min=1, max=1},
	['257'] = {chance=90, min=1, max=1},
	['258'] = {chance=80, min=1, max=1},
	['259'] = {chance=80, min=1, max=1},
	['260'] = {chance=70, min=1, max=1},
	['261'] = {chance=60, min=1, max=1},
	['262'] = {chance=55, min=1, max=1},
	['263'] = {chance=45, min=1, max=1},
	['264'] = {chance=40, min=1, max=1},
	['265'] = {chance=35, min=1, max=1},
	['266'] = {chance=30, min=1, max=1},
	['267'] = {chance=25, min=1, max=1},
	['268'] = {chance=20, min=1, max=1},
	['269'] = {chance=15, min=1, max=1},
	['270'] = {chance=10, min=1, max=1},
	['271'] = {chance=9, min=1, max=1},
	['272'] = {chance=8, min=1, max=1},
	['273'] = {chance=7, min=1, max=1},
	['274'] = {chance=6, min=1, max=1},
	['275'] = {chance=5, min=1, max=1},
	['276'] = {chance=4, min=1, max=1},
	['277'] = {chance=3, min=1, max=1},
	['278'] = {chance=3, min=1, max=1},
}

box.options[6] = { -- 오래된 나무 상자
	['428'] = {chance=1, min=1, max=1},
	['419'] = {chance=200, min=1000, max=2000},
	['378'] = {chance=200, min=5, max=5},
	['379'] = {chance=200, min=3, max=3},
	['380'] = {chance=200, min=3, max=3},
	['381'] = {chance=200, min=3, max=3},
	['382'] = {chance=200, min=3, max=3},
	['323'] = {chance=200, min=12, max=12},
	['282'] = {chance=200, min=3, max=3},
	['505'] = {chance=40, min=1, max=1},
	['224'] = {chance=200, min=50, max=50},
	['77'] = {chance=80, min=24444, max=36666},
}
-- 여기까지 건들면되고
-- box.options[6] box.options[7] .. 계속 추가하셔도 돼요.

--[[ 건들지 않아도 됨. ]]
for i = 1, #box.options do
	box.options.sum[i] = 0
	for _, v in pairs(box.options[i]) do
		box.options.sum[i] = box.options.sum[i] + v.chance
	end
end

local Find = string.find
local Sub = string.sub
local function remove_color(txt)
	local txt2, num = txt:gsub('</color>', '')
	if num > 0 then -- 색이 있음
		for i=1, num do
			local first, last = Find(txt2, '<color=#')
			local txt3 = Sub(txt2, 1, first-1)
			txt2 = txt3..Sub(txt2, last+8, #txt2)
		end
	end
	
	return txt2
end

local function box_table(index)
	local txt = ""
	local getitem = Server.GetItem
	local num = box.options.sum[index]
	for i, v in pairs(box.options[index]) do
		txt = txt .. remove_color(getitem(tonumber(i)).name) .. " - " .. string.format("%.4f", (v.chance / num) * 100) .. "%\n"
	end
	print(txt)
end

Server.RunLater(function()
	-- box_table(2)
end, 1)

function random_box(num, box_dataID)
	if unit.CountItem(box_dataID) < 1 then
		unit.SendCenterLabel("비정상적 시도입니다.")
		return
	end
	unit.RemoveItem(box_dataID, 1, false)
	unit.FireEvent("random_box", box_dataID, Utility.JSONSerialize(box.options[num]), num)
end

Server.GetTopic('box_open').Add(function(id, box_dataID)
	local data = box.options[id]
	local key = box.weight(data)
	local res = tonumber(key)
	local item_bool = false
	local count = rand(data[key].min, data[key].max+1)
	unit.AddItem(res, count, false)
	if data[key].chance / box.options.sum[id] < box.options.per*0.01--[[*say_per]] then
		Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 '..Server.GetItem(res).name..'을(를) '..count..'개 획득하셨습니다.</color>')
	end
	if unit.CountItem(box_dataID) >= 1 then
		item_bool = true
	end
	unit.FireEvent('box_show', res, item_bool, count)
end)

Server.GetTopic('box_false').Add(function(id)
	unit.AddItem(id, 1, false)
end)

Server.GetTopic('box_keepOpen').Add(function(box_dataID, num)
	if unit.CountItem(box_dataID) >= 1 then
		unit.RemoveItem(box_dataID, 1, false)
		local data = box.options[num]
		local key = box.weight(data)
		local res = tonumber(key)
		local item_bool = false
		local count = rand(data[key].min, data[key].max+1)
		unit.AddItem(res, count, false)
		-- unit.SendSay(data[key].chance / box.options.sum[num]..'%'..' / '.. box.options.per*0.01..'%')
		if data[key].chance / box.options.sum[num] < box.options.per*0.01--[[*say_per]] then
			Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 '..Server.GetItem(res).name..'을(를) '..count..'개 획득하셨습니다.</color>')
		end
		if unit.CountItem(box_dataID) >= 1 then
			item_bool = true
		end
		unit.FireEvent('box_show', res, item_bool, count)
	else
		unit.FireEvent(Server.GetItem(box_dataID).name..'가 부족합니다.')
	end
end)