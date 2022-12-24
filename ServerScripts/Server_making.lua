


local but_name = {index = {}}
but_name.main = {'룬', '장비', '재료'} -- 맨 위 카테고리 이름

but_name.index['1'] = {'일반', '무작위', '부여'} -- 하위 카테고리 이름들
but_name.index['2'] = {'반지', '목걸이'}
but_name.index['3'] = {'재료'}


local ItemCreateMenu = {
	
	[but_name.main[1]] = { --------- 무기 카테고리 설정
		
		[but_name.index['1'][1]] = {dataID = {539, 540, 541, 542, 544, 545, 546, 547}, -------- 무기 -> 일반 검 내의 제작할 dataID
			gold = {15500000, 15500000, 15500000, 15500000, 9710000000, 9710000000, 9710000000, 9710000000}, ------------- 제작시 필요한 골드
			chance = {100, 100, 100, 100, 100, 100, 100, 100}, -------------- 제작 확률
			itemdataID = {
				['1'] = {534}, 
				['2'] = {535},
				['3'] = {536},
				['4'] = {537},
				['5'] = {539},
				['6'] = {540},
				['7'] = {541},
				['8'] = {542},}, --------------------- 첫번째 아이템 제작시 필요한 아이템 dataID  , 두번째 아이템 제작시 필요한 dataID
			itemcount = {
				['1'] = {8}, 
				['2'] = {8},
				['3'] = {8},
				['4'] = {8},
				['5'] = {40},
				['6'] = {40},
				['7'] = {40},
				['8'] = {40},}}, ------------------------------첫번째 아이템 제작시 필요한 아이템 갯수, 두번째 아이템 제작시 필요한 아이템 갯수

		[but_name.index['1'][2]] = {dataID = {315, 316, 317, 318, 319, 320, 321, 322, 549},
			gold = {2444, 9776, 39104, 156416, 625664, 2502656, 10010624, 40042496, 160169984},
			chance = {95, 95, 95, 95, 95, 95, 95, 95, 100},
			itemdataID = {
				['1'] = {314},
				['2'] = {315},
				['3'] = {316},
				['4'] = {317},
				['5'] = {318},
				['6'] = {319},
				['7'] = {320},
				['8'] = {321},
				['9'] = {322},},
			itemcount = {
				['1'] = {3},
				['2'] = {3},
				['3'] = {3},
				['4'] = {3},
				['5'] = {3},
				['6'] = {3},
				['7'] = {3},
				['8'] = {3},
				['9'] = {4},}},

		[but_name.index['1'][3]] = {dataID = {378, 379, 380, 381, 382},
			gold = {1000000, 1000000, 1000000, 1000000, 1000000},
			chance = {100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {323},
				['2'] = {378},
				['3'] = {378},
				['4'] = {378},
				['5'] = {378},
			},
			itemcount = {
				['1'] = {55},
				['2'] = {6},
				['3'] = {6},
				['4'] = {6},
				['5'] = {6},
			}},
	},

-------------------------------------------------------------------------------------------------
	[but_name.main[2]] = {
		
		[but_name.index['2'][1]] = {dataID = {520, 521, 551, 552, 553, 554, 555, 556},
			gold = {400000000, 400000000, 400000000, 400000000, 400000000, 400000000, 40000000000, 40000000000},
			chance = {100, 100, 100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {527, 528, 529, 530, 531, 532},
				['2'] = {527, 528, 529, 530, 531, 532},
				['3'] = {527, 528, 529, 530, 531, 532, 77},
				['4'] = {527, 528, 529, 530, 531, 532, 77},
				['5'] = {527, 528, 529, 530, 531, 532, 77},
				['6'] = {527, 528, 529, 530, 531, 532, 77},
				['7'] = {553},
				['8'] = {554},
			},
			itemcount = {
				['1'] = {8, 25, 22, 11, 15, 19},
				['2'] = {8, 25, 22, 11, 15, 19},
				['3'] = {48, 150, 132, 66, 93, 117, 777666},
				['4'] = {48, 150, 132, 66, 93, 117, 777666},
				['5'] = {260, 900, 792, 396, 558, 702, 4666888},
				['6'] = {260, 900, 792, 396, 558, 702, 4666888},
				['7'] = {6},
				['8'] = {6},
			}},
		[but_name.index['2'][2]] = {dataID = {407},
			gold = {50000000},
			chance = {100},
			itemdataID = {
				['1'] = {402},
			},
			itemcount = {
				['1'] = {40},
			}},
	},

-------------------------------------------------------------------------------------------------
	[but_name.main[3]] = {
		
		[but_name.index['3'][1]] = {dataID = {566, 567},
			gold = {0, 0},
			chance = {81, 63},
			itemdataID = {
				['1'] = {564, 560},
				['2'] = {565, 560},
			},
			itemcount = {
				['1'] = {8, 20},
				['2'] = {8, 75},
			}},

	},
	
}
Server.GetTopic('make_Up').Add(function()
	unit.FireEvent('make_Up')
end)

