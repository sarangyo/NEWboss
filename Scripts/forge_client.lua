local main_data = {}

local stat_name = {}
local item = nil -- 테이블 정보로 이용
local forge = nil -- 테이블 정보로 이용
local width, height = 320, 430

local black_color = Color(0, 0, 0)
local hide = Color(0, 0, 0, 0)
local function panel_side(p01, p02, but)
	p01.color = black_color
	
	p02.rect = Rect(2, 2, p01.width-4, p01.height-4)
	p01.AddChild(p02)
	
	but.rect = Rect(0, 0, p02.width, p02.height)
	but.color = hide
	p02.AddChild(but)
end

function main_data:ShowAlert(txt)
	self.black_panel = Panel(Rect(0, 0, Client.width, Client.height))
	self.black_panel.color = Color(0, 0, 0, 100)
	self.black_panel.showOnTop = true
	
	local pal = Panel(Rect(0, 0, 240, 135))
	pal.pivotX = 0.5
	pal.pivotY = 0.5
	pal.anchor = 4
	pal.color = Color(0, 0, 0)
	self.black_panel.AddChild(pal)
	
	local pal2 = Image('Pictures/forge/xk.png', Rect(0, 0, 236, 131))
	pal2.pivotX = 0.5
	pal2.pivotY = 0.5
	pal2.anchor = 4
	-- pal2.color = Color(43, 43, 43)
	pal.AddChild(pal2)
	
	local text = Text('\n\n'..txt, Rect(0, 0, 238, 133))
	text.textSize = 15
	text.textAlign = 1
	pal2.AddChild(text)
	
	local pal3 = Panel(Rect(0, 90, 84, 34))
	local pal4 = Image('Pictures/forge/Button.png')
	local butt = Button('<color=#FACC2E>확인</color>')
	pal3.anchor = 1
	pal3.pivotX = 0.5
	pal2.AddChild(pal3)
	panel_side(pal3, pal4, butt)
	
	butt.onClick.Add(function()
		self.black_panel.Destroy()
	end)
end

