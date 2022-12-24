
local Destroy = {}

-- 필터, 자동분해 설정 저장 스트링변수 번호 (비어있는 스트링변수 번호를 입력하세요)
Destroy.settingVar = 15

-- 아이템 등급 설정 
Destroy.list = {

    ['1'] = {
        name = '룬[일반]', 	    -- 등급 이름
		color = '#FFFFFF',  -- 등급 텍스트 색상코드
		data = {
			119, 120, 121, 122, 
			225, 226, 227, 228,
			285, 286, 287, 288, 
			294, 295, 296, 297, 299, 300, 301, 302, 304, 305, 306, 307, 309, 310, 311, 312,
			534, 535, 536, 537, 539, 540, 541, 542, 544, 545, 546, 547,},
	},
    ['2'] = { 
        name = '룬[무작위]\n(미구현)',
		color = '#FFFF00',
        data = {--[[314, 315, 316, 317, 318, 319, 320, 321, 322, 549]]},
    },
    ['3'] = {
        name = '룬[부여]\n(미구현)',
		color = '#D0FA58',
        data = {--[[323, 378, 379, 380, 381, 382,
		472, 473, 474, 475, 476]]},
    },
	['4'] = {
        name = '악당장비\n(미구현)',
		color = '#F4FA58',
        data = {--[[323, 378, 379, 380, 381, 382,
		472, 473, 474, 475, 476]]},
    },
	['5'] = {
        name = '악세사리',
		color = '#FFFFFF',
        data = {520, 521, 551, 552, 553, 554},
    },
}

-- 아이템 분해 보상 (위에서 등급을 지정한 아이템의 보상을 모두 설정해야 합니다)
Destroy.reward = {
	['520'] = {
		['1'] = {527, 4, 7},
		['2'] = {528, 12, 24},
		['3'] = {529, 11, 21},
		['4'] = {530, 6, 10},
		['5'] = {531, 7, 14},
		['6'] = {532, 10, 18},
	},
	['521'] = {
		['1'] = {527, 4, 7},
		['2'] = {528, 12, 24},
		['3'] = {529, 11, 21},
		['4'] = {530, 6, 10},
		['5'] = {531, 7, 14},
		['6'] = {532, 10, 18},
	},
	['551'] = { 
		['1'] = {527, 20, 35},
		['2'] = {528, 60, 120},
		['3'] = {529, 55, 105},
		['4'] = {530, 30, 50},
		['5'] = {531, 35, 70},
		['6'] = {532, 50, 90},
	},
	['552'] = { 
		['1'] = {527, 20, 35},
		['2'] = {528, 60, 120},
		['3'] = {529, 55, 105},
		['4'] = {530, 30, 50},
		['5'] = {531, 35, 70},
		['6'] = {532, 50, 90},
	},
	['553'] = { 
		['1'] = {527, 100, 175},
		['2'] = {528, 300, 600},
		['3'] = {529, 275, 525},
		['4'] = {530, 150, 250},
		['5'] = {531, 175, 350},
		['6'] = {532, 250, 450},
	},
	['554'] = { 
		['1'] = {527, 100, 175},
		['2'] = {528, 300, 600},
		['3'] = {529, 275, 525},
		['4'] = {530, 150, 250},
		['5'] = {531, 175, 350},
		['6'] = {532, 250, 450},
	},
	['119'] = {
		['1'] = {560, 1, 1},
	},
	['120'] = {
		['1'] = {560, 1, 1},
	},
	['121'] = {
		['1'] = {560, 1, 1}
	},
	['122'] = {
		['1'] = {560, 1, 1}
	},
	['225'] = {
		['1'] = {560, 2, 3}
	},
	['226'] = {
		['1'] = {560, 2, 3}
	},
	['227'] = {
		['1'] = {560, 2, 3}
	},
	['228'] = {
		['1'] = {560, 2, 3}
	},
	['285'] = {
		['1'] = {560, 3, 5}
	},
	['286'] = {
		['1'] = {560, 3, 5}
	},
	['287'] = {
		['1'] = {560, 3, 5}
	},
	['288'] = {
		['1'] = {560, 3, 5}
	},
	['294'] = {
		['1'] = {560, 5, 8}
	},
	['295'] = {
		['1'] = {560, 5, 8}
	},
	['296'] = {
		['1'] = {560, 5, 8}
	},
	['297'] = {
		['1'] = {560, 5, 8}
	},
	['299'] = {
		['1'] = {560, 8, 13}
	},
	['300'] = {
		['1'] = {560, 8, 13}
	},
	['301'] = {
		['1'] = {560, 8, 13}
	},
	['302'] = {
		['1'] = {560, 8, 13}
	},
	['304'] = {
		['1'] = {560, 13, 19}
	},
	['305'] = {
		['1'] = {560, 13, 19}
	},
	['306'] = {
		['1'] = {560, 13, 19}
	},
	['307'] = {
		['1'] = {560, 13, 19}
	},
	['309'] = {
		['1'] = {560, 19, 27}
	},
	['310'] = {
		['1'] = {560, 19, 27}
	},
	['311'] = {
		['1'] = {560, 19, 27}
	},
	['312'] = {
		['1'] = {560, 19, 27}
	},
	['534'] = {
		['1'] = {560, 120, 180}
	},
	['535'] = {
		['1'] = {560, 120, 180}
	},
	['536'] = {
		['1'] = {560, 120, 180}
	},
	['537'] = {
		['1'] = {560, 120, 180}
	},
	['539'] = {
		['1'] = {560, 500, 700}
	},
	['540'] = {
		['1'] = {560, 500, 700}
	},
	['541'] = {
		['1'] = {560, 500, 700}
	},
	['542'] = {
		['1'] = {560, 500, 700}
	},
	['544'] = {
		['1'] = {560, 7500, 10500}
	},
	['545'] = {
		['1'] = {560, 7500, 10500}
	},
	['546'] = {
		['1'] = {560, 7500, 10500}
	},
	['547'] = {
		['1'] = {560, 7500, 10500}
	},

	------------------------------------

	------------------------------------
}

