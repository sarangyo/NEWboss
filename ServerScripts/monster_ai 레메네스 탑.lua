Global_tap = {}
Global_tap.UseCarrot = 20000 -- 입장시 필요한 당근
Global_tap.DefaultCarrot = 200 -- 1층 기본 당근
Global_tap.AddCarrot = 1.354 -- 상승 지수 당근

Global_tap.monster = {} -- 몬스터 정보
Global_tap.monster.id = {112, 113, 114, 115, 116, 117} -- 탑에 등장할 몬스터
Global_tap.monster.wei = {15, 50, 44, 22, 31, 39} -- 가중치(등장확률)
Global_tap.monster.spec = {} -- 상승 지수 스펙
Global_tap.monster.spec.stat = 1.15
--[[
	local num = 100000000
	local n = 0.108
	for i=1, 100 do
		num = num-num*n
		print('['..i..'] = '..(100000000-math.floor(num))..',')
	end
]]
Global_tap.monster.spec.agi = {
	[0] = 9000000,
	[1] = 17190000,
	[2] = 24642900,
	[3] = 31425039,
	[4] = 37596786,
	[5] = 43213075,
	[6] = 48323899,
	[7] = 52974748,
	[8] = 57207020,
	[9] = 61058389,
	[10] = 64563134,
	[11] = 67752452,
	[12] = 70654731,
	[13] = 73295805,
	[14] = 75699183,
	[15] = 77886257,
	[16] = 79876493,
	[17] = 81687609,
	[18] = 83335724,
	[19] = 84835509,
	[20] = 86200313,
	[21] = 87442285,
	[22] = 88572480,
	[23] = 89600957,
	[24] = 90536870,
	[25] = 91388552,
	[26] = 92163583,
	[27] = 92868860,
	[28] = 93510663,
	[29] = 94094703,
	[30] = 94626180,
	[31] = 95109824,
	[32] = 95549940,
	[33] = 95950445,
	[34] = 96314905,
	[35] = 96646564,
	[36] = 96948373,
	[37] = 97223020,
	[38] = 97472948,
	[39] = 97700383,
	[40] = 97907348,
	[41] = 98095687,
	[42] = 98267075,
	[43] = 98423038,
	[44] = 98564965,
	[45] = 98694118,
	[46] = 98811648,
	[47] = 98918599,
	[48] = 99015925,
	[49] = 99104492,
	[50] = 99185088,
	[51] = 99258430,
	[52] = 99325171,
	[53] = 99385906,
	[54] = 99441175,
	[55] = 99491469,
	[56] = 99537237,
	[57] = 99578885,
	[58] = 99616786,
	[59] = 99651275,
	[60] = 99682660,
	[61] = 99711221,
	[62] = 99737211,
	[63] = 99760862,
	[64] = 99782385,
	[65] = 99801970,
	[66] = 99819793,
	[67] = 99836012,
	[68] = 99850771,
	[69] = 99864201,
	[70] = 99876423,
	[71] = 99887545,
	[72] = 99897666,
	[73] = 99906876,
	[74] = 99915257,
	[75] = 99922884,
	[76] = 99929825,
	[77] = 99936141,
	[78] = 99941888,
	[79] = 99947118,
	[80] = 99951877,
	[81] = 99956209,
	[82] = 99960150,
	[83] = 99963736,
	[84] = 99967000,
	[85] = 99969970,
	[86] = 99972673,
	[87] = 99975132,
	[88] = 99977371,
	[89] = 99979407,
	[90] = 99981261,
	[91] = 99982947,
	[92] = 99984482,
	[93] = 99985879,
	[94] = 99987150,
	[95] = 99988306,
	[96] = 99989359,
	[97] = 99990316,
	[98] = 99991188,
	[99] = 99991981,
	[100] = 99992703,
}

Global_tap.monster.data = {}
for _, v in ipairs(Global_tap.monster.id) do
	Global_tap.monster.data[v] = {}
end

Global_tap.monster.data[113].var = {255000, 5000}
Global_tap.monster.data[113].stat = {0, 1} -- 슬라임킹
Global_tap.monster.data[114].var = {289000, 5000}
Global_tap.monster.data[114].stat = {0, 1} -- 전투부엉
Global_tap.monster.data[117].var = {232000, 20000, 20000}
Global_tap.monster.data[117].stat = {0, 1, 3} -- 나무몬
Global_tap.monster.data[116].var = {335000, 5000}
Global_tap.monster.data[116].stat = {0, 1} -- 엑스크로스
Global_tap.monster.data[115].var = {357000, 20000}
Global_tap.monster.data[115].stat = {2, 3} -- 고블진혜
Global_tap.monster.data[112].var = {388000, 5000}
Global_tap.monster.data[112].stat = {0, 1} -- 시퍼런 도끼질



Global_tap.monster.per = {}
Global_tap.monster.sum = 0
local data = Global_tap.monster
for i, v in ipairs(data.wei) do
	data.sum = data.sum+v
end

local j = 1
for i, v in ipairs(data.wei) do -- 가중치 테이블
	for k=1, v do
		data.per[j] = i
		j = j+1
	end
end
data, j = nil, nil




local function monsterAI(enemy, ai, event, data)
	if event == 1 then -- 피격 시
		local u = ai.GetTargetUnit() or ai.GetAttackedUnit()
		if u then
			u.FireEvent("bh", enemy.hp, enemy.monsterID)
		end
		return
    end
	
    if event == 0 then 
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000) 
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 1500)

            if ai.GetTargetUnit() ~= nil then 
                ai.SetFollowTarget(true) 
            end
        end
		
        if ai.GetTargetUnit() == nil then
            return
        end 
		--[[
		if enemy.maxHP*0.2 >= enemy.hp then
			if rand(1, 3)==1 then
				ai.UseSkill(65)
			end
		end
		
		if rand(1, 5)==1 then
			enemy.field.SpawnEnemy(109, enemy.x, enemy.y)
		end
		
		if rand(1, 3)==1 then
			ai.UseSkill(64)
			if rand(1, 3)==1 then
				local AI = ai
				Server.RunLater(function()
					AI.UseSkill(64)
				end, 1)
			end
		end]]
		return
    end
	
	if event == 2 then -- 사망 시
		local Fvar = enemy.field.GetFieldVar(2)
		local u = ai.GetTargetUnit() or ai.GetAttackedUnit()
		if u then
			u.FireEvent('비', true, 2.5, Global_tap.DefaultCarrot*(Fvar^Global_tap.AddCarrot)*rand(950, 1051)*0.001)
			u.StartGlobalEvent(65)
		end
		return
	end
	
	if event == -1 then -- init	
		local Fvar = enemy.field.GetFieldVar(2)
		enemy.SetStat(4, Global_tap.monster.spec.agi[Fvar])
		local data = Global_tap.monster.data[enemy.monsterID]
		if data then
			for i, v in ipairs(data.stat) do
				enemy.SetStat(v, data.var[i]*Global_tap.monster.spec.stat^Fvar)
			end
		end
		print(Fvar..' - 공 : '..enemy.GetStat(0), enemy.GetStat(2))
		print(enemy.GetStat(1), enemy.GetStat(3), enemy.GetStat(4))
		-- enemy.ShowAnimation(104)
	end
end


for _, v in ipairs(Global_tap.monster.id) do
	Server.SetMonsterAI(v, monsterAI)
end


Server.GetTopic('당근획득').Add(function(su)
	unit.AddItem(77, su)
end)