local EngTable = {}
EngTable.A = {count=5, id=22}
EngTable.B = {count=7, id=28}
EngTable.C = {count=9, id=34}
EngTable.D = {count=12, id=40}
EngTable.E = {count=21, id=50}
EngTable.F = {count=37, id=55}
EngTable.G = {count=88, id=60}
EngTable.H = {count=121, id=92}
EngTable.I = {count=206, id=97}
EngTable.J = {count=1111, id=107}

local String = {}
for Eng, v in pairs(EngTable) do
	for i=1, 5 do
		String['/소환 '..Eng..' '..i] = function(unit)
			local c = unit.CountItem(419)
			if unit.field.dataID==80 then
				if v.count*i <= c then
					for _, v in pairs(unit.field.units) do
						if v.type==2 then
							unit.SendCenterLabel('아직 처치 못한 악당이 남아있습니다.')
							return false
						end
					end
					unit.RemoveItem(419, v.count*i)
					for j=1, i do						
						unit.field.SpawnEnemy(v.id, rand(19, 26)*32+16, rand(29, 36)*-32-16)
					end
					return false
				else
					unit.SendCenterLabel('악당소환권이 부족합니다.')
				end
				return false
			else
				unit.SendCenterLabel('악당소환장이 아닙니다.')
			end
		end
	end
end

local txt1 = {
	'저 지금 감옥인데',
	'너무 심심해요',
	'절대 사고치지 마세요',
	'수니몬님 감사합니다',
	'우리유저님들 고맙습니다'
}
Server.sayCallback = function(player, text, sayType)
	local unit = player.unit
	
	if String[text] then
		String[text](unit)
	elseif unit.field.dataID == 99 then
		if unit.GetVar(154)==1 then
			local u = unit.field.GetEventUnitByName('수니몬')
			u.say('<size=16>아쉽지만 감옥에서는 채팅을 할 수 없어.</size>')
			return false
		end
		
		if unit.GetVar(153)==0 then
			for _, v in ipairs(txt1) do
				if text~=v then
					local u = unit.field.GetEventUnitByName('수니몬')
					u.say('<size=18>나를 따라해줬으면 좋겠어ㅜ</size>')
					return false
				end
			end
		end
	end
	return true
end