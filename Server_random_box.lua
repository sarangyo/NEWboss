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
--[[ ]] 		sum = sum + v
--[[ ]]		end
--[[ ]]		
--[[ ]]
--[[ ]] 	local Rand = rand(0, sum)
--[[ ]] 	for k, v in pairs(t) do
--[[ ]] 		if Rand < v then
--[[ ]] 			return k
--[[ ]]			end
--[[ ]] 		Rand = Rand - v
--[[ ]]		end
--[[ ]]	end


-- 바꿔주셔야할 부분
box.options = {}
box.options.per = 1 -- 1% 미만의 확률을 가진 아이템은 서버알람이 뜸.
box.options.sum = {}
box.options[1] = { -- 벨류값이 0 이면 안됨.
	['18'] = 10,
	['19'] = 9,
	['20'] = 8,
	['21'] = 7,
	['22'] = 7,
	['23'] = 6,
	['24'] = 6,
	['37'] = 10,
	['38'] = 9,
	['39'] = 8,
	['40'] = 7,
	['41'] = 6,
	['42'] = 6,
	['43'] = 6,
	['60'] = 10,
	['61'] = 10,
	['62'] = 9,
	['63'] = 8,
	['64'] = 7,
	['65'] = 6,
	['66'] = 6,
	['87'] = 10,
	['88'] = 9,
	['89'] = 8,
	['90'] = 7,
	['91'] = 6,
	['92'] = 6,
	['93'] = 6,
	['204'] = 10,
	['205'] = 9,
	['206'] = 8,
	['207'] = 7,
	['208'] = 7,
	['209'] = 6,
	['210'] = 6,
	['384'] = 8,
	['385'] = 7,
	['386'] = 7,
	['387'] = 6,
	['388'] = 6,
}
box.options[2] = { -- 벨류값이 0 이면 안됨.
	['25'] = 14,
	['26'] = 8,
	['27'] = 7,
	['28'] = 3,
	['29'] = 2,
	['44'] = 13,
	['45'] = 8,
	['46'] = 7,
	['47'] = 3,
	['48'] = 2,
	['67'] = 15,
	['69'] = 8,
	['70'] = 7,
	['71'] = 2,
	['94'] = 13,
	['95'] = 9,
	['96'] = 8,
	['97'] = 8,
	['98'] = 7,
	['99'] = 6,
	['100'] = 3,
	['101'] = 2,
	['211'] = 14,
	['212'] = 9,
	['213'] = 8,
	['214'] = 3,
	['215'] = 2,
	['14'] = 10,
	['78'] = 10,
	['81'] = 10,
	['83'] = 10,
	['201'] = 1,
	['223'] = 1,
	['251'] = 1,
	['252'] = 1,
	['253'] = 1,
	['389'] = 8,
	['390'] = 7,
	['391'] = 7,
	['392'] = 6,
}
box.options[3] = { -- 벨류값이 0 이면 안됨.
	['30'] = 15,
	['31'] = 8,
	['32'] = 6,
	['33'] = 2,
	['49'] = 12,
	['50'] = 11,
	['51'] = 9,
	['52'] = 8,
	['53'] = 7,
	['54'] = 6,
	['55'] = 1,
	['56'] = 1,
	['102'] = 17,
	['103'] = 13,
	['104'] = 12,
	['105'] = 11,
	['106'] = 10,
	['107'] = 10,
	['108'] = 10,
	['109'] = 10,
	['110'] = 10,
	['111'] = 9,
	['112'] = 8,
	['113'] = 7,
	['114'] = 4,
	['115'] = 2,
	['116'] = 1,
	['117'] = 1,
	['216'] = 17,
	['217'] = 14,
	['218'] = 13,
	['219'] = 11,
	['220'] = 9,
	['221'] = 4,
	['251'] = 2,
	['252'] = 2,
	['253'] = 2,
	['393'] = 14,
	['394'] = 10,
	['395'] = 8,
	['396'] = 2,
}
box.options[4] = { -- 벨류값이 0 이면 안됨.
	['78'] = 200,
	['81'] = 200,
	['416'] = 40,
	['83'] = 120,
	['223'] = 120,
	['251'] = 120,
	['252'] = 120,
	['253'] = 150,
	['320'] = 40,
	['321'] = 30,
	['379'] = 200,
	['380'] = 200,
	['381'] = 200,
	['382'] = 200,
	['402'] = 200,
	['407'] = 20,
	['409'] = 2,
	['410'] = 2,
	['411'] = 2,
	['412'] = 2,
	['413'] = 2,
	['414'] = 2,
	['426'] = 30,
	['427'] = 4,
	['283'] = 10,
}
box.options[5] = { -- 음식상자
	['230'] = 200,
	['231'] = 200,
	['232'] = 200,
	['233'] = 200,
	['234'] = 200,
	['235'] = 190,
	['236'] = 190,
	['237'] = 190,
	['238'] = 190,
	['239'] = 190,
	['240'] = 180,
	['241'] = 180,
	['242'] = 180,
	['243'] = 180,
	['244'] = 180,
	['245'] = 170,
	['246'] = 150,
	['247'] = 140,
	['248'] = 130,
	['249'] = 120,
	['250'] = 110,
	['254'] = 100,
	['255'] = 90,
	['256'] = 90,
	['257'] = 90,
	['258'] = 80,
	['259'] = 80,
	['260'] = 70,
	['261'] = 60,
	['262'] = 55,
	['263'] = 45,
	['264'] = 40,
	['265'] = 35,
	['266'] = 30,
	['267'] = 25,
	['268'] = 20,
	['269'] = 15,
	['270'] = 10,
	['271'] = 9,
	['272'] = 8,
	['273'] = 7,
	['274'] = 6,
	['275'] = 5,
	['276'] = 4,
	['277'] = 3,
	['278'] = 3,
}
-- 여기까지 건들면되고
-- box.options[6] box.options[7] .. 계속 추가하셔도 돼요.

