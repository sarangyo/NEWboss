local food = {}
local var = 11
local num_var = 47
local sound = {
--[[ 1 ]] '사탕먹는소리.ogg', 
--[[ 2 ]] '족발먹는소리.ogg', 
--[[ 3 ]] '큰나뭇잎 냠냠.ogg', 
--[[ 4 ]] '황금열매.ogg', 
--[[ 5 ]] '얼음 씹어 먹는 효과음.ogg', 
--[[ 6 ]] '과자칩 아자작.ogg', 
--[[ 7 ]] '도넛 먹는소리.ogg', 
--[[ 8 ]] '파스타.ogg',
--[[ 9 ]] '치킨.ogg', 
--[[ 10 ]] '피자.ogg', 
--[[ 11 ]] '수박.ogg', 
--[[ 12 ]] '커피.ogg', 
--[[ 13 ]] '홍시.ogg'}
food[':'..230] = {150, 2}
food[':'..231] = {200, 4}
food[':'..232] = {250, 2}
food[':'..233] = {300, 11}
food[':'..234] = {350, 2}
food[':'..235] = {400, 7}
food[':'..236] = {600, 4}
food[':'..237] = {500, 6}
food[':'..238] = {700, 5}
food[':'..239] = {800, 5}
food[':'..240] = {900, 1}
food[':'..241] = {1000, 1}
food[':'..242] = {1300, 1}
food[':'..243] = {1600, 1}
food[':'..244] = {2000, 1}
food[':'..245] = {2400, 1}
food[':'..246] = {3000, 3}
food[':'..247] = {3700, 6}
food[':'..248] = {4500, 6}
food[':'..249] = {5400, 5}
food[':'..250] = {6400, 6}
food[':'..254] = {7500, 8}
food[':'..255] = {8700, 9}
food[':'..256] = {10000, 7}
food[':'..257] = {12000, 12}
food[':'..258] = {14000, 10}
food[':'..259] = {16000, 2}
food[':'..260] = {18000, 7}
food[':'..261] = {20000, 7}
food[':'..262] = {22000, 11}
food[':'..263] = {24000, 10}
food[':'..264] = {26000, 2}
food[':'..265] = {28000, 7}
food[':'..266] = {30000, 2}
food[':'..267] = {32000, 13}
food[':'..268] = {34000, 13}
food[':'..269] = {36000, 8}
food[':'..270] = {38000, 10}
food[':'..271] = {40000, 9}
food[':'..272] = {42000, 9}
food[':'..273] = {44000, 7}
food[':'..274] = {46000, 2}
food[':'..275] = {48000, 2}
food[':'..276] = {50000, 10}
food[':'..277] = {55000, 10}
food[':'..278] = {70000, 10}
food[':'..471] = {150000, 3}

local data_table = {}

local function func_food(unit, T)
	local sum = 0
	for i, _ in pairs(T) do
		sum = sum+food[i][1]
	end
	unit.SetVar(num_var, sum)
	-- print(unit.GetVar(num_var))
	unit.RefreshStats()
end

local Find = string.find
local Sub = string.sub
function remove_color(txt)
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

-- /script for i=230, 278 do unit.AddItem(i, 2) end


local FOOD_VAR = 12
local function skin_(unit, id)
	local txt = unit.GetStringVar(FOOD_VAR)
	if txt == nil or txt == '' then
		local text = ''
				
		for i, _ in pairs(food) do
			text = text..'"'..i..'":false,'
		end

		text = '{'..string.sub(text, 1, #text-1)..'}'
		
		unit.SetStringVar(FOOD_VAR, text)
	end
	
	local dumy = Utility.JSONParse(unit.GetStringVar(FOOD_VAR))
	local Table = {}
	
	dumy[':'..id] = true
	
	unit.SetStringVar(FOOD_VAR, Utility.JSONSerialize(dumy))
end


Server.onUseItem.Add(function(unit, item)
	if food[':'..item.dataID] then
		local id = item.dataID
		local t = unit.GetStringVar(var)
		if t == '' or t == nil then
			unit.SetStringVar(var, Utility.JSONSerialize(data_table))
			t = unit.GetStringVar(var)
		end
		
		local dumy_table = Utility.JSONParse(t)
		if dumy_table[':'..id] then
			unit.SendCenterLabel('<color=#F78181>이미 섭취한 음식이다.</color>')
		else
			unit.RemoveItem(id, 1, false)
			unit.PlaySE('먹는 소리/'..sound[food[':'..id][2]], 1.5)
			local name = remove_color(Server.GetItem(id).name)
			unit.FireEvent('ShowAlert', name..'을(를) 섭취하였다.\n'..
				'최대체력 : '..unit.maxHP..' > '..unit.maxHP+food[':'..item.dataID][1])
			unit.SendCenterLabel('<color=#F78181>튼튼해진 느낌이다.</color>')
			dumy_table[':'..id] = true
			unit.SetStringVar(var, Utility.JSONSerialize(dumy_table))
			func_food(unit, dumy_table)
			
			skin_(unit, id)
		end
	end
end)









Server.GetTopic('skin_table_start').Add(function()
	unit.FireEvent('skin_table', Utility.JSONSerialize(food), Utility.JSONSerialize(sound))
end)


local function skin_start()
	if unit.GetStringVar(FOOD_VAR) == nil or unit.GetStringVar(FOOD_VAR) == '' then
		local text = ''
				
		for i, _ in pairs(food) do
			text = text..'"'..i..'":false,'
		end

		text = '{'..string.sub(text, 1, #text-1)..'}'
		
		unit.SetStringVar(FOOD_VAR, text)
	end
	
	unit.FireEvent("skin_start", unit.GetStringVar(FOOD_VAR))
end

Server.GetTopic("SKIN__").Add(function()
	skin_start()
end)

local function skin_initialization()
	unit.SetStringVar(FOOD_VAR, '')
	unit.SendCenterLabel('음식함 초기화완료')
	return 
end

Server.GetTopic("음식초기화").Add(function()
	skin_initialization()
end)

















