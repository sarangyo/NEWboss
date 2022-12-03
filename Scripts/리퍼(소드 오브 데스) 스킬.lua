Reaper = {}




function Reaper:main()
	local me = Client.myPlayerUnit
	
	local target = Client.field.FindNearUnit(me.x, me.y, 2000, 2, me)
	if target and target.valid and not target.dead then
		local point = Point(target.x, target.y)
		if rand(1, 100) <= 25 then
			me.UseSkillToPosition(37, nil, point)
		else
			me.UseSkillToPosition(36, nil, point)
		end
		
	else
		Client.FireEvent('SendCenterLabel', '<color=#FF0000>주변에 타겟이 없습니다.</color>')
	end
end

function Reaper:main2()
	local me = Client.myPlayerUnit
	
	local target = Client.field.FindNearUnit(me.x, me.y, 2000, 2, me)
	if target and target.valid and not target.dead then
		me.UseSkillToPosition(61, nil, Point(target.x, target.y))
	else
		Client.FireEvent('SendCenterLabel', '<color=#FF0000>주변에 타겟이 없습니다.</color>')
	end
end

function Reaper:main3()
	local me = Client.myPlayerUnit
	
	local target = Client.field.FindNearUnit(me.x+rand(-500, 500), me.y+rand(-500, 500), 3000, 2, me)
	if target and target.valid and not target.dead then
		me.UseSkillToPosition(84, nil, Point(target.x, target.y))
	else
		Client.FireEvent('SendCenterLabel', '<color=#FF0000>주변에 타겟이 없습니다.</color>')
	end
end