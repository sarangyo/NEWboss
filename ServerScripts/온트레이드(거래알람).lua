local function OnTradeDone(a, b, senderItems, receiverItems)
	a.unit.SendSay('<color=#00FF00>[#] '..b.name..'님과 성공적으로 거래를 마쳤습니다.</color>')
	b.unit.SendSay('<color=#00FF00>[#] '..a.name..'님과 성공적으로 거래를 마쳤습니다.</color>')
end

-- 이벤트에 등록
Server.onTradeDone.Add(OnTradeDone)