local function MyReward(a, b, hp)
	local id = b.monsterID
	local M, stat = b.monsterData, a.GetStat
	a.AddEXP(M.dropEXP*stat(5)*0.01)
	a.AddGameMoney(M.dropMinGameMoney*stat(104)*0.01)
end
Server.rewardCallback = MyReward