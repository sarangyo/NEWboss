-- 몬스터 선제공격 AI스크립트

local function FirstAttack(enemy, ai, event, data)
    if (event == AI_UPDATE) then 
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000) 
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0,200)

            if ai.GetTargetUnit() ~= nil then 
                ai.SetFollowTarget(true) 
            end
        end

        if ai.GetTargetUnit() == nil then
            return
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
end

local T = {5, 10, 15, 22, 28, 34, 40, 45}
--[[
local mon = Server.GetMonster

for i=1, 500 do
	if mon(i) then
		if string.find(mon(i).name, '악당') then
			table.insert(T, i)
		end
	else
		break
	end
end]]

for _, v in ipairs(T) do
	Server.SetMonsterAI(v, FirstAttack)
end

Server.SetMonsterAI(50, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000)
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 800)

            if ai.GetTargetUnit() ~= nil then
                ai.SetFollowTarget(true)
            end
        end

        if ai.GetTargetUnit() == nil then
            return
		else
			if rand(1, 100) <= 10 then
				ai.UseSkill(24)
			end
        end
    end

    if (event == AI_ATTACKED) then
		-- print(enemy.hp)
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




Server.SetMonsterAI(55, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000)
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 800)

            if ai.GetTargetUnit() ~= nil then
                ai.SetFollowTarget(true)
            end
        end

        if ai.GetTargetUnit() == nil then
            return
		else
			if rand(1, 100) <= 15 then
				ai.UseSkill(25)
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




Server.SetMonsterAI(60, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000)
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 800)

            if ai.GetTargetUnit() ~= nil then
                ai.SetFollowTarget(true)
            end
        end

        if ai.GetTargetUnit() == nil then
            return
		else
			local Ran = rand(1, 101)
			if Ran <= 16 then
				ai.UseSkill(30)
			elseif Ran <= 48 then
				ai.UseSkill(29)
			else
				if rand(1, 5) == 1 then
					ai.UseSkill(32)
				else
					ai.UseSkill(33)
				end
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




Server.SetMonsterAI(92, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000)
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 800)

            if ai.GetTargetUnit() ~= nil then
                ai.SetFollowTarget(true)
            end
        end

        if ai.GetTargetUnit() == nil then
            return
		else
			if rand(1, 4) == 1 then
				ai.UseSkill(47)
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



Server.SetMonsterAI(97, function(enemy, ai, event, data)
    if (event == AI_UPDATE) then
        if (enemy.field.playerCount <=0) then
            ai.SetTargetUnit(nil)

        elseif (ai.GetTargetUnit()==nil)
               or (enemy.field.GetUnit(ai.GetTargetUnitID())==nil)
               or (math.abs(enemy.x-enemy.field.GetUnit(ai.GetTargetUnitID()).x) >= 2000)
               or (math.abs(enemy.y-enemy.field.GetUnit(ai.GetTargetUnitID()).y) >= 2000) then

            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 800)

            if ai.GetTargetUnit() ~= nil then
                ai.SetFollowTarget(true)
            end
        end

        if ai.GetTargetUnit() == nil then
            return
		else
			local AI = ai
			for i=1, 4 do
				Server.RunLater(function() 
					if enemy and AI then
						AI.UseSkill(52)
					end
				end, 0.4*i)
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

Server.SetMonsterAI(107, function(enemy, ai, event, data)
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
		
		if enemy.maxHP*0.2 >= enemy.hp and not enemy.HasBuff(1) then
			enemy.AddBuff(1)
			enemy.AddHP(enemy.maxHP*0.015)
			ai.UseSkill(56)
			if rand(1, 3)==1 then
				ai.UseSkill(54)
				--b.MakeSturn(1)
			end
		end
		
		if rand(1, 6)==1 then
			enemy.field.SpawnEnemy(109, enemy.x, enemy.y)
		end
		
		if rand(1, 3)==1 then
			ai.UseSkill(55)
			if rand(1, 3)==1 then
				local AI = ai
				Server.RunLater(function()
					AI.UseSkill(55)
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

























