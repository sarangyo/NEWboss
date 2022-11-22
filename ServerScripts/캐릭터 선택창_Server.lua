local ch = {}
ch.dataID = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16,} -- 캐릭터id
ch.lv = {0, 0, 0, 10, 25, 50, 100, 250, 400, 550, 800, 1200, 2000, 3000, 4000, 5000}
ch.job = {} -- 바꿀 직업(내 게임에는 필요없어서 빈테이블)
ch.field = {} -- 특정맵에서만 캐릭터 변경가능
ch.field[1] = true
ch.field[8] = true
ch.field[21] = true
ch.field[49] = true
ch.field[75] = true
ch.field[90] = true
ch.field[95] = true
ch.field[96] = true

local mapID, X, Y = 1, 14, 10 -- 캐릭터 선택이 끝나고 이동하고 싶은 맵과 이벤트상 X, Y좌표
Server.GetTopic('캐릭터_선택완료').Add(function(table01)
	local T = Utility.JSONParse(table01)
	
	local lev = T[1]
	if unit.level >= ch.lv[lev] then
		unit.job = 1
		unit.characterID = ch.dataID[lev]
		unit.FireEvent('선택창_종료')
		
		if T[2] and T[3] and T[4] then
			unit.SpawnAtFieldID(T[4], T[2], T[3])
		else
			unit.SpawnAtFieldID(mapID, X*32+16, Y*-32-16)
		end
		
		-- 여기서부터 내 게임에 적용될 것.
		if unit.GetVar(31)==1 then
			unit.FireEvent('ShowAlert', '너무나도 잘왔어요.\n뉴비지원 룬을 인벤토리에 지급해두었습니다.', false, '신규유저_폭죽')
			unit.SetVar(31, 2)
		end
		unit.RemoveAllSkills()
		unit.AddSkill(Global_skill_data2[lev][1], unit.GetVar(Global_skill_data2[lev][2]))
		unit.StartGlobalEvent(14)
		unit.RefreshStats()
		unit.SendUpdated()
	else
		unit.FireEvent('ch:ShowAlert', '자격이 부족합니다.')
	end
end)

Server.GetTopic('캐릭터_선택하기').Add(function()
	local id = unit.field.dataID
	local F = ch.field[id]
	local x, y = unit.x, unit.y
	if F then
		unit.SpawnAtFieldID(39, 8*32+16, 8*-32-16)
		local u = unit
		Server.RunLater(function()
			u.FireEvent('캐릭터선택창', x, y, id)
		end, 0.6)
	else
		unit.SendCenterLabel('보스 선택을 할 수 없는 장소입니다.')
	end
end)

Server.GetTopic('캐릭터선택창_나가기').Add(function(table01)
	local T = Utility.JSONParse(table01)
	unit.FireEvent('선택창_종료')
	if T[1] and T[2] and T[3] then
		unit.SpawnAtFieldID(T[3], T[1], T[2])
	else
		unit.SpawnAtFieldID(mapID, X*32+16, Y*-32-16)
	end
end)