Glo_neck = {}
Glo_neck.per = {100, 90, 75, 60, 51, 39, 22, 14, 9, 2, -1, -4, -9, -15}
--Glo_neck.gold = {100, 900, 8100, 24300, 72900, 145800, 291600, 583200, 933120, 2052864}
Glo_neck.gold = {100, 900, 8100, 24300, 72900, 218700, 656100, 1968300, 5904900, 17714700, 53144100, 159432300, 451111111, 7450101010}
--Glo_neck.carrot = {10, 30, 50, 90, 250, 720, 1008, 1411, 1975, 4346}
Glo_neck.carrot = {10, 30, 50, 90, 125, 240, 488, 711, 1375, 2149, 12447, 99999, 111111, 444444}
Glo_neck.forge = {1, 2, 3, 4, 5, 6, 10, 15, 21, 40, 55, 80, 111, 222}

local ringID = {520, 521, 551, 552, 553, 554, 555, 556} -- 반지
local neckID = {329, 330, 331, 332, 342, 343, 344, 345, 398, 399, 400, 401, 403, 404, 405, 406, 514, 515, 516, 517} -- 목걸이
local player = {478, 479, 480, 481, 482, 483, 484, 485, 486, 487, 488, 489, 490, 491, 492, 493, 494, 495} -- 용사장비
Glo_neck.id = {}
for _, v in ipairs(neckID) do
	Glo_neck.id[tostring(v)] = {max=12}
end
for _, v in ipairs(player) do
	Glo_neck.id[tostring(v)] = {max=13}
end
for _, v in ipairs(ringID) do
	Glo_neck.id[tostring(v)] = {max=14}
end

Glo_neck.id['478'].forge_id = 224
Glo_neck.id['478'].stat = {0, 6, 7}
Glo_neck.id['479'].forge_id = 224
Glo_neck.id['479'].stat = {0, 6, 7}
Glo_neck.id['480'].forge_id = 224
Glo_neck.id['480'].stat = {0, 6, 7}
Glo_neck.id['481'].forge_id = 224
Glo_neck.id['481'].stat = {0, 6, 7}
Glo_neck.id['482'].forge_id = 224
Glo_neck.id['482'].stat = {0, 6, 7}
Glo_neck.id['483'].forge_id = 224
Glo_neck.id['483'].stat = {0, 6, 7}

Glo_neck.id['484'].forge_id = 224
Glo_neck.id['484'].stat = {2}
Glo_neck.id['485'].forge_id = 224
Glo_neck.id['485'].stat = {2}
Glo_neck.id['486'].forge_id = 224
Glo_neck.id['486'].stat = {2}
Glo_neck.id['487'].forge_id = 224
Glo_neck.id['487'].stat = {2}
Glo_neck.id['488'].forge_id = 224
Glo_neck.id['488'].stat = {2}
Glo_neck.id['489'].forge_id = 224
Glo_neck.id['489'].stat = {2}

Glo_neck.id['490'].forge_id = 224
Glo_neck.id['490'].stat = {0}
Glo_neck.id['491'].forge_id = 224
Glo_neck.id['491'].stat = {0}
Glo_neck.id['492'].forge_id = 224
Glo_neck.id['492'].stat = {0}
Glo_neck.id['493'].forge_id = 224
Glo_neck.id['493'].stat = {0}
Glo_neck.id['494'].forge_id = 224
Glo_neck.id['494'].stat = {0}
Glo_neck.id['495'].forge_id = 224
Glo_neck.id['495'].stat = {0}


Glo_neck.id['329'].stat = {0, 105}
Glo_neck.id['329'].value = {4, 3}
Glo_neck.id['329'].forge_id = 334
Glo_neck.id['330'].stat = {4, 5}
Glo_neck.id['330'].value = {4, 30}
Glo_neck.id['330'].forge_id = 335
Glo_neck.id['331'].stat = {2, 7, 102}
Glo_neck.id['331'].value = {8, 70, 2}
Glo_neck.id['331'].forge_id = 336
Glo_neck.id['332'].stat = {6, 101}
Glo_neck.id['332'].value = {150, 2}
Glo_neck.id['332'].forge_id = 337

Glo_neck.id['342'].stat = {0, 105}
Glo_neck.id['342'].value = {8, 6}
Glo_neck.id['342'].forge_id = 334
Glo_neck.id['343'].stat = {4, 5}
Glo_neck.id['343'].value = {8, 60}
Glo_neck.id['343'].forge_id = 335
Glo_neck.id['344'].stat = {2, 7, 102}
Glo_neck.id['344'].value = {16, 140, 4}
Glo_neck.id['344'].forge_id = 336
Glo_neck.id['345'].stat = {6, 101}
Glo_neck.id['345'].value = {300, 4}
Glo_neck.id['345'].forge_id = 337

