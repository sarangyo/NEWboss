
-- 채널 시작
local cw, ch = Client.width, Client.height
local ch_but = Button("", Rect(cw-110, 55, 50, 50)) -- 버튼을 생성함.
ch_but.color = Color(80, 80, 80, 160)

local ch_img = Image('Pictures/채널.png', Rect(0, 0, ch_but.width, ch_but.height)) -- 버튼에 띄울 이미지를 불러옴.
ch_but.AddChild(ch_img)

ch_but.onClick.Add(function()
	Client.FireEvent('채널변경시도')
end)

local ch_text = Text('', Rect(cw-272, 30, 60, 30))
ch_text.textSize = 15
ch_text.textAlign = 5
ch_text.color = Color(240, 209, 74)
ch_text.borderEnabled = true
-- ch_text.borderColor = Color(0, 0, 0)
ch_text.borderDistance = Point(1, 1)

local function channel_text(num)
	ch_text.text = num..' 채널'
end

local ch_data = {}
ch_data.maxch = 100
function ch_data:main()
	self.mani_panel = Image('Pictures/캐릭터 선택창/ShowAlert_back.png', Rect(0, 0, 450, 450))
	self.mani_panel.pivotX = 0.5
	self.mani_panel.pivotY = 0.5
	self.mani_panel.anchor = 4
	self.mani_panel.showOnTop = true
	self.mani_panel.visible = false
	local hide = Color(0, 0, 0, 0)
	
	local chTxt = Text('<color=#FFBF00>채널 변경</color>', Rect(0, 0, 450, 60))
	chTxt.textAlign = 4
	chTxt.textSize = 24
	self.mani_panel.AddChild(chTxt)
	
	self.map_name = Text('<color=#E6E6E6>맵 이름</color>', Rect(0, 45, 450, 40))
	self.map_name.textSize = 20
	self.map_name.textAlign = 4
	self.mani_panel.AddChild(self.map_name)
	
	local close_but = Button('<color=#D8D8D8>✖</color>', Rect(0, 0, 60, 60))
	close_but.textSize = 30
	close_but.pivotX = 1
	close_but.anchor = 2
	close_but.color = hide
	self.mani_panel.AddChild(close_but)
	close_but.onClick.Add(function()
		Client.myPlayerUnit.PlaySE('시스템소리/빡.ogg', 0.8)
		self.mani_panel.visible = false
		self.txt[self.down_lv].text = '  CH. '..self.down_lv
	end)
	
	self.func_panel = Panel(Rect(0, 0, 420, 345))
	self.func_panel.color = Color(56, 56, 56)
	
	local scroll_panel = ScrollPanel(Rect(0, 85, 420, 345))
	scroll_panel.pivotX = 0.5
	scroll_panel.anchor = 1
	scroll_panel.horizontal = false
	scroll_panel.content = self.func_panel
	scroll_panel.color = Color(43, 43, 43)
	self.mani_panel.AddChild(scroll_panel)
	
	
	local but = {}
	self.but_img, self.txt, self.img = {}, {}, {}
	for i=1, self.maxch do
		local x = 12+200*((i%2==0 and 2 or i%2)-1)
		local y = 14+46*(math.ceil(i/2)-1)
		self.but_img[i] = Image('Pictures/캐릭터 선택창/Button.png', Rect(x, y, 193, 40))
		self.func_panel.AddChild(self.but_img[i])
		
		self.txt[i] = Text('  CH. '..i, Rect(0, 0, self.but_img[i].width, self.but_img[i].height))
		self.txt[i].textSize = 16
		self.txt[i].textAlign = 3
		self.but_img[i].AddChild(self.txt[i])
		
		self.img[i] = Image('Pictures/채널변경/접속중0.png', Rect(65, 0, 120, 40))
		self.but_img[i].AddChild(self.img[i])
		
		but[i] = Button('', Rect(0, 0, self.but_img[i].width, self.but_img[i].height))
		but[i].textSize = 16
		but[i].textAlign = 3
		but[i].color = hide
		self.but_img[i].AddChild(but[i])
		
		but[i].onClick.Add(function()
			local me = Client.myPlayerUnit
			me.PlaySE('시스템소리/빡.ogg', 0.8)
			Client.FireEvent('채널선택완료', i, me.x, me.y, self.dataID)
			self.mani_panel.visible = false
			self.txt[self.down_lv].text = '  CH. '..self.down_lv
		end)
	end
end
ch_data:main()

