Global_skill_data = {{8, 26}, {9, 27}, {15, 32}, {19, 44}, {20, 46}, {21, 48},
	{22, 49}, {14, 30}, {26, 58}, {53, 74}, {62, 136}, {63, 137}} -- 획득(드랍) 스킬, [스킬id, 변수]
Global_skill_data2 = {{1, 21}, {2, 22}, {6, 23}, {10, 28}, {11, 29}, {16, 33}, 
	{17, 34}, {23, 52}, {28, 56}, {34, 57}, {35, 66}, {48, 70}, {57, 127},
	{58, 128}, {59, 129}, {60, 130},} -- 직업(기존) 스킬
Global_reincarnation = {
	{200, 1},	 {300, 2}, 	 {400, 3},	  {500, 4},	  {600, 5},	  {700, 6},	  {800, 7},	  {900, 9},   {1000, 11}, 
	{1100, 13},	 {1200, 15}, {1300, 18},  {1400, 21}, {1500, 23}, {1600, 27}, {1700, 34}, {1800, 39}, {1900, 46}, 
	{2000, 54},	 {2100, 61}, {2200, 68},  {2300, 75}, {2400, 82}, {2500, 89}, {2600, 96}, {2700, 103},{2800, 110},
	{2900, 117}, {3000, 124},{3100, 130}, {3200, 136},{3300, 142},{3400, 148},{3500, 154},{3600, 159},
	{3700, 164}, {3800, 169},{3900, 174}, {4000, 179},{4100, 184},{4200, 189},{4300, 194},{4400, 199}, 
	{4500, 204}, {4600, 209},{4700, 214}, {4800, 219},{4900, 224},{5000, 230}, } -- 환생횟수에 따른 환생강화석 획득개수
Global_reincarnation.data = {}
Global_reincarnation.data[141] = {ItemLv=0, gold=100000, need_lv=200, var=0, forge=3}
Global_reincarnation.data[142] = {ItemLv=3, gold=200000, need_lv=200, var=1, forge=8}
Global_reincarnation.data[143] = {ItemLv=11, gold=300000, need_lv=200, var=2, forge=16}
Global_reincarnation.data[144] = {ItemLv=27, gold=400000, need_lv=300, var=3, forge=30}
Global_reincarnation.data[145] = {ItemLv=57, gold=500000, need_lv=300, var=4, forge=38}
Global_reincarnation.data[146] = {ItemLv=95, gold=600000, need_lv=300, var=5, forge=60}
Global_reincarnation.data[147] = {ItemLv=155, gold=700000, need_lv=400, var=6, forge=67}
Global_reincarnation.data[148] = {ItemLv=222, gold=800000, need_lv=500, var=7, forge=111}
Global_reincarnation.data[149] = {ItemLv=333, gold=900000, need_lv=500, var=8, forge=111}
Global_reincarnation.data[150] = {ItemLv=444, gold=1000000, need_lv=500, var=9, forge=122}
Global_reincarnation.data[151] = {ItemLv=566, gold=1500000, need_lv=600, var=10, forge=211}
Global_reincarnation.data[152] = {ItemLv=777, gold=2000000, need_lv=700, var=11, forge=223}
Global_reincarnation.data[153] = {ItemLv=1000, gold=5000000, need_lv=800, var=12, forge=400}
Global_reincarnation.data[154] = {ItemLv=1400, gold=10000000, need_lv=900, var=13, forge=488}
Global_reincarnation.data[155] = {ItemLv=1888, gold=15000000, need_lv=1000, var=14, forge=445}
Global_reincarnation.data[156] = {ItemLv=2333, gold=20000000, need_lv=1000, var=15, forge=445}
Global_reincarnation.data[157] = {ItemLv=2778, gold=30000000, need_lv=1000, var=16, forge=445}
Global_reincarnation.data[158] = {ItemLv=3223, gold=50000000, need_lv=1000, var=17, forge=177}
Global_reincarnation.data[159] = {ItemLv=3400, gold=100000000, need_lv=1500, var=18, forge=800}
Global_reincarnation.data[160] = {ItemLv=4200, gold=200000000, need_lv=1500, var=19, forge=800}
Global_reincarnation.data[161] = {ItemLv=5000, gold=300000000, need_lv=1500, var=20, forge=1000}
Global_reincarnation.data[162] = {ItemLv=6000, gold=400000000, need_lv=1500, var=21, forge=3333}
Global_reincarnation.data[163] = {ItemLv=9333, gold=500000000, need_lv=2000, var=22, forge=5551}
Global_reincarnation.data[164] = {ItemLv=14884, gold=1000000000, need_lv=2500, var=23, forge=7338}
Global_reincarnation.data[165] = {ItemLv=22222, gold=2000000000, need_lv=3000, var=24, forge=11111}
Global_reincarnation.data[166] = {ItemLv=33333, gold=3000000000, need_lv=3000, var=25, forge=6667}
Global_reincarnation.data[167] = {ItemLv=40000, gold=4000000000, need_lv=3000, var=26, forge=10000}
Global_reincarnation.data[168] = {ItemLv=50000, gold=5000000000, need_lv=3000, var=27, forge=9999999}

