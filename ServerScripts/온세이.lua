local admin = {}
admin['수니몬'] = true
admin['TEST_1'] = true
admin['감사해'] = true

local String = {}
String['/다이'] = function(unit)
	unit.AddDamage(unit.maxHP)
end
String['/죽기'] = String['/다이']
String['/죽음'] = String['/다이']
String['/dead'] = String['/다이']
String['/die'] = String['/다이']
String['/사망'] = String['/다이']
String['/자살'] = String['/다이']
String['/아파'] = String['/다이']
String['/ㄷ'] = String['/다이']
String['/d'] = String['/다이']
for i=1, 4 do
	String['/자동사냥 '..i] = function(unit)
		unit.SendCenterLabel("<size='17'><color=#F7BE81>자동사냥 슬롯을 "..i.."칸까지 사용합니다.</color></size>")
		unit.FireEvent('자동사냥슬롯', i)
		unit.SetVar(45, i)
	end
	String['/자동사냥'..i] = String['/자동사냥 '..i]
end

for i=1, 8 do
	String['/카메라 '..i] = function(unit)
		unit.SendCenterLabel("<size='17'><color=#F7BE81>"..i.."번 카메라 반응</color></size>")
		unit.FireEvent('카메라_반응', i)
		unit.SetVar(55, i)
	end
	String['/카메라'..i] = String['/카메라 '..i]
end

String['/user'] = function(unit)
	if admin[unit.player.name] then
		Operation(unit)
	end
end

local FindStr = {}
local Sub = string.sub
FindStr['/출두'] = function(unit, text)
	local t = Sub(text, 5, #text)
	if Nickname_data[t] then
		local rpUnit = Nickname_data[t]
		rpUnit.field.JoinUnit(unit, Point(rpUnit.x, rpUnit.y))

		if assi_bool then
			Server.SendSay('부관리자 '..unit.player.name..'님이 '.. rpUnit.player.name..' 님의 ['..rpUnit.field.name.. '] 맵으로 출두하였습니다.')
		end

	else
		unit.SendCenterLabel('접속중인 유저가 아닙니다.')
	end
end

FindStr['/소환'] = function(unit, text)
	local t = Sub(text, 5, #text)
	if Nickname_data[t] then
		unit.field.JoinUnit(Nickname_data[t], Point(unit.x, unit.y))

		if assi_bool then
			Server.SendSay('부관리자 '..unit.player.name..'님이 '.. Nickname_data[t].player.name..' 님을 ['..unit.field.name.. '] 으로 소환하였습니다.')
		end

	else
		unit.SendCenterLabel('접속중인 유저가 아닙니다.')
	end
end


local function onSay(unit, text)
	if String[text] then
		String[text](unit)	
	end
	
	if admin[unit.player.name] then
		for i, v in pairs(FindStr) do
			if string.find(text, i) then
				v(unit, text)
			end
		end
	end
end
Server.onSay.Add(onSay)

Server.GetTopic("자사가져와").Add(function()
	unit.FireEvent('자동사냥슬롯', unit.GetVar(45)==0 and 1 or unit.GetVar(45))
end)