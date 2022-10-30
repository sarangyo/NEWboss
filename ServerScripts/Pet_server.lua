pet_buff = {}
-- 1번 당근도둑

function pet_buff:Spawn()
	unit.SpawnPet(1, unit.x, unit.y, 21, 1, nil)
	unit.CancelPetSummon()
end

local function PetAI(pet, ai, event)
	local lv = ai.GetMasterUnit().GetSkillLevel(19)
	local num = lv*50
	for i=1, 15+lv do
		ai.AcquireNearDropItem(950+num)
	end
end
Server.SetPetAI(21, PetAI)