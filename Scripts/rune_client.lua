

local rune = {}
local stat_text = {}
local roading = false
local ceil_panel = {}
local rune_stat_Text = ''
local rune_stat = {}
local stat_table = {}
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
local function filter(statID, value)
	local text1, text2 = '', stat_text[statID]
	text1 = '아이템 '..text2..' +'..value
	
	return text1
end
-- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · -- · 
local Width, Height = 482, 270
local line = 2
rune.road = false
rune.black_panel = nil

local rune_inven, rune_inven_img, rune_inven_but = {}, {}, {}
local inven_back = 0
local rune_app, rune_app_img, rune_app_but = {}, {}, {}
local app_back = 0
local app_type = {} -- 1:장착중 / 2:빈칸 / 3:자물쇠
local inven_type = {} -- 1:존재 / 2:빈칸
local basic_color = Color(67, 67, 67)
local chose_color = Color(67, 220, 67, 200)
local function C_commaValue(n)
	local left, num, right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end
	
local function Open() rune:ShowAlert('룬슬롯을 추가 오픈하시겠습니까?'..'\n<color=#FACC2E>비용 : '..C_commaValue(rune.open_gold[rune.user_data.unlock+1])..'</color>', '룬장착칸오픈') Client.myPlayerUnit.PlaySE('룬 효과음/버튼 효과음.ogg', 1) end
local function Stat_Latest()
	for _, v in ipairs(stat_table) do
		rune_stat[v] = 0
	end
	for i=1, rune.max_num do
		local num = rune.user_data['id_'..i]
		if num then
			for j, v in ipairs(num.op) do
				rune_stat[v.statID] = rune_stat[v.statID]+v.value
			end
		end
	end
	
	local tttt = ''
	for _, v in ipairs(stat_table) do
		if rune_stat[v]~= 0 then
			tttt = tttt..stat_text[v]..'+'..rune_stat[v]..'\n'
		end
	end
	rune_stat_Text.text = tttt
end

function rune:ShowAlert(txt, signal, Table)
	self.black_panel = Panel(Rect(0, 0, Client.width, Client.height))
	self.black_panel.color = Color(0, 0, 0, 100)
	self.black_panel.showOnTop = true
	
	local pal = Panel(Rect(0, 0, 240, 135))
	pal.pivotX = 0.5
	pal.pivotY = 0.5
	pal.anchor = 4
	pal.color = Color(0, 0, 0)
	self.black_panel.AddChild(pal)
	
	local pal2 = Panel(Rect(0, 0, 236, 131))
	pal2.pivotX = 0.5
	pal2.pivotY = 0.5
	pal2.anchor = 4
	pal2.color = Color(43, 43, 43)
	pal.AddChild(pal2)
	
	local text = Text('\n\n'..txt, Rect(0, 0, 238, 133))
	text.textAlign = 1
	pal2.AddChild(text)
	
	local pal3, pal4, butt = {}, {}, {}
	for i=1, 2 do
		pal3[i] = Panel(Rect(22, 90, 84, 34))
		pal3[i].color = Color(0, 0, 0)
		pal2.AddChild(pal3[i])
		
		pal4[i] = Panel(Rect(1, 1, 82, 32))
		pal4[i].color = Color(67, 67, 67)
		pal3[i].AddChild(pal4[i])
		
		butt[i] = Button('', Rect(0, 0, 82, 32))
		butt[i].SetOpacity(0)
		pal4[i].AddChild(butt[i])
	end
	
	pal3[2].x = 132
	butt[1].text = '확인'
	butt[1].onClick.Add(function()
		self.black_panel.Destroy()
		Client.FireEvent(signal, Table==nil and '' or Utility.JSONSerialize(Table))
	end)
	butt[2].text = '취소'
	butt[2].onClick.Add(function()
		self.black_panel.Destroy()
	end)
end


local Dark_pal = nil
local function pl() -- 연속 클릭 방지
	if not Dark_pal then
		Dark_pal = Panel(Rect(0, 0, Width+240, Height))
		Dark_pal.pivotX = 0.5
		Dark_pal.pivotY = 0.5
		Dark_pal.anchor = 4
		Dark_pal.color = Color(0, 0, 0, 0)
		Dark_pal.showOnTop = true
		Client.RunLater(function()
			Dark_pal.visible = false
		end, 0.2)
	elseif Dark_pal.visible == false then
		Dark_pal.visible = true
		Client.RunLater(function()
			Dark_pal.visible = false
		end, 0.2)
	end
end