local Gt = Client.GetItem
function main_data:main(c1)
	if self.main_panel then return end
	self.main_panel = Panel(Rect(0, 0, width, height))
	self.main_panel.AddChild(Image('Pictures/forge/xk.png', Rect(0, 0, width, height)))
	self.main_panel.anchor = 4
	self.main_panel.pivotX = 0.5
	self.main_panel.pivotY = 0.5
	self.main_panel.showOnTop = true
	
	local sub_panel = Image('Pictures/forge/xk.png', Rect(2, 2, width-4, height-4))
	-- sub_panel.color = Color(95, 95, 95)
	self.main_panel.AddChild(sub_panel)
	
	local Close_button = Button('✖', Rect(sub_panel.width-36, 0, 36, 36))
	Close_button.color = hide
	Close_button.textAlign = 4
	Close_button.textSize = 20
	sub_panel.AddChild(Close_button)
	Close_button.onClick.Add(function()
		self.main_panel.Destroy()
		self.main_panel = nil
		self.T = nil
	end)
	
	local item_side, item_panel = Panel(), Image('Pictures/forge/Button.png')
	self.item_but = Button()
	
	
	item_side.rect = Rect(0, 20, 80, 80)
	item_side.anchor = 1
	item_side.pivotX = 0.5
	sub_panel.AddChild(item_side)
	
	self.array_item_text = {}
	for i=1, 4 do
		self.array_item_text[i] = Text()
		self.array_item_text[i].anchor = 1
		self.array_item_text[i].pivotX = 0.5
		self.array_item_text[i].textAlign = 4
		self.array_item_text[i].textSize = 16
		sub_panel.AddChild(self.array_item_text[i])
	end
	local side = {{1, 1}, {-1, 1}, {1, -1}, {-1, -1}}
	for i, v in ipairs(side) do
		self.array_item_text[i].rect = Rect(v[1], item_side.y+item_side.height+4+v[2], 145, 20)
	end
	
	self.item_text = Text('', Rect(0, item_side.y+item_side.height+4, 145, 20))
	self.item_text.anchor = 1
	self.item_text.pivotX = 0.5
	self.item_text.textAlign = 4
	self.item_text.textSize = 16
	sub_panel.AddChild(self.item_text)
	
	panel_side(item_side, item_panel, self.item_but)
	-- item_panel.color = Color(43, 43, 43)
	self.item_but.onClick.Add(function()
		self.dark_p = Panel(Rect(0, 0, Client.width, Client.height))
		self.dark_p.showOnTop = true
		self.dark_p.color = Color(0, 0, 0, 100)
		Client.FireEvent('공용이벤트', 27)
	end)
	
	self.item_img = Image('Pictures/forge/손구락.png', Rect(0, 0, self.item_but.width, self.item_but.height))
	self.item_img.SetOpacity(180)
	self.item_but.AddChild(self.item_img)
	
	self.level_text = Text('', Rect(0, 0, 80, 80))
	self.level_text.textSize = 16
	self.level_text.textAlign = 0
	self.item_but.AddChild(self.level_text)
	
	local data_panel = {}
	self.data_text = {}
	for i=1, 2 do

		data_panel[i] = Panel(Rect(10, self.item_text.y+self.item_text.height+15, 120, 70))
		data_panel[i].color = Color(111, 111, 111, 100)
		sub_panel.AddChild(data_panel[i])
		
		self.data_text[i] = Text('', Rect(2, 2, data_panel[i].width-4, data_panel[i].height-4))
		self.data_text[i].textSize = 13
		self.data_text[i].textAlign = 4
		data_panel[i].AddChild(self.data_text[i])
	end
	data_panel[2].x = 184
	
	local way_img = Image('Pictures/forge/화살표.png', Rect(0, data_panel[1].y+15, 32, 32))
	way_img.anchor = 1
	way_img.pivotX = 0.5
	sub_panel.AddChild(way_img)
	
	self.sus_per = Text('<size=16>강화 성공 확률 : 100%</size>', Rect(0, way_img.y+55, 260, 40))
	self.sus_per.textAlign = 4
	self.sus_per.anchor = 1
	self.sus_per.pivotX = 0.5
	sub_panel.AddChild(self.sus_per)
	
	local ceil_side, ceil_panel, ceil_but = {}, {}, {}
	self.ceil_img, self.ceil_text, self.on_off_pal = {}, {}, {}
	local Y = self.sus_per.y+self.sus_per.height
	for i=1, 3 do
		ceil_side[i] = Panel(Rect(40+84*(i-1), Y+10, 64, 64))
		sub_panel.AddChild(ceil_side[i])
		
		ceil_panel[i], ceil_but[i] = Image('Pictures/forge/Button.png'), Button()
		panel_side(ceil_side[i], ceil_panel[i], ceil_but[i])
		-- ceil_panel[i].color = Color(43, 43, 43)
		
		self.ceil_img[i] = Image('', Rect(0, 0, ceil_panel[i].width, ceil_panel[i].height))
		self.ceil_img[i].SetOpacity(0)
		ceil_but[i].AddChild(self.ceil_img[i])
		
		self.ceil_text[i] = Text('', Rect(ceil_side[i].x-4, ceil_side[i].y+66, 74, 20))
		self.ceil_text[i].textAlign = 4
		sub_panel.AddChild(self.ceil_text[i])
		
		self.on_off_pal[i] = Panel(Rect(0, 0, self.ceil_img[i].width, self.ceil_img[i].height))
		self.on_off_pal[i].color = Color(0, 0, 0, 120)
		self.ceil_img[i].AddChild(self.on_off_pal[i])
	end
	
	self.on_off_pal[1].color = Color(0, 0, 0, 0)
	self.on_off_pal[2].color = Color(0, 0, 0, 0)
	
	if c1 >= 1 then
		self.ceil_text[3].text = '<color=#2ECCFA>'..c1..'</color>/1'
	else
		self.ceil_text[3].text = '<color=#F5A9A9>'..c1..'</color>/1'
	end
	
	ceil_but[3].onClick.Add(function()
		--[[ceil_but[2].enabled = false
		Client.RunLater(function() ceil_but[2].enabled = true end, 0.5)]]
		if self.T then
			if self.T.per~=100 then
				if self.on_off_pal[3].color.g == 0 then
					self.on_off_pal[3].color = Color(0, 1, 0, 0)
					self.sus_per.text = '<size=16>강화 성공 확률 : '..self.T.per..'(+'..(10+self.T.luk)..')%</size>'
					self.T.bless_bool = true
				else
					self.on_off_pal[3].color = Color(0, 0, 0, 120)
					self.sus_per.text = '<size=16>강화 성공 확률 : '..self.T.per..'(+'..self.T.luk..')%</size>'
					self.T.bless_bool = false
				end
			end
		end
	end)
	self.ceil_img[3].SetImageID(Gt(self.bless).imageID)
	self.ceil_img[3].SetOpacity(255)
	
	local f_size, f_pal = Panel(), Image('Pictures/forge/Button.png')
	self.f_but = Button()
	f_size.rect = Rect(0, self.ceil_text[1].y+self.ceil_text[1].height+7, 200, 60)
	f_size.anchor = 1
	f_size.pivotX = 0.5
	sub_panel.AddChild(f_size)
	
	panel_side(f_size, f_pal, self.f_but)
	-- f_pal.color = Color(43, 43, 43)
	self.f_but.text = '<size=20>강 화</size>'
	self.f_but.onClick.Add(function()
		self.f_but.visible = false
		Client.RunLater(function() self.f_but.visible = true end, 0.5)
		if self.T then
			Client.FireEvent('강화시도', Utility.JSONSerialize(self.T))
		end
	end)