--[[ 건들지 않아도 됨. ]]
for i = 1, #box.options do
	box.options.sum[i] = 0
	for _, v in pairs(box.options[i]) do
		box.options.sum[i] = box.options.sum[i] + v
	end
end

local function box_table(index)
	local txt = ""
	local getitem = Server.GetItem
	local num = box.options.sum[index]
	for i, v in pairs(box.options[index]) do
		txt = txt .. remove_color(getitem(tonumber(i)).name) .. " - " .. string.format("%.4f", (v / num) * 100) .. "%\n"
	end
	print(txt)
end

--[[
Server.RunLater(function()
	box_table(5)
end, 0.5)]]
function random_box(num, box_dataID)
	if unit.CountItem(box_dataID) < 1 then
		unit.SendCenterLabel("비정상적 시도입니다.")
		return
	end
	unit.RemoveItem(box_dataID, 1, false)
	unit.FireEvent("random_box", box_dataID, Utility.JSONSerialize(box.options[num]), num)
end

local say_per = 1 -- 1% 미만의 아이템 획득시 서버알림
Server.GetTopic('box_open').Add(function(id, box_dataID)
	local key = box.weight(box.options[id])
	local res = tonumber(key)
	local item_bool = false
	unit.AddItem(res, 1, false)
	if box.options[id][key] / box.options.sum[id] < box.options.per*0.01*say_per then
		Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 '..Server.GetItem(res).name..'을(를) 획득하셨습니다.</color>')
	end
	if unit.CountItem(box_dataID) >= 1 then
		item_bool = true
	end
	unit.FireEvent('box_show', res, item_bool)
end)

Server.GetTopic('box_false').Add(function(id)
	unit.AddItem(id, 1, false)
end)

Server.GetTopic('box_keepOpen').Add(function(box_dataID, num)
	if unit.CountItem(box_dataID) >= 1 then
		unit.RemoveItem(box_dataID, 1, false)
		local key = box.weight(box.options[num])
		local res = tonumber(key)
		local item_bool = false
		unit.AddItem(res, 1, false)
		if box.options[num][key] / box.options.sum[num] < box.options.per*0.01*say_per then
			Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 '..Server.GetItem(res).name..'을(를) 획득하셨습니다.</color>')
		end
		if unit.CountItem(box_dataID) >= 1 then
			item_bool = true
		end
		unit.FireEvent('box_show', res, item_bool)
	else
		unit.FireEvent(Server.GetItem(box_dataID).name..'가 부족합니다.')
	end
end)