function rune:data_show(id, txt)
	if self.UI_data then
		self.UI_but.text = '<size=20>'..Client.GetItem(id).name..'</size>\n\n'..(txt=='' and '옵션없음' or txt)
	else
		self.panel.DOMove(Point(-120, 0), 1)
		
		self.UI_data = Panel(Rect(240, 0, 240, Height))
		self.UI_data.showOnTop = true
		self.UI_data.pivotX = 0.5
		self.UI_data.pivotY = 0.5
		self.UI_data.anchor = 4
		self.UI_data.color = Color(43, 43, 43, 200)
		
		self.UI_but = Button(txt=='' and '옵션없음' or txt, Rect(4, 4, self.UI_data.width-8, Height-8))
		self.UI_but.textAlign = 0
		self.UI_but.SetOpacity(0)
		self.UI_data.AddChild(self.UI_but)
		
		self.UI_but.text = '<size=20>'..Client.GetItem(id).name..'</size>\n\n'..self.UI_but.text
		
		self.UI_but.onClick.Add(function()
			self.panel.DOMove(Point(0, 0), 1)
			self.UI_data.Destroy()
			self.UI_data = nil
		end)
	end
end

function rune:show()
	if self.panel then return end
	rune_inven, rune_inven_img, rune_inven_but = {}, {}, {}
	inven_back = 0
	rune_app, rune_app_img, rune_app_but = {}, {}, {}
	app_back = 0
	app_type = {}
	inven_type = {}
	
	self.panel = Panel(Rect(0, 0, Width, Height))
	self.panel.showOnTop = true
	self.panel.color = Color(0, 0, 0)
	self.panel.pivotX = 0.5
	self.panel.pivotY = 0.5
	self.panel.anchor = 4
	
	local main_panel = Panel(Rect(0, 0, Width-line*2, Height-line*2))
	main_panel.color = Color(43, 43, 43)
	main_panel.pivotX = 0.5
	main_panel.pivotY = 0.5
	main_panel.anchor = 4
	self.panel.AddChild(main_panel)
	
	local but_size = 34
	local Close_button = Button('✖', Rect(self.panel.width-but_size, 0, but_size, but_size))
	Close_button.color = Color(43, 43, 43)
	Close_button.textAlign = 4
	Close_button.textSize = 20
	self.panel.AddChild(Close_button)
	Close_button.onClick.Add(function()
		self.panel.Destroy()
		self.panel = nil
		if self.UI_data then
			self.UI_data.Destroy()
			self.UI_data = nil
		end
	end)
	
	local Title_text = Text('<color=#FACC2E>룬</color>', Rect(10, 0, 100, but_size))
	Title_text.textSize = 20
	self.panel.AddChild(Title_text)
	
	local ceil_side_pal, scroll_panel = {}, {}
	for i=1, 3 do
		ceil_side_pal[i] = Panel(Rect(2, but_size+2, 0, main_panel.height-but_size-4))
		ceil_side_pal[i].color = Color(0, 0, 0)
		main_panel.AddChild(ceil_side_pal[i])
	end
	ceil_side_pal[1].width = 130
	ceil_side_pal[2].x = ceil_side_pal[1].width+4
	ceil_side_pal[2].width = 130
	ceil_side_pal[3].x = ceil_side_pal[1].width*2+6
	ceil_side_pal[3].width = 210
	
	for i=1, 3 do
		ceil_panel[i] = Panel(Rect(0, 0, ceil_side_pal[i].width-2, Height))
		ceil_panel[i].color = Color(87, 87, 87)
		
		scroll_panel[i] = ScrollPanel(Rect(0, 0, ceil_side_pal[i].width-2, ceil_side_pal[i].height-2))
		scroll_panel[i].pivotX = 0.5
		scroll_panel[i].pivotY = 0.5
		scroll_panel[i].anchor = 4
		scroll_panel[i].color = Color(0, 0, 0)
		scroll_panel[i].horizontal = false
		scroll_panel[i].content = ceil_panel[i]
		ceil_side_pal[i].AddChild(scroll_panel[i])
	end
	rune_stat_Text = Text('', Rect(4, 4, ceil_panel[3].width-8, ceil_panel[3].height-8))
	rune_stat_Text.textAlign = 0
	ceil_panel[3].AddChild(rune_stat_Text)
	Stat_Latest()
	
	local ceiling = math.ceil
	
	for i, v in ipairs(self.data) do
		local x = 2+42*((i%3==0 and 3 or i%3)-1)
		local y = 2+42*(ceiling(i/3)-1)
		rune_inven[i] = Panel(Rect(x, y, 40, 40))
		rune_inven[i].color = basic_color
		ceil_panel[1].AddChild(rune_inven[i])
		
		rune_inven_img[i] = Image('', Rect(0, 0, 40, 40))
		rune_inven_img[i].SetImageID(Client.GetItem(v.dataID).imageID)
		rune_inven[i].AddChild(rune_inven_img[i])
		inven_type[i] = 1
		
		rune_inven_but[i] = Button('', Rect(0, 0, 40, 40))
		rune_inven_but[i].SetOpacity(0)
		rune_inven[i].AddChild(rune_inven_but[i])
		
		rune_inven_but[i].onClick.Add(function()
			pl()
			Client.myPlayerUnit.PlaySE('룬 효과음/버튼 효과음.ogg', 1)
			if inven_type[i] == 2 then return end
		--===========aaa===========
			if app_back ~= 0 then
				rune:ShowAlert('<color=#FACC2E>'..app_back..'번 슬롯에 '..Client.GetItem(v.dataID).name..'을 장착하시겠습니까?</color>', '룬장착하기', {app_back, v.id, i})
			else
				if inven_back==0 then
					inven_back = i
					rune_inven[i].color = chose_color
				elseif inven_back==i then
					rune_inven[i].color = basic_color
					inven_back=0
				else
					rune_inven[inven_back].color = basic_color
					rune_inven[i].color = chose_color
					inven_back = i
				end
			end
			-- 룬왼칸
			self:data_show(v.dataID, v.op_text:gsub("<color>", "</color>"))
		end)
	end
	ceil_panel[1].height = 2+42*ceiling(#self.data/3)
	
	for i=1, self.num+self.user_data.unlock do
		local x = 2+42*((i%3==0 and 3 or i%3)-1)
		local y = 2+42*(ceiling(i/3)-1)
		rune_app[i] = Panel(Rect(x, y, 40, 40))
		rune_app[i].color = basic_color
		ceil_panel[2].AddChild(rune_app[i])
		
		rune_app_img[i] = Image('Pictures/룬빈칸.png', Rect(0, 0, 40, 40))
		if rune.user_data['id_'..i] then
			rune_app_img[i].SetImageID(Client.GetItem(rune.user_data['id_'..i].dataID).imageID)
			app_type[i] = 1
		else
			app_type[i] = 2
			rune_app_img[i].SetOpacity(140)
		end
		
		rune_app[i].AddChild(rune_app_img[i])
		
		rune_app_but[i] = Button('', Rect(0, 0, 40, 40))
		rune_app_but[i].SetOpacity(0)
		rune_app[i].AddChild(rune_app_but[i])
		--===========bbb=========== 온클릭 부분이 그대로 ccc에 복사해서 가야됨.
		rune_app_but[i].onClick.Add(function()
			pl()
			Client.myPlayerUnit.PlaySE('룬 효과음/버튼 효과음.ogg', 1)
			if app_type[i] == 3 then
				Open()
				return
			end
			if inven_back ~= 0 then
				local Data = self.data[inven_back]
				rune:ShowAlert('<color=#FACC2E>'..i..'번 슬롯에 '..Client.GetItem(Data.dataID).name..'을 장착하시겠습니까?</color>', '룬장착하기', {i, Data.id, inven_back})
			else
				if app_back==0 then
					app_back = i
					rune_app[i].color = chose_color
				elseif app_back==i then
					rune_app[i].color = basic_color
					app_back=0
				else
					rune_app[app_back].color = basic_color
					rune_app[i].color = chose_color
					app_back = i
				end
				local Data2 = self.user_data['id_'..i]
				if Data2 then
					-- 룬오른칸
					self:data_show(Data2.dataID, Data2.op_text:gsub("<color>", "</color>"))
				end
			end
		end)
	end
	
	
	for i=self.num+self.user_data.unlock+1, self.max_num do
		local x = 2+42*((i%3==0 and 3 or i%3)-1)
		local y = 2+42*(ceiling(i/3)-1)
		rune_app[i] = Panel(Rect(x, y, 40, 40))
		rune_app[i].color = basic_color
		ceil_panel[2].AddChild(rune_app[i])
		
		rune_app_img[i] = Image('Pictures/룬자물쇠.png', Rect(0, 0, 40, 40))
		app_type[i] = 3
		rune_app_img[i].SetOpacity(140)
		rune_app[i].AddChild(rune_app_img[i])
		
		rune_app_but[i] = Button('', Rect(0, 0, 40, 40))
		rune_app_but[i].SetOpacity(0)
		rune_app[i].AddChild(rune_app_but[i])
		--===========ccc===========
		rune_app_but[i].onClick.Add(function()
			pl()
			Client.myPlayerUnit.PlaySE('룬 효과음/버튼 효과음.ogg', 1)
			if app_type[i] == 3 then
				Open()
				return
			end
			if inven_back ~= 0 then
				local Data = self.data[inven_back]
				rune:ShowAlert('<color=#FACC2E>'..i..'번 슬롯에 '..Client.GetItem(Data.dataID).name..'을 장착하시겠습니까?</color>', '룬장착하기', {i, Data.id, inven_back})
			else
				if app_back==0 then
					app_back = i
					rune_app[i].color = chose_color
				elseif app_back==i then
					rune_app[i].color = basic_color
					app_back=0
				else
					rune_app[app_back].color = basic_color
					rune_app[i].color = chose_color
					app_back = i
				end
				local Data2 = self.user_data['id_'..i]
				if Data2 then
					-- 해금한 룬칸
					self:data_show(Data2.dataID, Data2.op_text:gsub("<color>", "</color>"))
				end
			end
		end)
	end
	ceil_panel[2].height = self.max_num/3<6 and 2+42*6 or 2+42*ceiling(self.max_num/3)
end

Client.GetTopic("rune_open").Add(function(T, num, Max, StrVar, T2)
	if roading==false then Client.ShowAlert('데이터가 로딩되지 않았습니다. 잠시 후 시도해주세요.') return end
	rune.num = num
	rune.max_num = Max
	rune.user_data = Utility.JSONParse(StrVar)
	rune.data = Utility.JSONParse(T)
	for i, v in ipairs(rune.data) do
		rune.data[i].op_text = ''
		for _, b in ipairs(v.op) do
			rune.data[i].op_text = rune.data[i].op_text..filter(b.statID, b.value)..'\n'
		end
	end
	stat_table = Utility.JSONParse(T2)
	rune:show()
end)

Client.RunLater(function()
	Client.FireEvent('룬데이터가져와')
end, 2)

Client.GetTopic("룬데이터가져가").Add(function(T, txt, txt2, txt3, txt4)
	local T1 = Utility.JSONParse(T)
	for i, v in ipairs(Utility.JSONParse(txt)) do
		rune[v] = T1[i]
	end
	rune.open_gold = Utility.JSONParse(txt2)
	T1=nil
	rune.road = true
	stat_text = Utility.JSONParse(txt3)
	stat_text[0] = txt4
	stat_text[105] = '<color=#FF8000>룬의 힘</color>'
	stat_text[107] = '<color=#FA5882>투지</color>'
	stat_text[108] = '<color=#D7DF01>인내</color>'
	stat_text[109] = '<color=#00FFFF>행운</color>'
	roading = true
	print('[#] 룬 데이터로딩이 완료되었습니다.')
end)

Client.GetTopic("룬해금").Add(function(num)
	rune.user_data.unlock = num
	
	local key = num+rune.num
	rune_app_img[key].image = 'Pictures/룬빈칸.png'
	rune_app_img[key].SetOpacity(140)
	--rune_app_but[key].onClick.Remove(Open)
	app_type[key] = 2
end)

Client.GetTopic("룬비정상종료").Add(function()
	Client.ShowAlert('비정상적인 접근입니다.')
	rune.panel.Destroy()
	rune.panel = nil
	if rune.UI_data then
		rune.UI_data.Destroy()
		rune.UI_data = nil
	end
end)

Client.GetTopic("룬장착완료").Add(function(txt, key, key_second, id, real_id, dumy_table)
	Client.myPlayerUnit.PlaySE('룬 효과음/룬 장착 효과음.ogg', 1)
	rune.user_data = Utility.JSONParse(txt)
	rune_app_img[key].SetImageID(Client.GetItem(rune.user_data['id_'..key].dataID).imageID)
	
	rune_app_img[key].SetOpacity(255)
	--rune_app_but[key].onClick.Remove(Open)
	app_type[key] = 1
	
	if inven_back==0 then
		rune_app[app_back].color = basic_color
		app_back = 0
	elseif app_back==0 then
		rune_inven[inven_back].color = basic_color
		inven_back = 0
	end
	
	local T = Utility.JSONParse(dumy_table)
	local text = ''
	for _, b in ipairs(T) do
		text = text..filter(b.statID, b.value)..'\n'
	end
	
	if id==0 then
		rune_inven_img[key_second].image = 'Pictures/룬빈칸.png'
		rune_inven_img[key_second].SetOpacity(140)
		rune_inven_but[key_second].onClick.Remove(Open)
		inven_type[key_second] = 2
	else
		rune_inven_img[key_second].SetImageID(Client.GetItem(id).imageID)
		rune.data[key_second].op_text = text:gsub("<color>", "</color>")
		rune.data[key_second].dataID = id
		rune.data[key_second].id = real_id
	end
	
	if rune.UI_data then
		rune.panel.DOMove(Point(0, 0), 1)
		rune.UI_data.Destroy()
		rune.UI_data = nil
	end
	
	Stat_Latest()
	
	
end)










