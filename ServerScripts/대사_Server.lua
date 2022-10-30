--[[=========================================================================]]
--[[=========================================================================]]
--[[=========================================================================]]
--[[=========================================================================]]
--[[=========================================================================]]
--[[=========================================================================]]

--[[
Server.GetTopic("Desa_End").Add(function(num, tx3)
	unit.RefreshStats()
	unit.SendUpdated()
end)
]]
local one_tx2 = Utility.JSONSerialize{'자동사냥', '스텟', '스킬', '환생', '드랍 아이템', '뭐하는 게임인가?', '명령어', '취소'}
local two_tx2 = Utility.JSONSerialize{'쥐돌이', '웅치킨', '구울', '오크 장군', '천하대장군', '우주인', '베늠', '사원지킴이', '뒤로가기'}
Server.GetTopic('뭐').Add(function()
	local tx1 = '궁금한거 있어요? 차근차근 자세히 알려줄게요.'

	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End1뭐').Add(function()
	local tx1 = 
[[자동사냥이 잘안되죠? 보스께서 몸집이 크셔서 움직이는게 쉽지 않으십니다.
그렇다면 100레벨부터 함께 할 수 있는 알록달록 쫀쫀이를 하시는게 좋습니다.]]
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End2뭐').Add(function()
	local tx1 = 
[[스텟 중 공격력과 방어력은 아시죠? 
이 외에 민첩, 경험치(%), 체력 회복, 마나 회복 스텟이 있습니다.
민첩 스텟은 이동속도를 증가시켜줍니다. 경험치(%)는 몬스터 사냥시 추가 경험치를 얻습니다.
체력, 마나 회복은 4초마다 해당 수치만큼 상승합니다.]]
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End3뭐').Add(function()
	local tx1 = 
[[스킬은 보스마다 다르며, 영구적으로 얻을 수 있는 스킬도 많습니다.
스킬의 대다수는 당근상점에서 구할 수 있으며, 
악당에게서만 구할 수 있는 희귀한 스킬도 있습니다.]]
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End4뭐').Add(function()
	local tx1 = 
[[레벨이 1000 이상이 되면 환생하실 수 있습니다. 환생아이템과 환생강화석을 지급 받습니다.
아래는 레벨에 따른 환생강화석 지급 개수입니다.

1000Lv : 1,  1500Lv : 2,  2000Lv : 3,  2500Lv : 4,  3000Lv : 5,  3500Lv : 6
4000Lv : 7,  4500Lv : 9,  5000Lv :11, 5500Lv :13, 6000Lv :15, 6500Lv :18
7000Lv :21, 7500Lv :23, 8000Lv :27, 8500Lv :34, 9000Lv :39, 9500Lv :46
10000Lv :54]]
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End5뭐').Add(function()
	local tx1 = 
[[필드에 등장하는 무시무시한 악당들입니다.]]
	
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End6뭐').Add(function()
	local tx1 = 
[[지금은 사냥을 해서 무작정 강해지는 것 밖에 없습니다. 콘텐츠를 추가해 나가겠습니다.]]
	
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End7뭐').Add(function()
	local tx1 = 
[[즉시 사망 : /다이 or /죽기 or /죽음 or /dead or /die
자동사냥 슬롯 : /자동사냥 1 or /자동사냥 2 or /자동사냥 3 or /자동사냥 4
카메라 : /카메라 1 or /카메라 2 or /카메라 3 or /카메라 4 or /카메라 5]]
	
	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)
Server.GetTopic('Desa_End1악당').Add(function()
	local num = 5
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 쥐돌이\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End2악당').Add(function()
	local num = 10
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 웅치킨\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End3악당').Add(function()
	local num = 15
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 구울\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End4악당').Add(function()
	local num = 22
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 오크 장군\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End5악당').Add(function()
	local num = 28
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 천하대장군\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End6악당').Add(function()
	local num = 34
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 우주인\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End7악당').Add(function()
	local num = 40
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 베늠\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End8악당').Add(function()
	local num = 45
	local Q = Server.GetMonster(num)
	local tx1 = '이름 : 사원지킴이\n체력 : '..Q.maxHP..
	'\n공격력 : '..Q.attack..'\n방어력 : '..Q.defense..'\n드랍아이템 : <size=14>'
	for _, v in ipairs(Q.dropItems) do
		tx1 = tx1..Server.GetItem(v.itemDataID).name..', '
	end
	tx1 = tx1..'</size>'
	unit.FireEvent("Send_Desa", tx1, two_tx2, '악당')
end)
Server.GetTopic('Desa_End8악당').Add(function()
	local tx1 = '궁금한거 있어요? 차근차근 자세히 알려줄게요.'

	unit.FireEvent("Send_Desa", tx1, one_tx2, '뭐')
end)






















