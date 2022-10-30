Jjon = {}




function Jjon:main()
	local me = Client.myPlayerUnit
	
	local target = Client.field.FindNearUnit(me.x, me.y, 2000, 2, me)
	if target and target.valid and not target.dead then
		Client.FireEvent('쫀쫀이발광', target.x, target.y)
		if math.random(1, 10)==1 then
			me.UseSkill(13)
		else
			me.UseSkill(12)
		end
	else
		Client.FireEvent('SendCenterLabel', '<color=#FF0000>주변에 타겟이 없습니다.</color>')
	end
end