Client.GetTopic('채널변경UI요구').Add(function(id, Table, dataID, name)
	if not Client.myPlayerUnit.dead then
		ch_data.map_name.text = '<color=#E6E6E6>'..name..'</color>'
		local T = Utility.JSONParse(Table)
		ch_data.dataID = dataID
		ch_data.down_lv = id
		ch_data.mani_panel.visible = true
		local var = 14+46*math.ceil(#T/2)
		ch_data.func_panel.height = var > 345 and var or 345
		ch_data.txt[id].text = '  <color=#FFFF00><size=18>CH. '..id..'</size></color>'
		for i=1, ch_data.maxch do
			ch_data.but_img[i].visible = false
		end
		for i, v in ipairs(T) do
			ch_data.img[i].image = 'Pictures/채널변경/접속중'..v..'.png'
			ch_data.but_img[i].visible = true
		end
	end
end)

Client.GetTopic('채널변경').Add(function(num, id)
	channel_text(num)
	if ch_data.mani_panel and ch_data.mani_panel.visible then
		ch_data.mani_panel.visible = false
		ch_data.txt[id].text = '  CH. '..id
	end
end)

Client.GetTopic('채널창종료').Add(function(id)
	if ch_data.mani_panel and ch_data.mani_panel.visible then
		ch_data.mani_panel.visible = false
		ch_data.txt[id].text = '  CH. '..id
	end
end)



-- 여기까지 채널
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- 여기서부터 미니맵

local map_but = Button("", Rect(cw-165, 55, 50, 50)) -- 버튼을 생성함.
map_but.color = Color(80, 80, 80, 160)

local map_img = Image('Pictures/미니맵.png', Rect(0, 0, map_but.width, map_but.height)) -- 버튼에 띄울 이미지를 불러옴.
map_but.AddChild(map_img)

Client.RunLater(function()
	local minimap = Minimap(Rect(map_but.x, map_but.y+55, 0, 0))
	minimap.pivotX = 0.6
	minimap.showOnTop = true
	minimap.mapFittable = false
	-- minimap.mapOpacity = 200
	minimap.backgroundColor = Color(0, 0, 0, 100)
	
	map_but.onClick.Add(function()
		if minimap.width == 0 then
			minimap.width = 350
			minimap.height = 350
		else
			minimap.width = 0
			minimap.height = 0
		end
	end)
end, 0.5)


-- 여기까지 미니맵
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
-- 메뉴시작
local data = {}
local Frame = Client.targetFrameRate
function data:main()
	self.dark_panel = Panel(Rect(0, 0, cw, ch))
	self.dark_panel.color = Color(0, 0, 0, 255)
	self.dark_panel.showOnTop = true
	self.dark_panel.visible = false

	self.dark_but = Button("<color=#A4A4A4>TOUCH</color>", Rect(cw/2-40, ch/2-40, 80, 80))
	self.dark_but.color = Color(100, 100, 100, 200)
	self.dark_but.textSize = 20

	self.dark_panel.AddChild(self.dark_but)

	self.dark_but.onClick.Add(function()
		Client.targetFrameRate = Frame
		self.dark_panel.visible = false
	end)
end

Client.GetTopic('절전반응').Add(function(id)
	if data.dark_panel then
		Client.targetFrameRate = Frame - 20
		data.dark_panel.visible = true
	else
		print('[#] 절전모드 실행에 실패하였습니다.')
	end
end)

Client.RunLater(function()
	data:main()
end, 2)

local function frame(panel, path, title, singal, num, x, y)
	local but = Button("", Rect(x, y, 50, 50)) -- 버튼을 생성함.
	but.color = Color(255, 255, 255, 110)
	panel.AddChild(but)

	local img = Image(path, Rect(0, 0, 50, 50)) -- 버튼에 띄울 이미지를 불러옴.
	img.SetOpacity(200) -- 이미지의 투명도 조절
	but.AddChild(img)
	
	local txt = Text(title, Rect(0, but.width+5, 50, 20))
	txt.textSize = 13
	txt.textAlign = 4
	but.AddChild(txt)

	but.onClick.Add(function()
		Client.FireEvent(singal, num)
	end)
end
local Garo, Sero = 255, 328

local love_menu = Button("", Rect(cw-55, 55, 50, 50)) -- 버튼을 생성함.
love_menu.color = Color(100, 100, 100, 100)

local love_img = Image("Pictures/설정.png", Rect(0, 0, love_menu.width, love_menu.height)) -- 버튼에 띄울 이미지를 불러옴.
love_menu.AddChild(love_img) 

local Menu_Panel = Panel(Rect(love_menu.x+love_menu.width-Garo, love_menu.y+love_menu.height+5, Garo, Sero))
Menu_Panel.color = Color(0, 0, 0, 170)
Menu_Panel.showOnTop = true
Menu_Panel.visible = false

local Menu_Panel2 = Panel(Rect(0, 0, Garo, 42))
Menu_Panel2.color = Color(87, 87, 87, 150)
Menu_Panel.AddChild(Menu_Panel2)

local Menu_PanelText = Text('Menu', Rect(16, 0, Garo, 42))
Menu_PanelText.textSize = 26
Menu_Panel2.AddChild(Menu_PanelText)

frame(Menu_Panel, 'Icons/보석상 지선뀨/012.png', '룬', '룬메인', nil, 10, 52)
frame(Menu_Panel, 'Icons/9사나운토끼.png', '당근상점', '정수상점_data', 2, 71, 52)
frame(Menu_Panel, 'Icons/잡템류/Item_0694.png', '판매상점', 'selling', nil, 132, 52)
frame(Menu_Panel, 'Pictures/절전.png', '절전', '절전반응', nil, 193, 52)
frame(Menu_Panel, 'Pictures/큐브.png', '큐브상점', '공용이벤트', 46, 10, 135)
frame(Menu_Panel, 'Icons/잡템류/Item_0115.png', '음식도감', 'SKIN__', nil, 71, 135)
frame(Menu_Panel, 'Pictures/캐릭터 선택창/보스얼굴01.png', '보스선택', '캐릭터_선택하기', nil, 132, 135)
--frame(Menu_Panel, 'Icons/9감자괴물.png', '거래소', '거래소_open', nil, 193, 135)
--frame(Menu_Panel, 'Icons/9감자괴물.png', '소포함', '소포함_open', nil, 10, 218)

local CloseButton = Button("✖", Rect(Garo-42, 0, 42, 42))
CloseButton.textSize = 26
CloseButton.textAlign = 4
CloseButton.color = Color(87, 87, 87, 255)
Menu_Panel2.AddChild(CloseButton)
CloseButton.onClick.Add(function()	
	Menu_Panel.visible = false
end)

love_menu.onClick.Add(function()
	Menu_Panel.visible = not Menu_Panel.visible
end)

Client.GetTopic("메뉴버튼숨기기").Add(function(bool)
	love_menu.visible = bool
	map_but.visible = bool
	ch_but.visible = bool
end)










