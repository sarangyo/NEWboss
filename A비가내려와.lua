--[[
	제작 : 사랑요
	마음대로 사용하시고 마음껏 수정하세요.
	
	☑ 사용법
	서버스크립트에 unit.FireEvent('비', true) 를 입력하시면 됩니다.
	끄는건 unit.FireEvent('비', false)
	
	이미지가 뒤로가는게 이쁜 모습이기에 먼저 실행되도록 파일이름에 A를 붙혀주시면 져아윤
]]


local Rain = {}

Rain.time = 5 -- 3초마다(떨어지는 속도 조절됨)
Rain.count = 400 -- 30개씩 비가내려와, 즉 0.1초마다 1개겠죠?
Rain.path = 'Icons/9사나운토끼.png' -- 이미지 경로
Rain.objW = 32 -- 가로크기
Rain.objH = 32 -- 세로크기

local ew, eh = 100, 100 -- 화면 어디 지점에서 떨어질건지(랜덤값) x, y
local fw, fh = 150, Client.height+100 -- 어디 까지 떨어질건지(고정값) x, y
--[[ 여기까지 터치 ]]
--[[	]]
--[[	]]
--[[ 아래는 노터치 ]]
local index = 0
local T = 0
local i = 0
function Rain.Tick(t)
    local me = Client.myPlayerUnit

    Rain.cnt = Rain.cnt + t
    if Rain.cnt > T then
		T = T + Rain.time/Rain.count
		index = index+1
		local obj = Rain.image[index]
		obj.DOMove(Point(obj.x+fw, obj.y+fh), Rain.time*0.5).OnComplete(function() 
			obj.DOMove(Point(rand(-ew, Client.width+ew), -Rain.objH), 0)
		end)
		
		if index >= Rain.count then
			Rain.cnt = 0
			index = 0
			T = 0
		end
    end
end

function Rain:start()
    self.cnt = 0
	self.image = {}
	for i=1, self.count do
		self.image[i] = Image(self.path, Rect(rand(-ew, Client.width+ew), -self.objH, self.objW, self.objH))
		-- self.image[i].showOnTop = true
	end
	Client.onTick.Add(Rain.Tick)
end

function Rain:remove()
	for i=1, self.count do
		self.image[i].visible = false
	end
	Client.onTick.Remove(Rain.Tick)
end

Client.GetTopic('비').Add(function(bool)
	if bool then
		if not Rain.image or not Rain.image[1].visible then
			Rain:start()
		end
	else
		Rain:remove()
	end
end)