Global_skill_item = {11, 12, 13, 79, 80, 129, 130, 131, 348, 349, 376, 350,
496, 497, 498, 499}

Global_town = { -- 악당소환장에서 복귀하는 마을
	[0] = {id=21, x=20, y=22},
	[1] = {id=49, x=36, y=11},
	[2] = {id=75, x=32, y=22},
}

function Global_weight(t)
    local sum = 0
	for _, v in pairs(t) do
        sum = sum + v
    end
	
    local Rand = rand(0, sum)
    for k, v in pairs(t) do
        if Rand < v then
            return k
        end
        Rand = Rand - v
    end
end

Global_player_party = {}
Global_player_party.mon = 61 -- 62번부터 시작이라서 61
Global_player_party.players = { -- 플레이어 습격 파티인원수 확률을 나타냄
-- 내 레벨에 비례하여 습격함.
	[1] = 4, 
	[2] = 8, 
	[3] = 8, 
	[4] = 8,
	[5] = 8, 
	[6] = 15, 
	[7] = 22, 
	[8] = 15, 
	[9] = 8, 
	[10] = 4,
}
Global_player_party.lv = {
	1, 8, 25, 80, 150, 232, 404, 716, 1055, 1544, 
	2267, 3300, 4400, 5500, 6600, 7700, 8800, 9900, 10000, 10000, 
	10000, 10000, 10000, 10000, 
}
Global_player_party.per = {
	[1] = 999, 
	[2] = 945, 
	[3] = 876, 
	[4] = 811, 
	[5] = 732, 
	[6] = 667, 
	[7] = 591, 
	[8] = 523, 
	[9] = 450, 
	[10] = 410,
	[11] = 351,
	[12] = 298,
	[13] = 222,
	[14] = 154,
	[15] = 99,
	[16] = 88,
	[17] = 77,
	[18] = 66,
	[19] = 55,
	[20] = 51,
	[21] = 42,
	[22] = 28,
	[23] = 13,
	[24] = 8,
}
player_items = {}
player_items[1] = {
	gold = 1, -- 1000 ~ 10000 골드 랜덤 획득
	item = {
		id = {11, 12, 13, 417, 478, 140},
		per = {25, 25, 25, 1, 5, 0.01},
		bool = {}
	}
}
player_items[2] = {
	gold = 3,
	item = {
		id = {11, 12, 13, 417, 484, 140},
		per = {40, 40, 40, 2, 5, 0.01},
		bool = {}
	}
}
player_items[3] = {
	gold = 5,
	item = {
		id = {79, 80, 417, 490, 140},
		per = {65, 65, 3, 5, 0.01},
		bool = {}
	}
}
player_items[4] = {
	gold = 9,
	item = {
		id = {325, 133, 417, 478, 484, 490, 140},
		per = {50, 25, 4, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[5] = {
	gold = 21,
	item = {
		id = {325, 133, 417, 478, 484, 490, 140},
		per = {80, 40, 5, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[6] = {
	gold = 44,
	item = {
		id = {334, 335, 336, 337, 417, 479, 140},
		per = {100, 100, 100, 100, 6, 5, 0.01},
		bool = {}
	}
}
player_items[7] = {
	gold = 88,
	item = {
		id = {129, 130, 131, 417, 485, 140},
		per = {65, 65, 65, 7, 5, 0.01},
		bool = {}
	}
}
player_items[8] = {
	gold = 150,
	item = {
		id = {129, 130, 131, 417, 491, 140},
		per = {90, 90, 90, 8, 5, 0.01},
		bool = {}
	}
}
player_items[9] = {
	gold = 221,
	item = {
		id = {315, 316, 317, 417, 479, 485, 491, 140},
		per = {30, 15, 5, 9, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[10] = {
	gold = 333,
	item = {
		id = {316, 317, 318, 417, 479, 485, 491, 140},
		per = {30, 15, 5, 10, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[11] = {
	gold = 444,
	item = {
		id = {324, 348, 349, 350, 417, 480, 140},
		per = {100, 100, 100, 100, 11, 5, 0.01},
		bool = {}
	}
}
player_items[12] = {
	gold = 555,
	item = {
		id = {376, 378, 379, 380, 381, 382, 417, 486, 140},
		per = {100, 15, 15, 15, 15, 15, 12, 5, 0.01},
		bool = {}
	}
}
player_items[13] = {
	gold = 777,
	item = {
		id = {327, 417, 492, 140},
		per = {100, 15, 5, 0.01},
		bool = {}
	}
}
player_items[14] = {
	gold = 999,
	item = {
		id = {426, 417, 480, 486, 492, 140},
		per = {6, 18, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[15] = {
	gold = 1111,
	item = {
		id = {427, 417, 480, 486, 492, 140},
		per = {0.5, 25, 3, 3, 3, 0.01},
		bool = {[1]=true}
	}
}
player_items[16] = {
	gold = 1333,
	item = {
		id = {417, 481, 140},
		per = {100, 5, 0.01},
		bool = {}
	}
}
player_items[17] = {
	gold = 1555,
	item = {
		id = {417, 339, 487, 140},
		per = {100, 60, 5, 0.01},
		bool = {}
	}
}
player_items[18] = {
	gold = 2000,
	item = {
		id = {417, 407, 493, 140},
		per = {100, 20, 5, 0.01},
		bool = {}
	}
}
player_items[19] = {
	gold = 50000,
	item = {
		id = {417, 472, 481, 487, 493, 140},
		per = {100, 5, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[20] = {
	gold = 50000,
	item = {
		id = {417, 473, 481, 487, 493, 140},
		per = {100, 5, 3, 3, 3, 0.01},
		bool = {}
	}
}
player_items[21] = {
	gold = 50000,
	item = {
		id = {417, 471, 482, 140},
		per = {100, 3, 5, 0.01},
		bool = {[2]=true}
	}
}
player_items[22] = {
	gold = 50000,
	item = {
		id = {417, 474, 488, 140},
		per = {100, 5, 5, 0.01},
		bool = {}
	}
}
player_items[23] = {
	gold = 50000,
	item = {
		id = {417, 475, 494, 140},
		per = {100, 5, 5, 0.01},
		bool = {}
	}
}
player_items[24] = {
	gold = 50000,
	item = {
		id = {417, 476, 482, 488, 494, 140},
		per = {100, 5, 3, 3, 3, 0.01},
		bool = {}
	}
}

function wallet(id)
	local data = player_items[id]
	if data then
		local item = Server.CreateItem(418, 1)
		Utility.AddItemOption(item, 0, 106, rand(data.gold*100, data.gold*1000+1))
		unit.AddItemByTItem(item, false)
		
		for i, v in ipairs(data.item.id) do
			if rand(1, 10001) <= data.item.per[i]*100 then
				if data.item.bool[i] then
					local name = Server.GetItem(v).name
					Server.SendSay('<color=#FFBF00>'..unit.player.name..'님이 용사의 인벤을 뒤적거려서 '..name..'을 획득하였습니다.</color>')
				end
				unit.AddItem(v)
			end
		end
	else
		unit.SendSay('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0006</color>')
		unit.SendCenterLabel('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0006</color>')
		return
	end
end
-- /script for i=351, 374 do unit.AddItem(i, 99) end
-- /script for i, v in ipairs(unit.player.GetItems()) do unit.RemoveItemByID(v.id, v.count, false) end
function wallet_dadadang(id)
	local num = 350
	local c = unit.CountItem(num+id)
	unit.FireEvent('보따리_열기', num+id)
	if c > 0 then
		for i=1, c do
			unit.RemoveItem(num+id, 1, false)
			wallet(id)
		end
	end
end

function wallet_gold()
	local id = 418
	local sum = 0
	local c = 0
	for _, item in ipairs(unit.player.GetItems()) do
		if item.dataID == id then
			local itemOp = Utility.GetItemOptions(item)
			if #itemOp >= 1 then
				local value = itemOp[1].value
				unit.RemoveItemByID(item.id, 1, false)
				unit.AddGameMoney(value)
				sum = sum+value
				c = c+1
			end
		end
		if c > 100 then
			break
		end
	end
	unit.SendCenterLabel(sum..' 골드를 획득하였습니다.')
end

local past_order = {}
past_order[1] = {per=100, carrot=0}
past_order[2] = {per=100, carrot=100}
past_order[3] = {per=100, carrot=333}
past_order[4] = {per=100, carrot=777}
past_order[5] = {per=100, carrot=1311}
past_order[6] = {per=100, carrot=1887}
past_order[7] = {per=77, carrot=9999}
past_order[8] = {per=51, carrot=42611}
past_order[9] = {per=44, carrot=143333}
past_order[10] = {per=33, carrot=566666}
past_order[11] = {per=28, carrot=933333}
past_order[12] = {per=12, carrot=3133433}
past_order[13] = {per=-6, carrot=7575757}

function past_orderOK(id)
	local Tem = unit.player.GetItem(id)
	local lv = Tem.level
	
	local Max = Glo_neck.id[tostring(Tem.dataID)].max
	if Tem.level >= Max then
		unit.SendCenterLabel('이 장비는 최대 '..Max..'강까지 가능합니다.')
		return
	end
	
	local luk = unit.GetStat(109)
	if luk > 300 then
		luk = 300
	end
	luk = luk*0.1
	
	if past_order[lv] then
		local luk = luk<=0 and '' or '(+'..luk..')'
		local txt = '+'..lv..' '..Server.GetItem(Tem.dataID).name..'의 남은 강화 횟수를 1회 되돌리시겠습니까?\n'..
			'확률 :'..past_order[lv].per..luk..'%\n필요 당근 :'..past_order[lv].carrot..'개'
		unit.FireEvent('ShowYesNoAlert', txt, '과줌사용')
	end
end

Server.GetTopic('과줌사용').Add(function()
	local Tem = unit.player.GetItem(unit.GetVar(121))
	if not Tem then return end
	local lv = Tem.level
	
	if unit.CountItem(328) < 1 then
		return
	end
	
	local Max = Glo_neck.id[tostring(Tem.dataID)].max
	if lv >= Max then
		return
	end
	
	-- 강화 max수치 바꾸고 효과음 변경
	if unit.CountItem(77) >= past_order[lv].carrot then
		unit.RemoveItem(77, past_order[lv].carrot, false)
		unit.RemoveItem(328, 1, false)
		
		local luk = unit.GetStat(109)
		if luk > 300 then
			luk = 300
		end
		
		if rand(1, 1001) <= past_order[lv].per*10+luk then
			local TemOp = Utility.GetItemOptions(Tem)
			
			Utility.SetItemOption(TemOp[1], 3, 126, TemOp[1].value+1)
			unit.player.SendItemUpdated(Tem)
			unit.PlaySE('강화 효과음/시간역행 성공.ogg', 1)
			unit.SendCenterLabel('<color=#BFFF00>시간 역행에 성공하였습니다.</color>')
		else
			unit.PlaySE('강화 효과음/시간역행 실패.ogg', 1)
			unit.SendCenterLabel('<color=#B40404>시간 역행에 실패하였습니다.</color>')
		end
	else
		unit.SendCenterLabel('당그니 부조캐')
	end
end)


textTT2 = {
'축하해 주세요.',
'사랑해 주세요.',
'999억 골드를 지원해 주세요.',
'보살펴주세요.',
'잘 챙겨주세요.',
'돌팔매질을 해주세요.',
'사탕을 주세요.',
'뽀뽀해 주세요.',
'어깨동무해 주세요.',
'발로 차주세요.',
'머리털을 뽑아주세요.',
'깨물어 주세요.',
'왕이 되어주세요.',
'응원해 주세요.',
'친구가 되어주세요.',
'밥 사주세요.',
'발가락 냄새가 나는군요.',
'금수저라는군요.',
'잘 알려주세요.',
'이불을 덮어주세요.',
'시작을 축하합니다!',
'짝짝짝',
'짝짝짞짞짞 짝짜꿍',
'뉴비를 소중히 여기거라.',
'인기도를 올려주세요.',
'후 두려 패주세요.',
'환영해 주세요.',
'풍악을 올려주세요.',
'좋은말을 해주세요.',
'환영한다?',
'올 줄 알았다.',
}

local function weight(t)
    local sum = 0
	for _, v in pairs(t) do
        sum = sum + v
    end
	
    local Rand = rand(0, sum)
    for k, v in pairs(t) do
        if Rand < v then
            return k
        end
        Rand = Rand - v
    end
end

Global_random_weight = {}
Global_random_weight.paper = {
	[324] = { -- 호박 옵션부여서
		[323] = true,
		[378] = true,
		[379] = true,
		[380] = true,
		[381] = true,
		[382] = true,
		
	},
	[501] = { -- 용사의 룬 옵션부여서
		[472] = true,
		[473] = true,
		[474] = true,
		[475] = true,
		[476] = true,
	},
}

Global_random_weight[323] = {}
Global_random_weight[323].stat = {0, 2, 4, 5, 6, 7, 104}
Global_random_weight[323].value = {}
Global_random_weight[323].value[1] = {2, 2, 5, 20, 20, 20, 3}
Global_random_weight[323].value[2] = {4, 4, 10, 35, 35, 35, 4}
Global_random_weight[323].value[3] = {8, 8, 20, 70, 70, 70, 5}
Global_random_weight[323].value[4] = {16, 16, 35, 120, 120, 120, 7}
Global_random_weight[323].value[5] = {30, 30, 60, 250, 250, 250, 9}
Global_random_weight[323].value[6] = {54, 54, 100, 450, 450, 450, 11}
Global_random_weight[323].value[7] = {100, 100, 150, 800, 800, 800, 14}
Global_random_weight[323].value[8] = {160, 160, 200, 1400, 1400, 1400, 17}
Global_random_weight[323].value[9] = {300, 300, 400, 2500, 2500, 2500, 20}
Global_random_weight[323].value[10] = {600, 600, 1000, 5000, 5000, 5000, 30}
Global_random_weight[323].weight = {
	[1] = 172874,
	[2] = 120274,
	[3] = 71111,
	[4] = 49824,
	[5] = 36124,
	[6] = 16777,
	[7] = 8541,
	[8] = 3856,
	[9] = 1787,
	[10] = 679,
}

Global_random_weight[378] = {}
Global_random_weight[378].stat = {0, 2, 4, 5, 6, 7, 101, 102}
Global_random_weight[378].value = {}
Global_random_weight[378].value[1] = {6, 6, 15, 60, 60, 60, 10, 10}
Global_random_weight[378].value[2] = {12, 12, 30, 105, 105, 105, 30, 30}
Global_random_weight[378].value[3] = {24, 24, 60, 210, 210, 210, 50, 50}
Global_random_weight[378].value[4] = {48, 48, 105, 360, 360, 360, 80, 80}
Global_random_weight[378].value[5] = {90, 90, 180, 750, 750, 750, 120, 120}
Global_random_weight[378].value[6] = {154, 154, 300, 1350, 1350, 1350, 200, 200}
Global_random_weight[378].value[7] = {300, 300, 450, 2400, 2400, 2400, 400, 400}
Global_random_weight[378].value[8] = {480, 480, 600, 4200, 4200, 4200, 800, 800}
Global_random_weight[378].value[9] = {900, 900, 1200, 7500, 7500, 7500, 1200, 1200}
Global_random_weight[378].value[10] = {1800, 1800, 3000, 15000, 15000, 15000, 1800, 1800}
Global_random_weight[378].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 19824,
	[5] = 11124,
	[6] = 6777,
	[7] = 3541,
	[8] = 1856,
	[9] = 1087,
	[10] = 379,
}

Global_random_weight[379] = {}
Global_random_weight[379].stat = {2, 7, 2, 7, 2, 7}
Global_random_weight[379].value = {}
Global_random_weight[379].value[1] = {10, 75, 10, 75, 10, 75}
Global_random_weight[379].value[2] = {15, 110, 15, 110, 15, 110}
Global_random_weight[379].value[3] = {25, 200, 25, 200, 25, 200}
Global_random_weight[379].value[4] = {50, 400, 50, 400, 50, 400}
Global_random_weight[379].value[5] = {100, 800, 100, 800, 100, 800}
Global_random_weight[379].value[6] = {180, 1500, 180, 1500, 180, 1500}
Global_random_weight[379].value[7] = {350, 2800, 350, 2800, 350, 2800}
Global_random_weight[379].value[8] = {600, 5000, 600, 5000, 600, 5000}
Global_random_weight[379].value[9] = {1000, 8000, 1000, 8000, 1000, 8000}
Global_random_weight[379].value[10] = {2000, 16000, 2000, 16000, 2000, 16000}
Global_random_weight[379].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 19824,
	[5] = 11124,
	[6] = 6777,
	[7] = 3541,
	[8] = 1856,
	[9] = 1087,
	[10] = 379,
}

Global_random_weight[380] = {}
Global_random_weight[380].stat = {4, 4, 4, 5, 5, 5}
Global_random_weight[380].value = {}
Global_random_weight[380].value[1] = {15, 15, 15, 60, 60, 60}
Global_random_weight[380].value[2] = {22, 22, 22, 90, 90, 90}
Global_random_weight[380].value[3] = {44, 44, 44, 180, 180, 180}
Global_random_weight[380].value[4] = {88, 88, 88, 360, 360, 360}
Global_random_weight[380].value[5] = {170, 170, 170, 700, 700, 700}
Global_random_weight[380].value[6] = {350, 350, 350, 1400, 1400, 1400}
Global_random_weight[380].value[7] = {700, 700, 700, 2800, 2800, 2800}
Global_random_weight[380].value[8] = {1400, 1400, 1400, 5600, 5600, 5600}
Global_random_weight[380].value[9] = {2800, 2800, 2800, 11200, 11200, 11200}
Global_random_weight[380].value[10] = {5600, 5600, 5600, 22400, 22400, 22400}
Global_random_weight[380].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 19824,
	[5] = 11124,
	[6] = 6777,
	[7] = 3541,
	[8] = 1856,
	[9] = 1087,
	[10] = 379,
}

Global_random_weight[381] = {}
Global_random_weight[381].stat = {1, 1, 3, 3, 6, 6}
Global_random_weight[381].value = {}
Global_random_weight[381].value[1] = {3, 3, 3, 3, 100, 100}
Global_random_weight[381].value[2] = {5, 5, 5, 5, 150, 150}
Global_random_weight[381].value[3] = {10, 10, 10, 10, 300, 300}
Global_random_weight[381].value[4] = {20, 20, 20, 20, 600, 600}
Global_random_weight[381].value[5] = {40, 40, 40, 40, 1200, 1200}
Global_random_weight[381].value[6] = {70, 70, 70, 70, 2000, 2000}
Global_random_weight[381].value[7] = {120, 120, 120, 120, 3600, 3600}
Global_random_weight[381].value[8] = {240, 240, 240, 240, 7200, 7200}
Global_random_weight[381].value[9] = {480, 480, 480, 480, 14400, 14400}
Global_random_weight[381].value[10] = {900, 900, 900, 900, 28800, 28800}
Global_random_weight[381].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 19824,
	[5] = 11124,
	[6] = 6777,
	[7] = 3541,
	[8] = 1856,
	[9] = 1087,
	[10] = 379,
}

Global_random_weight[382] = {}
Global_random_weight[382].stat = {0, 0, 0, 0, 0, 0, 0}
Global_random_weight[382].value = {}
Global_random_weight[382].value[1] = {10, 10, 10, 10, 10, 10, 10}
Global_random_weight[382].value[2] = {16, 16, 16, 16, 16, 16, 16}
Global_random_weight[382].value[3] = {28, 28, 28, 28, 28, 28, 28}
Global_random_weight[382].value[4] = {56, 56, 56, 56, 56, 56, 56}
Global_random_weight[382].value[5] = {100, 100, 100, 100, 100, 100, 100}
Global_random_weight[382].value[6] = {200, 200, 200, 200, 200, 200, 200}
Global_random_weight[382].value[7] = {400, 400, 400, 400, 400, 400, 400}
Global_random_weight[382].value[8] = {800, 800, 800, 800, 800, 800, 800}
Global_random_weight[382].value[9] = {1600, 1600, 1600, 1600, 1600, 1600, 1600}
Global_random_weight[382].value[10] = {3200, 3200, 3200, 3200, 3200, 3200, 3200}
Global_random_weight[382].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 19824,
	[5] = 11124,
	[6] = 6777,
	[7] = 3541,
	[8] = 1856,
	[9] = 1087,
	[10] = 379,
}

Global_random_weight[472] = {}
Global_random_weight[472].stat = {0, 2, 101, 102, 107, 108, 109}
Global_random_weight[472].value = {}
Global_random_weight[472].value[1] = {6, 6, 10, 10, 50, 50, 1}
Global_random_weight[472].value[2] = {12, 12, 20, 20, 70, 70, 2}
Global_random_weight[472].value[3] = {24, 24, 40, 40, 90, 90, 3}
Global_random_weight[472].value[4] = {48, 48, 80, 80, 130, 130, 4}
Global_random_weight[472].value[5] = {96, 96, 160, 160, 200, 200, 5}
Global_random_weight[472].value[6] = {180, 180, 320, 320, 300, 300, 7}
Global_random_weight[472].value[7] = {340, 340, 640, 640, 450, 450, 9}
Global_random_weight[472].value[8] = {600, 600, 1220, 1220, 800, 800, 11}
Global_random_weight[472].value[9] = {1000, 1000, 2440, 2440, 1200, 1200, 14}
Global_random_weight[472].value[10] = {1800, 1800, 5550, 5550, 1700, 1700, 17}
Global_random_weight[472].weight = {
	[1] = 192874,
	[2] = 129274,
	[3] = 71111,
	[4] = 51824,
	[5] = 37124,
	[6] = 22577,
	[7] = 11541,
	[8] = 8856,
	[9] = 5087,
	[10] = 2079,
}

Global_random_weight[473] = {}
Global_random_weight[473].stat = {107, 107, 107, 107, 107}
Global_random_weight[473].value = {}
Global_random_weight[473].value[1] = {40, 40, 40, 40, 40}
Global_random_weight[473].value[2] = {60, 60, 60, 60, 60}
Global_random_weight[473].value[3] = {80, 80, 80, 80, 80}
Global_random_weight[473].value[4] = {120, 120, 120, 120, 120}
Global_random_weight[473].value[5] = {180, 180, 180, 180, 180}
Global_random_weight[473].value[6] = {250, 250, 250, 250, 250}
Global_random_weight[473].value[7] = {400, 400, 400, 400, 400}
Global_random_weight[473].value[8] = {550, 550, 550, 550, 550}
Global_random_weight[473].value[9] = {700, 700, 700, 700, 700}
Global_random_weight[473].value[10] = {850, 850, 850, 850, 850}
Global_random_weight[473].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 21824,
	[5] = 17124,
	[6] = 12577,
	[7] = 9541,
	[8] = 5856,
	[9] = 2087,
	[10] = 979,
}

Global_random_weight[474] = {}
Global_random_weight[474].stat = {108, 108, 108, 108, 108}
Global_random_weight[474].value = {}
Global_random_weight[474].value[1] = {40, 40, 40, 40, 40}
Global_random_weight[474].value[2] = {60, 60, 60, 60, 60}
Global_random_weight[474].value[3] = {80, 80, 80, 80, 80}
Global_random_weight[474].value[4] = {120, 120, 120, 120, 120}
Global_random_weight[474].value[5] = {180, 180, 180, 180, 180}
Global_random_weight[474].value[6] = {250, 250, 250, 250, 250}
Global_random_weight[474].value[7] = {400, 400, 400, 400, 400}
Global_random_weight[474].value[8] = {550, 550, 550, 550, 550}
Global_random_weight[474].value[9] = {700, 700, 700, 700, 700}
Global_random_weight[474].value[10] = {850, 850, 850, 850, 850}
Global_random_weight[474].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 21824,
	[5] = 17124,
	[6] = 12577,
	[7] = 9541,
	[8] = 5856,
	[9] = 2087,
	[10] = 979,
}

Global_random_weight[475] = {}
Global_random_weight[475].stat = {109, 109, 109, 109, 109}
Global_random_weight[475].value = {}
Global_random_weight[475].value[1] = {1, 1, 1, 1, 1}
Global_random_weight[475].value[2] = {2, 2, 2, 2, 2}
Global_random_weight[475].value[3] = {3, 3, 3, 3, 3}
Global_random_weight[475].value[4] = {4, 4, 4, 4, 4}
Global_random_weight[475].value[5] = {5, 5, 5, 5, 5}
Global_random_weight[475].value[6] = {6, 6, 6, 6, 6}
Global_random_weight[475].value[7] = {7, 7, 7, 7, 7}
Global_random_weight[475].value[8] = {8, 8, 8, 8, 8}
Global_random_weight[475].value[9] = {9, 9, 9, 9, 9}
Global_random_weight[475].value[10] = {10, 10, 10, 10, 10}
Global_random_weight[475].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 21824,
	[5] = 17124,
	[6] = 12577,
	[7] = 9541,
	[8] = 5856,
	[9] = 2087,
	[10] = 979,
}

Global_random_weight[476] = {}
Global_random_weight[476].stat = {0, 2, 101, 102, 107, 108, 109}
Global_random_weight[476].value = {}
Global_random_weight[476].value[1] = {10, 10, 15, 15, 75, 75, 1}
Global_random_weight[476].value[2] = {18, 18, 30, 30, 105, 105, 2}
Global_random_weight[476].value[3] = {36, 36, 60, 60, 165, 165, 4}
Global_random_weight[476].value[4] = {64, 64, 120, 120, 200, 200, 6}
Global_random_weight[476].value[5] = {140, 140, 240, 240, 300, 300, 8}
Global_random_weight[476].value[6] = {260, 260, 480, 480, 450, 450, 11}
Global_random_weight[476].value[7] = {510, 510, 960, 960, 700, 700, 14}
Global_random_weight[476].value[8] = {900, 900, 1820, 1820, 1200, 1200, 18}
Global_random_weight[476].value[9] = {1600, 1600, 3640, 3640, 1800, 1800, 23}
Global_random_weight[476].value[10] = {2700, 2700, 7550, 7550, 2500, 2500, 30}
Global_random_weight[476].weight = {
	[1] = 192874,
	[2] = 99274,
	[3] = 51111,
	[4] = 21824,
	[5] = 17124,
	[6] = 12577,
	[7] = 9541,
	[8] = 5856,
	[9] = 2087,
	[10] = 979,
}

function Global_random_weight:main(id, num)
	local item = unit.player.GetItem(id)
	
	if self[item.dataID] and item.options[1]==nil and unit.CountItem(num) >= 1 and self.paper[num][item.dataID] then
		local dataID = item.dataID
		local index = weight(self[item.dataID].weight)
		local Max = #self[dataID].stat
		for i, _ in ipairs(self[dataID].stat) do
			if rand(1, 57) <= 7*(10-i) then --확률이 점점 낮아짐
				local j = rand(1, Max+1)
				local value = self[dataID].value[index][j]
				Utility.AddItemOption(item, 3, self[dataID].stat[j], rand(value*1.2, value*2.7))
			end
		end
		unit.RemoveItem(num, 1, false)
		item.level = index
		unit.player.SendItemUpdated(item)
		
		if index >= 7 then
			local name = Server.GetItem(dataID).name
			Server.SendSay('<color=#FFBF00>'..unit.player.name..'님께서 '..index..'티어 '..name..'을 획득하였습니다.</color>')
		end
		unit.SendCenterLabel('옵션부여를 성공하였습니다.')
		unit.PlaySE('룬 효과음/호박룬 옵션부여.ogg', 1.5)
	else
		unit.SendCenterLabel('옵션부여를 실패하였습니다.')
	end
end

local function box_table(T)
	local txt = ''
	local sum = 0
	for _, v in ipairs(T) do
		sum = sum+v
	end
	for i, v in pairs(T) do
		txt = txt..i..'티어 : '..string.format('%.4f', (v/sum)*100)..'%\n'
	end
	print(txt)
end

Server.RunLater(function()
	-- box_table(Global_random_weight[472].weight)
end, 0.5)

Global_FaceRune = {}
Global_FaceRune[1] = {
	id = 430,
	var = 78,
	maxCount = 3,
	per = 100
}
Global_FaceRune[2] = {
	id = 431,
	var = 79,
	maxCount = 3,
	per = 90
}
Global_FaceRune[3] = {
	id = 432,
	var = 80,
	maxCount = 3,
	per = 80
}
Global_FaceRune[4] = {
	id = 433,
	var = 81,
	maxCount = 3,
	per = 70
}
Global_FaceRune[5] = {
	id = 434,
	var = 82,
	maxCount = 3,
	per = 60
}
Global_FaceRune[6] = {
	id = 435,
	var = 83,
	maxCount = 3,
	per = 50
}
Global_FaceRune[7] = {
	id = 436,
	var = 84,
	maxCount = 3,
	per = 40
}
Global_FaceRune[8] = {
	id = 437,
	var = 85,
	maxCount = 2,
	per = 30
}
Global_FaceRune[9] = {
	id = 438,
	var = 86,
	maxCount = 2,
	per = 25
}
Global_FaceRune[10] = {
	id = 439,
	var = 87,
	maxCount = 2,
	per = 20
}
Global_FaceRune[11] = {
	id = 440,
	var = 88,
	maxCount = 1,
	per = 10
}
Global_FaceRune[12] = {
	id = 441,
	var = 89,
	maxCount = 1,
	per = 10
}
Global_FaceRune[13] = {
	id = 442,
	var = 90,
	maxCount = 5,
	per = 10
}
Global_FaceRune[14] = {
	id = 443,
	var = 91,
	maxCount = 1,
	per = 10
}
Global_FaceRune[15] = {
	id = 444,
	var = 92,
	maxCount = 1,
	per = 10
}
Global_FaceRune[16] = {
	id = 445,
	var = 93,
	maxCount = 1,
	per = 10
}
function Global_FaceRune.main(tier)
	local data = Global_FaceRune[tier]
	if not data then return end
	if unit.GetVar(data.var) < data.maxCount then
		if rand(1, 101) <= data.per then
			unit.SetVar(data.var, unit.GetVar(data.var)+1)
			unit.AddItem(data.id)
		end
	end
end






