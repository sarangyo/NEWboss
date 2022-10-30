
local mon = Server.GetMonster
local txt = {}
txt[1] = {'살려주세요..', '제가 뭘 잘못했나요...', '때리지 마세요....', '무서워요..', '어떻게하면 저를 살려주시나요?', '죽고싶지 않아요...', '원하는거 다 드릴게요...', '엄마 보고싶다..', '하루만 더 주어진다면...', '착하게 살껄 그랬어요.'}
local function FirstAttack(enemy, ai, event, data)	
    if event == 0 then -- 2초업뎃
		local f = enemy.field
        if f.playerCount <=0 or ai.GetTargetUnit()==nil or 
			f.GetUnit(ai.GetTargetUnitID())==nil then
            ai.SetFollowTarget(false) --타겟이 사라졌으면 추적을 비활성화 
            ai.SetTargetUnit(nil)
            ai.SetNearTarget(0, 200)
			
			 if ai.GetTargetUnit() then 
                ai.SetFollowTarget(true) 
            end
        end
		
		if rand(1, 10001)==1234 then
			enemy.say(txt[1][rand(1, #txt[1]+1)])
		end
    end

    if event == 1 then -- 피격 시
        if ai.GetAttackedUnit() == nil then
            return
        else
			ai.SetTargetUnit(ai.GetAttackedUnit())
			ai.SetFollowTarget(true)
        end
    end
end
Server.SetMonsterAI(1, FirstAttack)





--[[
for i=0, 9999 do
	if mon(i) then
		
	else
		break
	end
end]]
