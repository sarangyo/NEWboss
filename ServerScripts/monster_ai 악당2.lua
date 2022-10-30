

Server.SetMonsterAI(109, function(enemy, ai, event, data)
--[[
    if event == 0 then 
        
    end
	
    if event == 1 then -- 피격 시
		
    end]]
	
	if event == 2 then -- 사망 시
		local u = ai.GetAttackedUnit()
		if u then
			u.AddBuff(2)
			u.AddDamage(u.maxHP*0.05)
			u.SendSay('<color=#FA5882>[#] 독이 온몸에 퍼집니다.</color>')
		end
	end
end)

Server.SetMonsterAI(110, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then 
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
		end
    end

    if (event == AI_ATTACKED) then
        if ai.GetTargetUnit() then
			ai.GetTargetUnit().FireEvent("bh", enemy.hp, enemy.monsterID)
        else
            if ai.GetTargetUnit() ~= ai.GetAttackedUnit() then
                ai.SetTargetUnit(ai.GetAttackedUnit())
                ai.SetFollowTarget(true)
				ai.GetTargetUnit().FireEvent("bh", enemy.hp, enemy.monsterID)
            end
        end
    end
end)

