Glo_neck.id['398'].stat = {0, 105}
Glo_neck.id['398'].value = {16, 12}
Glo_neck.id['398'].forge_id = 334
Glo_neck.id['399'].stat = {4, 5}
Glo_neck.id['399'].value = {16, 120}
Glo_neck.id['399'].forge_id = 335
Glo_neck.id['400'].stat = {2, 7, 102}
Glo_neck.id['400'].value = {32, 280, 8}
Glo_neck.id['400'].forge_id = 336
Glo_neck.id['401'].stat = {6, 101}
Glo_neck.id['401'].value = {600, 8}
Glo_neck.id['401'].forge_id = 337

Glo_neck.id['403'].stat = {0, 105}
Glo_neck.id['403'].value = {32, 24}
Glo_neck.id['403'].forge_id = 334
Glo_neck.id['404'].stat = {4, 5}
Glo_neck.id['404'].value = {32, 240}
Glo_neck.id['404'].forge_id = 335
Glo_neck.id['405'].stat = {2, 7, 102}
Glo_neck.id['405'].value = {64, 560, 16}
Glo_neck.id['405'].forge_id = 336
Glo_neck.id['406'].stat = {6, 101}
Glo_neck.id['406'].value = {1200, 16}
Glo_neck.id['406'].forge_id = 337

Glo_neck.id['514'].stat = {0, 105}
Glo_neck.id['514'].value = {64, 48}
Glo_neck.id['514'].forge_id = 334
Glo_neck.id['515'].stat = {4, 5}
Glo_neck.id['515'].value = {64, 480}
Glo_neck.id['515'].forge_id = 335
Glo_neck.id['516'].stat = {2, 7, 102}
Glo_neck.id['516'].value = {128, 1120, 32}
Glo_neck.id['516'].forge_id = 336
Glo_neck.id['517'].stat = {6, 101}
Glo_neck.id['517'].value = {2400, 32}
Glo_neck.id['517'].forge_id = 337

Glo_neck.id['514'].stat = {0, 105}
Glo_neck.id['514'].value = {64, 48}
Glo_neck.id['514'].forge_id = 334
Glo_neck.id['515'].stat = {4, 5}
Glo_neck.id['515'].value = {64, 480}
Glo_neck.id['515'].forge_id = 335
Glo_neck.id['516'].stat = {2, 7, 102}
Glo_neck.id['516'].value = {128, 1120, 32}
Glo_neck.id['516'].forge_id = 336
Glo_neck.id['517'].stat = {6, 101}
Glo_neck.id['517'].value = {2400, 32}
Glo_neck.id['517'].forge_id = 337

Glo_neck.id['520'].stat = {4, 108}
Glo_neck.id['520'].value = {21, 10}
Glo_neck.id['520'].forge_id = 522
Glo_neck.id['521'].stat = {107}
Glo_neck.id['521'].value = {12}
Glo_neck.id['521'].forge_id = 523
Glo_neck.id['551'].stat = {4, 108}
Glo_neck.id['551'].value = {42, 20}
Glo_neck.id['551'].forge_id = 522
Glo_neck.id['552'].stat = {107}
Glo_neck.id['552'].value = {24}
Glo_neck.id['552'].forge_id = 523
Glo_neck.id['553'].stat = {4, 108}
Glo_neck.id['553'].value = {84, 40}
Glo_neck.id['553'].forge_id = 522
Glo_neck.id['554'].stat = {107}
Glo_neck.id['554'].value = {48}
Glo_neck.id['554'].forge_id = 523
Glo_neck.id['555'].stat = {4, 108}
Glo_neck.id['555'].value = {168, 80}
Glo_neck.id['555'].forge_id = 522
Glo_neck.id['556'].stat = {107}
Glo_neck.id['556'].value = {96}
Glo_neck.id['556'].forge_id = 523

local var = 53 -- 장비 선택에 쓰일 변수번호


