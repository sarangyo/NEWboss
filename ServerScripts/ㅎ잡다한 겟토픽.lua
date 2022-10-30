Server.GetTopic('카메라_시작').Add(function()
	if unit.GetVar(55) == 0 then
		unit.SetVar(55, 3)
	end
	
	unit.FireEvent('카메라_반응', unit.GetVar(55))
end)

Server.GetTopic("신규유저_폭죽").Add(function()
	Server.SendSay('<color=#00FFBF>'..unit.player.name..'님이 세계에 처음 등장하였습니다! '..textTT2[rand(1, #textTT2+1)]..'</color>')
	unit.ShowAnimation(32)
end)

Server.GetTopic("SendCenterLabel").Add(function(txt)
	unit.SendCenterLabel(txt)
end)

Server.GetTopic("변수").Add(function(num, num2)
	unit.SetVar(num, num2)
end)

Server.GetTopic("쫀쫀이발광").Add(function(x, y)
	unit.SpawnAt(x, y)
end)

Server.GetTopic("습격맵이동").Add(function()
	unit.SetVar(67, unit.x)
	unit.SetVar(68, unit.y)
	unit.SetVar(69, unit.field.dataID)
	unit.SetVar(124, unit.field.channelID)
	unit.SpawnAtFieldID(68, rand(2, 38)*32+16, rand(2, 38)*-32-16)
end)

Server.GetTopic("스토리스킵").Add(function()
	unit.SpawnAtFieldID(78, 250, -250)
end)

Server.GetTopic("플레이어_습격데이터요구").Add(function()
	unit.FireEvent('플레이어_습격데이터반응', 
		Utility.JSONSerialize(Global_player_party.lv), 
		Utility.JSONSerialize(Global_player_party.per))
end)

Server.GetTopic("큐브상점").Add(function()
	unit.StartGlobalEvent(46)
end)

Server.GetTopic("절전반응").Add(function()
	unit.FireEvent('절전반응')
end)