------------------------------------------------------------------------------------
-- 아래부터는 수정할 필요가 없습니다.
------------------------------------------------------------------------------------

Destroy.itemClass = {}
for i, v in pairs(Destroy.list) do
	for k, n in ipairs(v.data) do
        Destroy.itemClass[tostring(n)] = i
    end
end

Server.GetTopic('분해UI열기').Add(function()
	unit.FireEvent('분해UI열기')
end)


function Destroy:getSetting(userData)
	local me = userData and userData or unit

	local Setting = {}
    if me.GetStringVar(self.settingVar) == '' or me.GetStringVar(self.settingVar) == nil then
		Setting.filterLevel = {0,15}
		Setting.filterClass = {}
		Setting.autoDestroy = {}
		for i, v in pairs(self.list) do
			Setting.filterClass[i] = 0
			Setting.autoDestroy[i] = 0
		end
	else
        Setting = Utility.JSONParse(me.GetStringVar(self.settingVar))
		for i, v in pairs(self.list) do
			if not Setting.filterClass[i] then
				Setting.filterClass[i] = 0
				Setting.autoDestroy[i] = 0
			end
		end
    end
	return Setting
end


function Destroy.info()
	local Setting = Destroy:getSetting()
	
	local Item = {info={},opts={}}
	for i, v in ipairs(unit.player.GetItems()) do
		if Destroy.itemClass[tostring(v.dataID)] and not unit.IsEquippedItem(v.id) then
			local N = #Item.info+1
			Item.info[N] = {}
			Item.info[N].id = v.id
			Item.info[N].data = v.dataID
			Item.info[N].count = v.count
			Item.info[N].level = v.level
			
			local strN = tostring(N)
			Item.opts[strN] = {}
			for k, n in ipairs(v.options) do
				Item.opts[strN][#Item.opts[strN]+1] = n.type
				Item.opts[strN][#Item.opts[strN]+1] = n.statID
				Item.opts[strN][#Item.opts[strN]+1] = n.value
			end
		end
	end
	unit.FireEvent('Destroy:data', Utility.JSONSerialize(Destroy.list), Utility.JSONSerialize(Destroy.itemClass), Utility.JSONSerialize(Destroy.reward), Utility.JSONSerialize(Item), Utility.JSONSerialize(Setting))
end
Server.GetTopic('Destroy:info').Add(Destroy.info)


function Destroy:Item(table)
	local selectItems = Utility.JSONParse(table)

	for i=1, #selectItems do
		local item = unit.player.GetItem(selectItems[i])
		if not item then 
			unit.SendCenterLabel('<size=16><color=Red>선택한 아이템이 인벤토리에 존재하지 않아 작업이 취소되었습니다.</color></size>')
			return
		end
	end

	local Item = {data={},count={}}

	for i=1, #selectItems do
		local tem = unit.player.GetItem(selectItems[i])
		local cnt = tem.count

		unit.RemoveItemByID(selectItems[i], tem.count, false)

		for k, n in pairs(self.reward[tostring(tem.dataID)]) do
			if not Item.count[tostring(n[1])] then
				Item.data[#Item.data+1] = n[1]
				Item.count[tostring(n[1])] = rand(n[2], n[3]+1) * cnt
			else
				Item.count[tostring(n[1])] = Item.count[tostring(n[1])] + (rand(n[2], n[3]+1) * cnt)
			end
		end
	end

	for i=1, #Item.data do
		local v = Item.data[i]
		unit.AddItem(v, Item.count[tostring(v)], false)
	end
	unit.SendCenterLabel('<size=16><color=#00ff00>선택한 장비들을 성공적으로 분해하였습니다.</color></size>')
	unit.FireEvent('Reward_Item', Utility.JSONSerialize(Item))
	
	Destroy:info()
end
Server.GetTopic('Destroy:Item').Add(function(a) Destroy:Item(a) end)


function Destroy.filterSet(f_data)
	local getSetting = Utility.JSONParse(f_data)
	local Setting = Destroy:getSetting()
	Setting.filterLevel = getSetting.level
	Setting.filterClass = getSetting.class
	unit.SetStringVar(Destroy.settingVar, Utility.JSONSerialize(Setting))

	local Txt = Setting.filterLevel[1] == 0 and '강화장비 제외 / ' or '강화 <color=#00ff00>+'..Setting.filterLevel[2]..'</color> 이하 / '
	local Txt2 = ''
	for i, v in pairs(Destroy.list) do
		if Setting.filterClass[i] == 1 then
			Txt2 = Txt2 .. '<color='..Destroy.list[i].color..'>'..v.name..'</color> '
		end
	end
	Txt2 = Txt2 == '' and '모든등급 포함' or Txt2 .. '등급 제외'
	unit.SendCenterLabel('<size=16><color=#00ff00>자동선택 필터가 저장되었습니다.</color></size>\n<size=14>('.. Txt..Txt2 ..')</size>')
end
Server.GetTopic('Destroy:filterSet').Add(Destroy.filterSet)

--[[
function Destroy:autoSet(a_data)
	local Setting = Destroy:getSetting()
	Setting.autoDestroy = Utility.JSONParse(a_data)
	unit.SetStringVar(self.settingVar, Utility.JSONSerialize(Setting))

	local Txt = ''
	for i, v in pairs(self.list) do
		if Setting.autoDestroy[i] == 1 then
			Txt = Txt .. '<color='..self.list[i].color..'>'..v.name..'</color> '
		end
	end
	Txt = Txt == '' and '자동분해 설정된 등급이 없습니다' or Txt .. '등급 설정됨'
	unit.SendCenterLabel('<size=16><color=#00ff00>자동분해 설정이 저장되었습니다.</color></size>\n<size=14>('.. Txt ..')</size>')
end
Server.GetTopic('Destroy_autoSet').Add(function(a) Destroy:autoSet(a) end)

Server.onAddItem.Add(function(unit, item)

	if Destroy.reward[tostring(item.dataID)] then
		local Setting = Destroy:getSetting(unit)
		local CN = Destroy.itemClass[tostring(item.dataID)]

		if Setting.autoDestroy[CN] == 1 then
			unit.RemoveItemByID(item.id, item.count, false)

			for i, v in pairs(Destroy.reward[tostring(item.dataID)]) do
				local c = rand(v[2], v[3]+1)
				unit.AddItem(v[1], c, false)
			end
		end
	end

end)
]]