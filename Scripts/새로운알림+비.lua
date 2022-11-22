--local black_panel = nil
local function ShowAlert(txt, switch, signal)
	local black_panel = Panel(Rect(0, 0, Client.width, Client.height))
	black_panel.color = Color(0, 0, 0, 100)
	black_panel.showOnTop = true
	
	local pal2 = Image('Pictures/forge/xk.png', Rect(0, 0, 236, 124))
	pal2.pivotX = 0.5
	pal2.pivotY = 0.5
	pal2.anchor = 4
	-- pal2.color = Color(43, 43, 43)
	black_panel.AddChild(pal2)
	
	local text = Text('\n<color=#000000>'..remove_color(txt)..'</color>', Rect(2, 6, 238, 133))
	text.textSize = 14
	text.textAlign = 1
	pal2.AddChild(text)
	
	local text2 = Text('\n<color=#E6E6E6>'..txt..'</color>', Rect(0, 4, 238, 133))
	text2.textSize = 14
	text2.textAlign = 1
	pal2.AddChild(text2)
	
	local pal3 = Image('Pictures/forge/Button.png', Rect(0, 83, 84, 34))
	pal3.anchor = 1
	pal3.pivotX = 0.5
	pal2.AddChild(pal3)
	
	local but = Button('<color=#FACC2E>확 인</color>', Rect(0, 0, 84, 34))
	but.color = Color(0, 0, 0, 0)
	but.textAlign = 4
	pal3.AddChild(but)
	
	if switch then
		local pal4 = Image('Pictures/forge/Button.png', Rect(55, 83, 84, 34))
		pal4.anchor = 1
		pal4.pivotX = 0.5
		pal2.AddChild(pal4)
		
		local but2 = Button('<color=#FACC2E>확 인</color>', Rect(0, 0, 84, 34))
		but2.color = Color(0, 0, 0, 0)
		but2.textAlign = 4
		pal4.AddChild(but2)
		
		pal3.rect = Rect(-55, 83, 84, 34)
		
		but.text = '<color=#FACC2E>취 소</color>'
		
		but2.onClick.Add(function()
			-- print(555)
		end)
	end
	
	but.onClick.Add(function()
		black_panel.Destroy()
		Client.FireEvent(signal)
	end)
end

Client.GetTopic('ShowAlert').Add(function(txt, switch, signal)
	ShowAlert(txt, switch, signal)
end)

local txt1 = Text('', Rect(0, 100, 400, 400))
txt1.anchor = 4
txt1.pivotX = 0.5
txt1.pivotY = 0.5
txt1.textSize = 26
txt1.textAlign= 4
txt1.borderEnabled = true
txt1.visible = false
Client.GetTopic('새로운알림').Add(function(txt)
	txt1.text = txt
	txt1.visible = true
	txt1.DOMove(Point(txt1.x, txt1.y-40), 1.5)
	Client.RunLater(function() 
		txt1.visible = false
		txt1.DOMove(Point(0, 100), 0)
	end, 1.5)
end)

local txt2 = Text('', Rect(0, 100, 400, 400))
txt2.anchor = 4
txt2.pivotX = 0.5
txt2.pivotY = 0.5
txt2.textSize = 26
txt2.textAlign= 4
txt2.borderEnabled = true
txt2.visible = false
Client.GetTopic('새로운알림2').Add(function(txt)
	txt2.text = txt
	txt2.visible = true
	txt2.DOMove(Point(txt2.x, txt2.y-40), 2.5)
	Client.RunLater(function() 
		txt2.visible = false
		txt2.DOMove(Point(0, 100), 0)
	end, 3)
end)

local txt3 = Text('', Rect(0, 100, 400, 400))
txt3.anchor = 4
txt3.pivotX = 0.5
txt3.pivotY = 0.5
txt3.textSize = 26
txt3.textAlign= 4
txt3.borderEnabled = true
txt3.visible = false
local function NewAlert3(txt)
	txt3.text = txt
	if txt3.visible == false then
		txt3.visible = true
		txt3.DOMove(Point(txt3.x, txt3.y-40), 2.5).OnComplete(function()
			Client.RunLater(function()
				txt3.visible = false
				txt3.DOMove(Point(0, 100), 0)
			end, 1)
		end)
	end	
end

Client.GetTopic('ShowYesNoAlert').Add(function(txt, signal)
	Client.ShowYesNoAlert(txt, function(a)
		if a==1 then
			Client.FireEvent(signal)
		end
	end)
end)



--[[
	제작 : 사랑요
	마음대로 사용하시고 마음껏 수정하세요.
	
	☑ 사용법
	서버스크립트에 unit.FireEvent('비', true) 를 입력하시면 됩니다.
	끄는건 unit.FireEvent('비', false)
	
	이미지가 뒤로가는게 이쁜 모습이기에 먼저 실행되도록 파일이름에 A를 붙혀주시면 져아윤
]]


local Rain = {}

Rain.time = 2.5 -- 3초마다(떨어지는 속도 조절됨)
Rain.count = 200 -- 30개씩 비가내려와, 즉 0.1초마다 1개겠죠?
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
local carrot = 0
local Time = 0
function Rain.Tick(t)
    local me = Client.myPlayerUnit

    Rain.cnt = Rain.cnt + t
    if Rain.cnt > T then
		T = T + Rain.time/Rain.count
		index = index+1
		local obj = Rain.image[index]
		
		if Time~=0 then
			me.PlaySE('당근떨어지는소리/Gravel ('..math.random(1, 10)..').ogg')
			NewAlert3('당근 + '..math.floor(carrot/Time*Rain.cnt))
		end
		
		obj.DOMove(Point(obj.x+fw, obj.y+fh), Rain.time*0.5).OnComplete(function() 
			obj.DOMove(Point(rand(-ew, Client.width+ew), -Rain.objH), 0)
			math.randomseed(os.time()+rand(1, 10000))
		end)
		
		if index >= Rain.count then
			Rain.cnt = 0
			index = 0
			T = 0
		end
    end
end

local tickbool = false
local function tickcheck(bool)
	if bool==true and tickbool==false then
		Client.onTick.Add(Rain.Tick)
		tickbool = true
	elseif bool==false and tickbool==true then
		Client.onTick.Remove(Rain.Tick)
		tickbool = false
	end
end

local i = 0
function Rain:start()
    self.cnt = 0
	self.image = {}
	for i=1, self.count do
		self.image[i] = Image(self.path, Rect(rand(-ew, Client.width+ew), -self.objH, self.objW, self.objH))
		self.image[i].visible = false
		-- self.image[i].showOnTop = true
	end
end
Rain:start()

function Rain:start2()
    self.cnt = 0
	T = 0
	for i=1, self.count do
		self.image[i].visible = true
	end
	tickcheck(true)
end


function Rain:remove()
	for i=1, self.count do
		self.image[i].visible = false
	end
	
	tickcheck(false)
	index = 0
	T = 0
	carrot = 0
	Time = 0
end

Client.GetTopic('비').Add(function(bool, t, su)
	if t and su and bool==true then
		if Rain.image[1].visible==false then
			Time = t
			carrot = su
			Rain:start2()
			Client.RunLater(function()
				NewAlert3('당근 + '..math.floor(carrot))
				Rain:remove()
				Time = 0
				carrot = 0
				Client.FireEvent('당근획득', su)
			end, t)
		end
	elseif bool==true then
		if Rain.image[1].visible==false then
			Rain:start2()
		end
	else
		Rain:remove()
	end
end)