local strings = Server.GetStrings()
local stat_text = {}
stat_text[0] = strings.attack == '' and '공격력' or strings.attack
stat_text[1] = strings.defense == '' and '방어력' or strings.defense
stat_text[2] = strings.magic_attack == '' and '마법 공격력' or strings.magic_attack
stat_text[3] = strings.magic_defense == '' and '마법 방어력' or strings.magic_defense
stat_text[4] = strings.agility == '' and '민첩' or strings.agility
stat_text[5] = strings.lucky == '' and '경험치(%)' or strings.lucky
stat_text[6] = strings.hp == '' and '체력' or strings.hp
stat_text[7] = strings.mp == '' and '마나' or strings.mp
for i=8, 100 do stat_text[i]='' end
stat_text[101] = strings.custom1 stat_text[102] = strings.custom2 stat_text[103] = strings.custom3
stat_text[104] = strings.custom4 stat_text[105] = '' stat_text[106] = ''
stat_text[107] = '' stat_text[108] = '' stat_text[109] = ''
stat_text[110] = strings.custom10 stat_text[111] = strings.custom11 stat_text[112] = strings.custom12
stat_text[113] = strings.custom13 stat_text[114] = strings.custom14 stat_text[115] = strings.custom15
stat_text[116] = strings.custom16 stat_text[117] = strings.custom17 stat_text[118] = strings.custom18
stat_text[119] = strings.custom19 stat_text[120] = strings.custom20 stat_text[121] = strings.custom21
stat_text[122] = strings.custom22 stat_text[123] = strings.custom23 stat_text[124] = strings.custom24
stat_text[125] = strings.custom25 stat_text[126] = '' stat_text[127] = strings.custom27
stat_text[128] = strings.custom28 stat_text[129] = strings.custom29 stat_text[130] = strings.custom30
stat_text[131] = strings.custom31 stat_text[132] = strings.custom32



local bless = 339
Server.GetTopic('forge_data_start').Add(function()
	unit.FireEvent('forge_data_Client', Utility.JSONSerialize(stat_text), stat_text[0], bless)
end)

Server.GetTopic('forge_main').Add(function()
	local c = unit.CountItem
	unit.FireEvent('forge_main', c(bless))
end)

local GetItem = Server.GetItem
function forge_main()
	unit.FireEvent('다크패널삭제')
	local Tem = unit.player.GetItem(unit.GetVar(var))
	if not Tem then return end
	local dataID = Tem.dataID
	local Type = GetItem(dataID).type
	local lv = Tem.level
	local num = Glo_neck.id[tostring(dataID)]
	
	local TemOp = Utility.GetItemOptions(Tem)
	if not TemOp[1] then 
		unit.SendCenterLabel('<color=#FF0000>[!]</color> 강화가 불가능합니다.\n<size=13><color=#FFFF99>[아무 옵션이 없네요?]</color></size>')
		return 
	end
	
	if TemOp[1].statID ~= 126 and num then
		local op = {}
		op[1] = {3, 126, 4}
		for i, v in pairs(TemOp) do
			op[i+1] = {v.type, v.statID, v.value}
		end
		Utility.AddItemOption(Tem, 3, 1, 1)
		TemOp = Utility.GetItemOptions(Tem)
		for i, v in pairs(op) do
			Utility.SetItemOption(TemOp[i], v[1], v[2], v[3])
		end
		unit.player.SendItemUpdated(Tem)
	end
	
	if TemOp[1].value <= 0 then
		unit.SendCenterLabel('남은 강화 횟수가 없습니다.')
		return
	end
	
	if TemOp[1].statID == 126 then
		if lv >= #Glo_neck.per then
			unit.SendCenterLabel('이미 최대강화입니다.')
			return
		end
		
		if Type~=6 then
			if unit.CountItem(224) < 1 and unit.CountItem(417) < 1 then
				unit.SendCenterLabel('<color=#FF0000>[!]</color> 강화가 불가능합니다.\n<size=13><color=#FFFF99>장비류는 토마토 혹은 콜리비가 있어야돼요.\n토마토는 Lv.310 이후 몬스터부터 나와요.</color></size>')
				return
			end
		end
		
		local count = unit.CountItem(77)
		local gold = Glo_neck.gold[lv+1]
		local item_su = Glo_neck.carrot[lv+1]
		local per = Glo_neck.per[lv+1]
		
		local luk = unit.GetStat(109)
		if luk > 300 then
			luk = 300
		end
		luk = luk*0.03
		
		local T = {}
		T.dataID = dataID
		T.level = lv
		T.count = count
		T.need_count = item_su
		T.gold = unit.gameMoney
		T.need_gold = gold
		T.per = per
		T.forge_item_id = 77
		T.bless = unit.CountItem(bless)
		T.id = Tem.id
		T.forge_need_id = num.forge_id
		T.id_count = unit.CountItem(num.forge_id)
		T.id_count2 = Glo_neck.forge[lv+1]
		T.luk = luk
		
		T.stat = {}
		-- 능력치담는 부분
		
		for i, v in ipairs(num.stat) do
			if TemOp[i+1] then
				T.stat[i] = TemOp[i+1].value
			else
				T.stat[i] = 0
			end
		end
		
		
		local json = Utility.JSONSerialize
		unit.FireEvent('강화신호', json(T), json(num), TemOp[1].value)
	end
end

Server.GetTopic('공용이벤트').Add(function(num)
	unit.StartGlobalEvent(num)
end)

