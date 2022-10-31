
Rain = {}

Rain.time = 1 -- 1초마다
Rain.count = 10 -- 10개씩 비가내려와, 즉 0.1초마다 1개겠죠?
Rain.path = 'Pictures/룬빈칸.png' -- 이미지 경로
Rain.objW = 32 -- 가로크기
Rain.objH = 32 -- 세로크기
local index = 0
local w, h = Client.width-200, 200
local T = 0
function Rain.Tick(t)
    local me = Client.myPlayerUnit

    Rain.cnt = Rain.cnt + t
    if Rain.cnt > T then
		T = T + Rain.time/Rain.count
		index = index+1
		local obj = Rain.image[index]
		obj.DOMove(Point(obj.x+Client.width, obj.y+Client.height), 1).OnComplete(function()
			--obj.DOMove(Point(w, h), 0)
		end)
		if index >= Rain.count then
			Rain.cnt = 0
			index = 0
			T = 0
		end
    end
end

function Rain:init()
    self.cnt = 0
	self.image = {}
	
	for i=1, self.count do
		self.image[i] = Image(self.path, Rect(w, h, 32, 32))
	end
end

Rain:init()
Client.RunLater(function()
	Client.onTick.Add(Rain.Tick)
end, 1)




