Server.GetTopic("make:Up").Add(function()
	local list = {}
	local countitem = unit.CountItem

	for h = 1, #but_name.main do -- 아이템 갯수 가져오기 출력형식: {"무기":{"data":{"1":[41,2428],"2":[41,3232]}},"방어구":{"data":{"1":[41,2428,3232,0,0]}},"악세사리":{"data":{"1":[41,2428]}},"소모품":{"data":{"1":[41,2428]}},"재료":{"data":{"1":[41,2428]}}}
		local t1 = but_name.main[h]
		local t2 = but_name.index[tostring(h)]
		list[t1] = {}
		for jk = 1, #t2 do
			list[t1][t2[jk]] = {data = {}}
			for i, n in pairs(ItemCreateMenu[t1][t2[jk]].itemdataID) do
				list[t1][t2[jk]].data[i] = {}
				for l, k in pairs(n) do
					list[t1][t2[jk]].data[i][l] = countitem(k)
				end
			end
		end
	end
	unit.FireEvent("make:down", json.serialize(but_name), json.serialize(ItemCreateMenu), json.serialize(list), unit.gameMoney)
end)

  
Server.GetTopic("make:MakeUp").Add(function(menu, count, mincount, dataID, var)
	local countitem = unit.CountItem

	local data = {}
	data.up = 0
	data.down = 0

	--if var <= 0 or var >= 1001 then
	if var <= 0 or var >= 11 then
		unit.SendCenterLabel("알 수 없는 오류가 발생 하였습니다.")
		return
	end
	
	local t1 = ItemCreateMenu[but_name.main[menu]][but_name.index[tostring(menu)][count]]
	--[[
	if Server.GetItem(t1.dataID[mincount]).maxCount < var then
		unit.SendCenterLabel("해당 아이템은 "..Server.GetItem(t1.dataID[mincount]).maxCount.."개까지만 제작 가능합니다.")
		return
	end]]
	
	if unit.gameMoney < t1.gold[mincount]*var then
		unit.SendCenterLabel("골드가 부족합니다.")
		return false
	end
	
	local t2 = t1.itemdataID[tostring(mincount)]
	local t3 = t1.itemcount[tostring(mincount)]
	for i = 1, #t2 do
		if countitem(t2[i]) < t3[i]*var then
			unit.SendCenterLabel("재료가 부족합니다.")
			return false
		end

		if unit.IsEquippedItemByDataID(t2[i])==true then
			unit.SendCenterLabel('재료가 될 아이템이 장착 상태입니다.\n<color=#F78181>아이템을 창고에 넣어두고 제작하세요.</color>')
			return false
		end
	end

	unit.UseGameMoney(t1.gold[mincount]*var)

	for i = 1, #t2 do
		unit.RemoveItem(t2[i], t3[i]*var, false)
	end

	for i = 1, var do
		if rand(1, 101) <= t1.chance[mincount] then
			data.up = data.up + 1
		else
			data.down = data.down + 1
		end
	end

	--unit.SendCenterLabel('아이템 '..var..'중에서 '..data.up..'개 조합 성공  '..data.down..'개 조합 실패')

	unit.FireEvent("ItemMakeUpData", data.up, data.down, t1.dataID[mincount])
	
	
	for i=1, data.up do -- onAddItem이 작동되도록 1개씩 줌
		unit.AddItem(t1.dataID[mincount], 1, false)
	end
end)