Server.GetTopic('강화시도').Add(function(table01)
	local T = Utility.JSONParse(table01)
	
	local Tem = unit.player.GetItem(T.id)
	if not Tem then return end
	
	local TemOp = Utility.GetItemOptions(Tem)
	if not TemOp[1] then return end
	
	local lv = Tem.level
	if TemOp[1].value <= 0 then
		unit.SendCenterLabel('남은 강화 횟수가 없습니다.')
		return
	end
	
	if unit.gameMoney < T.need_gold then
		unit.SendCenterLabel('골드가 부족합니다.')
		return
	end
	
	if unit.CountItem(77) < Glo_neck.carrot[lv+1] then
		unit.SendCenterLabel('당근이 부족합니다.')
		return
	end
	
	if unit.CountItem(T.forge_need_id) < Glo_neck.forge[lv+1] then
		unit.SendCenterLabel(GetItem(T.forge_need_id).name..'가 부족합니다.')
		return
	end
	
	local plus_per = 0
	if T.bless_bool==true and unit.CountItem(bless)<1 then
		unit.SendCenterLabel(GetItem(bless).name..'가 부족합니다.')
		return
	elseif T.bless_bool==true then
		unit.RemoveItem(bless, 1, false)
		plus_per = 1000
	end	
	
	unit.UseGameMoney(T.need_gold)
	unit.RemoveItem(77, Glo_neck.carrot[lv+1], false)
	unit.RemoveItem(T.forge_need_id, Glo_neck.forge[lv+1], false)
	local str_id = Glo_neck.id[tostring(T.dataID)]
	if rand(1, 10001) <= (Glo_neck.per[lv+1]+T.luk)*100+plus_per then --정확도를 높히기 위해 100을 곱함[안곱해도 크게 상관없음]
		Tem.level = Tem.level+1
		unit.PlaySE('강화 효과음/강화 성공.ogg', 1)
		
		unit.SendCenterLabel('+'..Tem.level..' '..GetItem(T.dataID).name..' 강화에 성공하였습니다.')
		if Tem.level >= 7 then
			Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 +'..Tem.level..' '..GetItem(T.dataID).name..' 강화에 성공하였습니다.</color>')
		end
		Utility.SetItemOption(TemOp[1], 3, 126, TemOp[1].value-1)
		
		if TemOp[2] then
			for i, v in ipairs(str_id.stat) do
				Utility.SetItemOption(TemOp[i+1], 3, v, TemOp[i+1].value*2)
			end
		else
			for i, v in ipairs(str_id.stat) do
				Utility.AddItemOption(Tem, 3, v, str_id.value[i])
			end
		end
		
	else
		unit.PlaySE('강화 효과음/강화 실패.ogg', 1)
		unit.SendCenterLabel('강화에 실패하였습니다.')
		Utility.SetItemOption(TemOp[1], 3, 126, TemOp[1].value-1) -- 강화 횟수 소비
	end
	unit.player.SendItemUpdated(Tem)
	
	if Tem.level >= #Glo_neck.per then
		unit.FireEvent('forge_ShowAlert', '<color=#FFFF00>최대 강화를 달성하였습니다!</color>')
		return
	end
	
	if TemOp[1].value <= 0 then
		unit.FireEvent('forge_ShowAlert', '<color=#FFFF00>남은 강화 횟수가 없습니다.</color>')
		return
	end
	
	local gold = Glo_neck.gold[Tem.level+1]
	
	local luk = unit.GetStat(109)
	if luk > 300 then
		luk = 300
	end
	luk = luk*0.03
	
	local TT = {}
	TT.dataID = T.dataID
	TT.level = Tem.level
	TT.count = unit.CountItem(77)
	TT.need_count = Glo_neck.carrot[Tem.level+1]
	TT.gold = unit.gameMoney
	TT.need_gold = gold
	TT.per = Glo_neck.per[Tem.level+1]
	TT.forge_item_id = 77
	TT.bless = unit.CountItem(bless)
	TT.id = Tem.id
	TT.forge_need_id = str_id.forge_id
	TT.id_count = unit.CountItem(str_id.forge_id)
	TT.id_count2 = Glo_neck.forge[Tem.level+1]
	TT.luk = luk
	
	TT.stat = {}
	
	local TemOp2 = Utility.GetItemOptions(Tem)
	if not TemOp2[1] then return end
	for i, v in ipairs(str_id.stat) do
		if TemOp2[i+1] then
			TT.stat[i] = TemOp2[i+1].value
		else
			TT.stat[i] = 0
		end
	end
	
	
	local json = Utility.JSONSerialize
	unit.FireEvent('강화신호', json(TT), json(str_id), TemOp2[1].value)
	unit.RefreshStats()
end)



















