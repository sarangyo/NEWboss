Client.RunLater(function()
	print('[#] 안녕하세요. 잘왔어요.')
end, 1)


local camera = {200, 220, 240, 260, 280, 300, 320, 340}


Client.FireEvent("변수", 25, 0)
Client.FireEvent("카메라_시작")
Client.FireEvent("플레이어_습격데이터요구")

Client.GetTopic('카메라_반응').Add(function(num)
	if num and camera[num] then
		Camera.orthographicSize = camera[num]
	else
		Camera.orthographicSize = camera[3]
	end
end)

-- Client.GetStrings().custom6 = '<color=#FFFF00>골드</color>'
Client.GetStrings().custom24 = '<color=#FFFFFF>남은 강화 횟수</color>'


local Find = string.find
local Sub = string.sub
function remove_color(txt)
	local txt2, num = txt:gsub('</color>', '')
	if num > 0 then -- 색이 있음
		for i=1, num do
			local first, last = Find(txt2, '<color=#')
			
			local txt3 = Sub(txt2, 1, first-1)
			txt2 = txt3..Sub(txt2, last+8, #txt2)
		end
	end
	
	return txt2
end

-- Client.myPlayerUnit






