end


Client.FireEvent('forge_data_start')

Client.GetTopic('forge_main').Add(function(c1)
	main_data:main(c1)
end)

local stat_text = {}
Client.GetTopic('forge_data_Client').Add(function(table01, text01, bless)
	stat_text = Utility.JSONParse(table01)
	stat_text[0] = text01
	stat_text[105] = '<color=#FF8000>룬의 힘</color>'
	stat_text[107] = '<color=#FA5882>투지</color>'
	stat_text[108] = '<color=#D7DF01>인내</color>'
	stat_text[109] = '<color=#00FFFF>행운</color>'
	main_data.bless = bless
end)

Client.GetTopic('다크패널삭제').Add(function()
	main_data.dark_p.Destroy()
end)

Client.GetTopic('forge_ShowAlert').Add(function(txt)
	main_data.main_panel.Destroy()
	main_data.main_panel = nil
	main_data.T = nil
	main_data:ShowAlert(txt)
end)

Client.GetTopic('강화신호').Add(function(Table, stat_table, su)
	if not main_data.main_panel then return end
	
	local json = Utility.JSONParse
	main_data.T = json(Table)
	stat_name = json(stat_table)
	
	local m = main_data
	local T = m.T
	T.bless_bool = false
	
	if T.bless >= 1 then
		m.ceil_text[3].text = '<color=#2ECCFA>'..T.bless..'</color>/1'
	else
		m.ceil_text[3].text = '<color=#F5A9A9>'..T.bless..'</color>/1'
	end
	
	local name = Gt(T.dataID).name
	local name2 = name
	m.item_text.text = name
	
	-- name2에 색을 없애는 과정
	while string.find(name2, '<color=#') do
		local F = string.find(name2, '<color=#')
		if F then
			local txt = string.sub(name2, F+15, #name2)
			local F2 = string.find(txt, '</color>')
			local txt2 = string.sub(txt, 1, F2-1)
			name2 = txt2
		end
	end
	
	for i=1, 4 do
		m.array_item_text[i].text = '<color=#000000>'..name2..'</color>'
	end
	
	if T.level >= 1 then
		m.level_text.text = '<color=#00FF00>+'..T.level..'</color>'
	else
		m.level_text.text = ''
	end
	
	m.stat_memo = {'남은 강화 횟수 + '..su..'\n', '남은 강화 횟수 + '..(su-1)..'\n'}
	
	local j = 1
	for _, v in pairs(stat_name.stat) do
		m.stat_memo[1] = m.stat_memo[1]..stat_text[v]..' + '..T.stat[j]..'\n'
		m.stat_memo[2] = m.stat_memo[2]..'<color=#81DAF5>'..stat_text[v]..' + '..(T.stat[j]==0 and stat_name.value[j] or T.stat[j]*2)..'</color>\n'
		j = j+1
	end
	
	for i=1, 2 do
		m.data_text[i].text = m.stat_memo[i]
	end

	m.sus_per.text = '<size=16>강화 성공 확률 : '..T.per..'(+'..T.luk..')%</size>'
	
	m.item_img.SetImageID(Gt(T.dataID).imageID)
	
	m.ceil_img[1].SetImageID(Gt(T.forge_item_id).imageID)
	m.ceil_img[1].SetOpacity(255)
	
	if T.count >= T.need_count then
		m.ceil_text[1].text = '<color=#2ECCFA>'..T.count..'</color>/'..T.need_count
	else
		m.ceil_text[1].text = '<color=#F5A9A9>'..T.count..'</color>/'..T.need_count
	end
	
	m.ceil_img[2].SetImageID(Gt(T.forge_need_id).imageID)
	m.ceil_img[2].SetOpacity(255)
	
	if T.id_count >= T.id_count2 then
		m.ceil_text[2].text = '<color=#2ECCFA>'..T.id_count..'</color>/'..T.id_count2
	else
		m.ceil_text[2].text = '<color=#F5A9A9>'..T.id_count..'</color>/'..T.id_count2
	end
	
	m.on_off_pal[3].color = Color(0, 0, 0, 120)
	
	local function C_commaValue(n)
		local left, num, right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
		return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
	end
	
	m.f_but.text = '<size=20>강 화</size>\n'..C_commaValue(T.need_gold)..' 골드'
end)





