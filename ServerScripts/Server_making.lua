


local but_name = {index = {}}
but_name.main = {'룬', '장비', '재료'} -- 맨 위 카테고리 이름

but_name.index['1'] = {'일반', '무작위', '부여'} -- 하위 카테고리 이름들
but_name.index['2'] = {'반지', '목걸이', '마왕', '신기', '2성 신기', '3성 신기', '4성 신기', '5성 신기'}
but_name.index['3'] = {'재료'}


local ItemCreateMenu = {
	
	[but_name.main[1]] = { 
		
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
				['8'] = {542},
			}, --------------------- 첫번째 아이템 제작시 필요한 아이템 dataID  , 두번째 아이템 제작시 필요한 dataID
			itemcount = {
				['1'] = {8}, 
				['2'] = {8},
				['3'] = {8},
				['4'] = {8},
				['5'] = {40},
				['6'] = {40},
				['7'] = {40},
				['8'] = {40},
			}
		}, ------------------------------첫번째 아이템 제작시 필요한 아이템 갯수, 두번째 아이템 제작시 필요한 아이템 갯수

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
				['9'] = {322},
			},
			itemcount = {
				['1'] = {3},
				['2'] = {3},
				['3'] = {3},
				['4'] = {3},
				['5'] = {3},
				['6'] = {3},
				['7'] = {3},
				['8'] = {4},
				['9'] = {5},
			}
		},

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
				['1'] = {40},
				['2'] = {5},
				['3'] = {5},
				['4'] = {5},
				['5'] = {5},
			}
		},
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
			}
		},
		[but_name.index['2'][2]] = {dataID = {407, 514, 515, 516, 517},
			gold = {50000000, 25000000000, 25000000000, 25000000000, 25000000000},
			chance = {100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {402},
				['2'] = {403, 544, 560},
				['3'] = {404, 545, 560},
				['4'] = {405, 546, 560},
				['5'] = {406, 547, 560},
			},
			itemcount = {
				['1'] = {40},
				['2'] = {50, 5, 11000},
				['3'] = {50, 5, 5500},
				['4'] = {50, 5, 5500},
				['5'] = {50, 5, 5500},
			}
		},
		[but_name.index['2'][3]] = {dataID = {518},
			gold = {0},
			chance = {0},
			itemdataID = {
				['1'] = {518},
			},
			itemcount = {
				['1'] = {1},
			}
		},
		[but_name.index['2'][4]] = {dataID = {409, 410, 411, 412, 413, 414},
			gold = {5000000000, 5000000000, 5000000000, 5000000000, 5000000000, 5000000000},
			chance = {100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {566, 527, 282},
				['2'] = {566, 528, 282},
				['3'] = {566, 529, 282},
				['4'] = {566, 530, 282},
				['5'] = {566, 531, 282},
				['6'] = {566, 532, 282},
			},
			itemcount = {
				['1'] = {15, 130, 325},
				['2'] = {15, 450, 325},
				['3'] = {15, 396, 325},
				['4'] = {15, 198, 325},
				['5'] = {15, 279, 325},
				['6'] = {15, 351, 325},
			}
		},
		[but_name.index['2'][5]] = {dataID = {570, 571, 572, 573, 574, 575},
			gold = {5000000000, 5000000000, 5000000000, 5000000000, 5000000000, 5000000000},
			chance = {100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {409, 224, 282},
				['2'] = {410, 224, 282},
				['3'] = {411, 224, 282},
				['4'] = {412, 224, 282},
				['5'] = {413, 224, 282},
				['6'] = {414, 224, 282},
			},
			itemcount = {
				['1'] = {2, 500, 1000},
				['2'] = {2, 500, 1000},
				['3'] = {2, 500, 1000},
				['4'] = {2, 500, 1000},
				['5'] = {2, 500, 1000},
				['6'] = {2, 500, 1000},
			}
		},
		[but_name.index['2'][6]] = {dataID = {577, 578, 579, 580, 581, 582},
			gold = {20000000000, 20000000000, 20000000000, 20000000000, 20000000000, 20000000000},
			chance = {100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {570, 568, 224, 282},
				['2'] = {571, 568, 224, 282},
				['3'] = {572, 568, 224, 282},
				['4'] = {573, 568, 224, 282},
				['5'] = {574, 568, 224, 282},
				['6'] = {575, 568, 224, 282},
			},
			itemcount = {
				['1'] = {2, 1, 2000, 2700},
				['2'] = {2, 1, 2000, 2700},
				['3'] = {2, 1, 2000, 2700},
				['4'] = {2, 1, 2000, 2700},
				['5'] = {2, 1, 2000, 2700},
				['6'] = {2, 1, 2000, 2700},
			}
		},
		[but_name.index['2'][7]] = {dataID = {584, 585, 586, 587, 588, 589},
			gold = {60000000000, 60000000000, 60000000000, 60000000000, 60000000000, 60000000000},
			chance = {100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {577, 224, 282},
				['2'] = {578, 224, 282},
				['3'] = {579, 224, 282},
				['4'] = {580, 224, 282},
				['5'] = {581, 224, 282},
				['6'] = {582, 224, 282},
			},
			itemcount = {
				['1'] = {2, 5000, 7600},
				['2'] = {2, 5000, 7600},
				['3'] = {2, 5000, 7600},
				['4'] = {2, 5000, 7600},
				['5'] = {2, 5000, 7600},
				['6'] = {2, 5000, 7600},
			}
		},
		[but_name.index['2'][8]] = {dataID = {591, 592, 593, 594, 595, 596},
			gold = {500000000000, 500000000000, 500000000000, 500000000000, 500000000000, 500000000000},
			chance = {100, 100, 100, 100, 100, 100},
			itemdataID = {
				['1'] = {577, 568, 224, 282},
				['2'] = {578, 568, 224, 282},
				['3'] = {579, 568, 224, 282},
				['4'] = {580, 568, 224, 282},
				['5'] = {581, 568, 224, 282},
				['6'] = {582, 568, 224, 282},
			},
			itemcount = {
				['1'] = {2, 10, 50000, 25000},
				['2'] = {2, 10, 50000, 25000},
				['3'] = {2, 10, 50000, 25000},
				['4'] = {2, 10, 50000, 25000},
				['5'] = {2, 10, 50000, 25000},
				['6'] = {2, 10, 50000, 25000},
			}
		},
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
			}
		},
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

