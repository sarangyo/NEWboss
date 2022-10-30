local O_panel, dataID_panel, ASO_Panel, OO_panel = nil, nil, nil, nil
local Storage_Panel = nil
local hi_but = nil
local cw = Client.width
local ch = Client.height

local function Operation_UI(T)
	if O_panel then 
		O_panel.Destroy()
		O_panel = nil
		dataID_panel.Destroy()
		if ASO_Panel then
			ASO_Panel.Destroy()
			ASO_Panel = nil
		end
		if OO_panel then
			OO_panel.Destroy()
			OO_panel = nil
		end
		return 
	end
	local Garo = 500
	local Sero = 320
	local blue = Color(160, 220, 235)
	local n_blue = Color(160, 220, 235, 140)
	
	O_panel = ScrollPanel(Rect(cw/2-Garo/2+140, ch/2-Sero/2, Garo, Sero))
	O_panel.color = Color(0, 0, 0)
	O_panel.content = O_panel
	O_panel.showOnTop = true
	
	local O_panel2 = Panel(Rect(1, 1, O_panel.width-2, O_panel.height-2))
	O_panel2.color = Color(0, 0, 0)
	O_panel.AddChild(O_panel2)
	
	local O_pal = Panel(Rect(0, 0, O_panel2.width, 42))
	O_pal.color = Color(70, 180, 55)
	O_panel2.AddChild(O_pal)
	
	local O_but = Button(' <color=#0080FF>유저검색</color>', Rect(0, 0, 100, O_pal.height))
	O_but.textSize = 22
	O_but.textAlign = 3
	O_but.color = Color(255, 255, 0, 255)
	O_pal.AddChild(O_but)
	
	local CloseButton = Button('✖', Rect(Garo-42, 0, 42, 42))
	CloseButton.textSize = 26
	CloseButton.textAlign = 4
	CloseButton.color = Color(87, 87, 87)
	O_panel2.AddChild(CloseButton)
	CloseButton.onClick.Add(function()
		O_panel.Destroy()
		O_panel = nil
		dataID_panel.Destroy()
		if ASO_Panel then
			ASO_Panel.Destroy()
			ASO_Panel = nil
		end
		if OO_panel then
			OO_panel.Destroy()
			OO_panel = nil
		end
	end)
	
	local big_panel = Panel(Rect(0, O_pal.height, O_panel2.width, 5+#T.name*39))
	big_panel.color = Color(34, 116, 28)
	
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(0, O_pal.height, O_panel2.width, O_panel2.height-O_pal.height)
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = false
	scroll_panel.content = big_panel
	O_panel2.AddChild(scroll_panel)
	
	local txt0 = InputField(Rect(100, 0, (O_pal.width-142)/3, O_pal.height))
	txt0.textSize = 18
	txt0.textAlign = 4
	txt0.placeholder = 'user name'
	O_pal.AddChild(txt0)
	
	local txt1 = InputField(Rect(100+(O_pal.width-142)/3, 0, (O_pal.width-142)/3, O_pal.height))
	txt1.textSize = 18
	txt1.textAlign = 4
	txt1.placeholder = 'dataID'
	O_pal.AddChild(txt1)
	
	local txt2 = InputField(Rect(100+(O_pal.width-142)/3*2, 0, (O_pal.width-142)/3, O_pal.height))
	txt2.textSize = 18
	txt2.textAlign = 4
	txt2.placeholder = 'count'
	O_pal.AddChild(txt2)
	
	local o={p={}, t={}, b={{}, {}, {}, {}, {}}}
	for i, v in ipairs(T.name) do
		o.p[i] = Panel(Rect(5, 5+39*(i-1), big_panel.width-10, 34))
		o.p[i].color = Color(16, 98, 10)
		big_panel.AddChild(o.p[i])
		
		o.t[i] = Text(v, Rect(5, 0, o.p[i].width-5, o.p[i].height))
		o.t[i].textSize = 17
		o.p[i].AddChild(o.t[i])
		for j=1, #o.b do
			o.b[j][i] = Button('', Rect(o.p[i].width-o.p[i].height*1.7*j, 0, o.p[i].height*1.7, o.p[i].height))
			o.b[j][i].textSize = 14
			o.b[j][i].textAlign = 4
			o.b[j][i].color = Color(0, (j%2==1 and 44) or 88, 0)
			o.p[i].AddChild(o.b[j][i])
		end
		o.b[1][i].text = '템회수'
		o.b[1][i].onClick.Add(function()
			if txt1.text == '' or txt1.text == nil then
				Client.ShowAlert('dataID란에 숫자를 입력해주세요.')
				return
			end
			Client.ShowYesNoAlert(
			'player : '..v..
			'\nname : '..Client.GetItem(tonumber(txt1.text)).name..
			'\ndataID : '..txt1.text..
			'\ncount : '..(txt2.text==''and'1'or txt2.text)..
			'개\n<color=#DB0000>회수하시겠습니까?</color>', function(a)
				if a==1 then
					Client.FireEvent('Item_remove', v, txt1.text, txt2.text==''and'1'or txt2.text)
				end
			end)
		end)
		
		o.b[2][i].text = '템부여'
		o.b[2][i].onClick.Add(function()
			if txt1.text == '' or txt1.text == nil then
				Client.ShowAlert('dataID란에 숫자를 입력해주세요.')
				return
			end
			Client.ShowYesNoAlert(
			'player : '..v..
			'\nname : '..Client.GetItem(tonumber(txt1.text)).name..
			'\ndataID : '..txt1.text..
			'\ncount : '..(txt2.text==''and'1'or txt2.text)..
			'개\n<color=#1312FF>부여하시겠습니까?</color>', function(a)
				if a==1 then
					Client.FireEvent('Item_Add', v, txt1.text, txt2.text==''and'1'or txt2.text)
				end
			end)
		end)
		
		o.b[3][i].text = '변수변경'
		o.b[3][i].onClick.Add(function()
			if txt1.text == '' or txt1.text == nil or txt2.text == '' or txt2.text == nil then
				Client.ShowAlert('dataID, count란에 숫자를 입력해주세요.')
				return
			end
			Client.ShowYesNoAlert(
			'player : '..v..
			'\n변수번호 : '..txt1.text..
			'\n변경값 : '..txt2.text..
			'\n변경하시겠습니까?', function(a)
				if a==1 then
					Client.FireEvent('var_set', v, txt1.text, txt2.text)
				end
			end)
		end)
		
		o.b[4][i].text = '변수보기'
		o.b[4][i].onClick.Add(function()
			if txt1.text == '' or txt1.text == nil then
				Client.ShowAlert('dataID란에 숫자를 입력해주세요.')
				return
			end
			Client.FireEvent('var_get', v, txt1.text)
		end)
		
		
		o.b[5][i].text = '기타'
		o.b[5][i].onClick.Add(function()
		--출두, 소환, 인벤, 창고, 밴
			if ASO_Panel then
				Client.ShowAlert('다른 유저의 창이 열려있습니다.')
				return 
			end
			local garo = 240
			local sero = 120
			ASO_Panel = ScrollPanel(Rect(cw/2-garo/2+140, ch/2-sero/2, garo, sero))
			ASO_Panel.color = Color(0, 0, 0)
			ASO_Panel.content = ASO_Panel
			ASO_Panel.showOnTop = true
			
			local ASO_Panel2 = Panel(Rect(1, 1, ASO_Panel.width-2, ASO_Panel.height-2))
			ASO_Panel2.color = Color(100, 160, 40)
			ASO_Panel.AddChild(ASO_Panel2)
			
			local ASO_Panel3 = Panel(Rect(0, 0, ASO_Panel2.width, 28))
			ASO_Panel3.color = Color(140, 200, 60)
			ASO_Panel2.AddChild(ASO_Panel3)
			
			local title_text = Text('  <color=#212121>'..v..'</color>', Rect(0, 0, ASO_Panel3.width, ASO_Panel3.height))
			title_text.textSize = 17
			ASO_Panel3.AddChild(title_text)
			
			local CloseButton = Button('✖', Rect(garo-28, 0, 28, 28))
			CloseButton.textSize = 18
			CloseButton.textAlign = 4
			CloseButton.color = Color(87, 87, 87)
			ASO_Panel3.AddChild(CloseButton)
			CloseButton.onClick.Add(function()
				ASO_Panel.Destroy()
				ASO_Panel = nil
			end)
			
			local user = {text={'출두', '<color=#A9E2F3>소환</color>', '<color=#F7BE81>인벤</color>', '창고', '밴'}, panel={}, but={}}
			local m = {text, but={}}
			local bagic_color = Color(34, 116, 28)
			local choice_color = Color(42, 0, 102)
			for j, b in ipairs(user.text) do
				local user_width = (ASO_Panel2.width-12)/5
				user.panel[j] = Panel(Rect(2+(user_width+2)*(j-1), ASO_Panel3.height+2, user_width, 42))
				user.panel[j].color = Color(43, 43, 43)
				ASO_Panel2.AddChild(user.panel[j])
				
				user.but[j] = Button(b, Rect(1, 1, user.panel[j].width, user.panel[j].height-2))
				user.but[j].textSize = 17
				user.but[j].color = bagic_color
				user.panel[j].AddChild(user.but[j])
			end
			m.text = Text('', Rect(2, user.panel[1].y+user.panel[1].height+2, user.panel[1].width*2, user.panel[1].height))
			m.text.textSize = 18
			ASO_Panel2.AddChild(m.text)
			m.text.visible = false
			
			for j=1, 3 do
				m.but[j] = Button('OK', Rect(m.text.x+m.text.width+4+(user.panel[1].width+2)*(j-1), m.text.y, user.panel[1].width, user.panel[1].height))
				m.but[j].color = Color(0, 80, 0)
				m.but[j].textSize = 18
				ASO_Panel2.AddChild(m.but[j])
				m.but[j].visible = false
			end
			
			for key=1, 5 do
				user.but[key].onClick.Add(function()
					for index=1, 5 do
						user.but[index].color = bagic_color
					end
					user.but[key].color = choice_color
				end)
			end
			
			local ban_but = Button('밴목록', Rect(m.text.x, m.text.y, m.text.width, m.text.height))
			ban_but.color = user.but[5].color
			ban_but.textSize = user.but[5].textSize
			ASO_Panel2.AddChild(ban_but)
			ban_but.visible = false
			ban_but.onClick.Add(function()
				Client.FireEvent('밴당한유저들')
			end)
			
			for j=1, 3 do				
				user.but[j].onClick.Add(function()
					m.text.text = '진짜 '..user.text[j]..'?'
					m.text.visible = true
					ban_but.visible = false
					for k=1, 3 do
						m.but[k].visible = false
					end
					m.but[1].text = 'OK'
					m.but[1].visible = true
				end)
			end
			
			user.but[4].onClick.Add(function()
				m.text.text = '진짜 '..user.text[4]..'?'
				m.text.visible = true
				ban_but.visible = false
				for k=1, 3 do
					m.but[k].text = '창고'..k
					m.but[k].visible = true
				end
			end)
			
			user.but[5].onClick.Add(function()
				--m.text.text = '진짜 '..user.text[5]..'?'
				ban_but.visible = true
				m.text.visible = false
				m.but[1].text = '3일'
				m.but[2].text = '영정'
				m.but[3].text = '직접\n기입'
				for k=1, 3 do
					m.but[k].visible = true
				end
			end)
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
			
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
--➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖➖
			
			m.but[1].onClick.Add(function()
				local save_index = 0
				for key=1, 5 do
					if user.but[key].color.r == choice_color.r then
						save_index = key
						break
					end
				end
				
				if save_index == 1 then
					Client.FireEvent("appear", v)
				elseif save_index == 2 then
					Client.FireEvent("summon", v)
				elseif save_index == 3 then
					Client.FireEvent("Warehouse", v, '인벤')
				elseif save_index == 4 then
					Client.FireEvent("Warehouse", v, 1)
				elseif save_index == 5 then
					Client.ShowYesNoAlert('정말 밴하시겠습니까?', function(a)
						if a == 1 then
							Client.FireEvent("밴이다", v, 259200)
						end
					end)		
				end
			end)
			
			m.but[2].onClick.Add(function()
				local save_index = 0
				for key=1, 5 do
					if user.but[key].color.r == choice_color.r then
						save_index = key
						break
					end
				end
				
				if save_index == 4 then
					Client.FireEvent("Warehouse", v, 2)
				elseif save_index == 5 then
					Client.ShowYesNoAlert('정말 밴하시겠습니까?', function(a)
						if a == 1 then
							Client.FireEvent("밴이다", v, 447483647)
						end
					end)
				end
			end)
			
			m.but[3].onClick.Add(function()
				local save_index = 0
				for key=1, 5 do
					if user.but[key].color.r == choice_color.r then
						save_index = key
						break
					end
				end
				
				if save_index == 4 then
					Client.FireEvent("Warehouse", v, 3)
				elseif save_index == 5 then
					if txt2.text == '' or txt2.text == nil then
						Client.ShowAlert('count 란에 숫자를 입력해주세요.(초단위)')
					else
						Client.ShowYesNoAlert('정말 '..txt2.text..'초 동안 밴하시겠습니까?', function(a)
							if a == 1 then
								Client.FireEvent("밴이다", v, tonumber(txt2.text))
							end
						end)
					end
				end
			end)
		end)
	end
--[[====]]
--[[====]]
--[[====]]
--[[====]]
--[[====]]
--[[====]]
--[[====]]
--[[====]]
--[[====]]
	dataID_panel = ScrollPanel(Rect(20, 20, 260, 420))
	dataID_panel.color = Color(0, 0, 0)
	dataID_panel.content = dataID_panel
	dataID_panel.showOnTop = true
	local dataID_panel2= Panel(Rect(1, 1, dataID_panel.width-2, dataID_panel.height-2))
	dataID_panel.AddChild(dataID_panel2)
	
	local dataID_panel3= Panel(Rect(0, 0, dataID_panel2.width, 40))
	dataID_panel3.color = Color(70, 180, 55)
	dataID_panel2.AddChild(dataID_panel3)
	
	
	local dataID_txt = InputField(Rect(0, 0, dataID_panel3.width, dataID_panel3.height))
	dataID_txt.textSize = 22
	dataID_txt.textAlign = 3
	dataID_txt.placeholder = ' 아이템 검색'
	dataID_panel2.AddChild(dataID_txt)
	
	local item_name_but = Button('검색', Rect(150, 0, dataID_panel3.width-150, dataID_panel3.height))
	item_name_but.color = Color(20, 88, 12)
	item_name_but.textSize = 22
	item_name_but.textAlign = 4
	dataID_panel2.AddChild(item_name_but)
	
	local Max = 0
	for i=3, 0, -1 do
		local a = 10^i
		for j=10^(i+1)-a,a,-a do
			if Client.GetItem(Max + j) then
				Max = Max + j
				break
			end
		end
	end
	
	local item_var = Max --아이템 dataID최대치
	local dataID_panel4= Panel(Rect(0, 0, dataID_panel2.width, 6+28*item_var))
	dataID_panel4.color = Color(34, 116, 28)
	dataID_panel2.AddChild(dataID_panel4)
	
	local scroll_panel2 = ScrollPanel(Rect(0, dataID_panel3.height, dataID_panel2.width, dataID_panel2.height-dataID_panel3.height))
	scroll_panel2.horizontal = false
	scroll_panel2.showVerticalScrollbar = true
	scroll_panel2.content = dataID_panel4
	dataID_panel2.AddChild(scroll_panel2)
	
	local item_but = {}
	for i=1, item_var do
		item_but[i] = Button(' '..i..' : '..(Client.GetItem(i).name=='' and '<color=#BDBDBD>(empty)</color>' or 
			Client.GetItem(i).name), Rect(3, 3+28*(i-1), scroll_panel2.width-6, 25))
		item_but[i].color = Color(0, 70, 14)
		item_but[i].textAlign = 3
		dataID_panel4.AddChild(item_but[i])
		item_but[i].onClick.Add(function()
			txt1.text = i
		end)
	end
	
	O_but.onClick.Add(function()
		local save = {}
		for i, v in ipairs(T.name) do
			if string.find(v, txt0.text) then
				table.insert(save, i)
			end
		end
		for i, v in ipairs(o.p) do
			v.visible = false
		end
		for i, v in ipairs(save) do
			o.p[v].y = 5+39*(i-1)
			o.p[v].visible = true
		end
		big_panel.height = 5+#save*39
	end)
	
	item_name_but.onClick.Add(function()
		local save = {}
		for i=1, item_var do
			if string.find(Client.GetItem(i).name, dataID_txt.text) then
				table.insert(save, i)
			end
		end
		for i, v in ipairs(item_but) do
			v.visible = false
		end
		for i, v in ipairs(save) do
			item_but[v].y = 3+28*(i-1)
			item_but[v].visible = true
		end
		dataID_panel4.height = 6+#save*28
	end)
end

Client.GetTopic("quit").Add(function(Var, Time)
	Client.ShowAlert('밴당하셨습니다.\n남은시간 : '..math.floor(Var-Time)..'초')
	Client.RunLater(function()
		Client.Quit()
	end, 1)
end)

local function ban_list_panel(T)
	if OO_panel then return end
	local Garo = 500
	local Sero = 320
	
	OO_panel = ScrollPanel(Rect(cw/2-Garo/2, ch/2-Sero/2, Garo, Sero))
	OO_panel.color = Color(0, 0, 0)
	OO_panel.content = OO_panel
	OO_panel.showOnTop = true
	
	local OO_panel2 = Panel(Rect(1, 1, OO_panel.width-2, OO_panel.height-2))
	OO_panel2.color = Color(0, 0, 0)
	OO_panel.AddChild(OO_panel2)
	
	local O_pal = Panel(Rect(0, 0, OO_panel2.width, 42))
	O_pal.color = Color(204, 61, 61)
	OO_panel2.AddChild(O_pal)
	
	local O_but = Button(' <color=#FFE400>유저검색</color>', Rect(0, 0, 100, O_pal.height))
	O_but.textSize = 22
	O_but.textAlign = 3
	O_but.color = Color(255, 100, 100, 255)
	O_pal.AddChild(O_but)
	
	local CloseButton = Button('✖', Rect(Garo-42, 0, 42, 42))
	CloseButton.textSize = 26
	CloseButton.textAlign = 4
	CloseButton.color = Color(87, 87, 87)
	OO_panel2.AddChild(CloseButton)
	CloseButton.onClick.Add(function()
		OO_panel.Destroy()
		OO_panel = nil
	end)
	
	local big_panel = Panel(Rect(0, O_pal.height, OO_panel2.width, 5+#T*39))
	big_panel.color = Color(103, 0, 0)
	
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(0, O_pal.height, OO_panel2.width, OO_panel2.height-O_pal.height)
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = false
	scroll_panel.content = big_panel
	OO_panel2.AddChild(scroll_panel)
	
	local txt0 = InputField(Rect(100, 0, (O_pal.width-142)/3, O_pal.height))
	txt0.textSize = 18
	txt0.textAlign = 4
	txt0.placeholder = 'user name'
	O_pal.AddChild(txt0)
	
	local o={p={}, t={}, b={}}
	for i, v in ipairs(T) do
		o.p[i] = Panel(Rect(5, 5+39*(i-1), big_panel.width-10, 34))
		o.p[i].color = Color(54, 0, 0)
		big_panel.AddChild(o.p[i])
		
		o.t[i] = Text(v, Rect(5, 0, o.p[i].width-5, o.p[i].height))
		o.t[i].textSize = 17
		o.p[i].AddChild(o.t[i])
		
		o.b[i] = Button('언밴', Rect(o.p[i].width-o.p[i].height*1.7, 0, o.p[i].height*1.7, o.p[i].height))
		o.b[i].textSize = 16
		o.b[i].textAlign = 4
		o.b[i].color = Color(0, 111, 111)
		o.p[i].AddChild(o.b[i])
		
		o.b[i].onClick.Add(function()
			Client.ShowYesNoAlert('정말 언밴하시겠습니까?', function(a)
				if a == 1 then
					Client.FireEvent("언밴이다", v, i)
					OO_panel.Destroy()
					OO_panel = nil
				end
			end)
		end)
	end
	
	O_but.onClick.Add(function()
		local save = {}
		for i, v in ipairs(T) do
			if string.find(v, txt0.text) then
				table.insert(save, i)
			end
		end
		for i, v in ipairs(o.p) do
			v.visible = false
		end
		for i, v in ipairs(save) do
			o.p[v].y = 5+39*(i-1)
			o.p[v].visible = true
		end
		big_panel.height = 5+#save*39
	end)
end

Client.GetTopic("send_operation").Add(function(p)
	Operation_UI(Utility.JSONParse(p))
end)

Client.GetTopic("viewStorage").Add(function(TT)
	if Storage_Panel then return end
	local list = Utility.JSONParse(TT)
	
	Storage_Panel = ScrollPanel(Rect(cw/2-185, ch/2-177, 370, 354))
	Storage_Panel.color = Color(41, 41, 41, 180)
	Storage_Panel.content = Storage_Panel
	Storage_Panel.showOnTop = true
	
	local titleText = Text(list.id=='인벤' and '인벤' or list.id.."번 창고", Rect(185-46, 12, 90, 30))
	titleText.textSize = 17
	titleText.textAlign = 1
	Storage_Panel.AddChild(titleText)
	
	local itemPanel = Panel(Rect(0, 0, 336, 5+50*math.ceil(list.size/6)))
	itemPanel.color = Color(100, 100, 100)
	
	local itemScroll = ScrollPanel(Rect(20, 40, 336, 280))
	itemScroll.SetOpacity(0)
	itemScroll.content = itemPanel
	itemScroll.horizontal = false
	itemScroll.showVerticalScrollbar = true
	Storage_Panel.AddChild(itemScroll)
	
	local list_Item, list_Image, level_text, list_Count = {}, {}, {}, {}
	for j, b in ipairs(list.item) do
		list_Item[j] = Button('', Rect(5+50*((j%6==0 and 6 or j%6)-1), 4+50*(math.ceil(j/6)-1), 46, 46))
		list_Item[j].color = Color(43, 43, 43)
		itemPanel.AddChild(list_Item[j])
		list_Image[j] = Image('', Rect(3, 3, list_Item[j].width-6, list_Item[j].height-6))
		list_Image[j].visible = false
		list_Item[j].AddChild(list_Image[j])
		if b.dataID~=0 then
			list_Image[j].SetImageID(Client.GetItem(b.dataID).imageID)
			list_Image[j].visible = true
		end
		level_text[j] = Text(b.level~=0 and '<color=#00FF00>+'..b.level..'</color>' or '', Rect(0, 0, list_Item[j].width, list_Item[j].height))
		level_text[j].textAlign = 0
		level_text[j].textSize = 12
		list_Image[j].AddChild(level_text[j])
		
		list_Count[j] = Text(b.count, Rect(0, 0, list_Item[j].width-4, list_Item[j].height-4))
		list_Count[j].textAlign = 8
		list_Count[j].textSize = 12
		list_Image[j].AddChild(list_Count[j])
		
		list_Item[j].onClick.Add(function()
			if hi_but then return end
			local mouse = Input.mousePositionToScreen
			hi_but = Button('모두 회수', Rect(mouse.x, mouse.y, 120, 50))
			hi_but.textSize = 20
			hi_but.color = Color(0, 0, 0, 255)
			hi_but.showOnTop = true
			Client.RunLater(function()
				if hi_but then
					hi_but.Destroy()
					hi_but = nil
				end
			end, 1.2)
			hi_but.onClick.Add(function()
				if b.dataID~= 0 then
					Client.ShowYesNoAlert('선택한 아이템 : '..Client.GetItem(b.dataID).name..'\n모두 회수하시겠습니까?', function(a)
						if a == 1 then
							Client.FireEvent("아이템내놔", list.name, b.id, list.id, j)
							list_Item[j].visible = false
							if hi_but then
								hi_but.Destroy()
								hi_but = nil
							end
						end
					end)
				end
			end)
		end)
	end
	
	local closeButton = Button("닫 기", Rect(370/2-50, 354-30-8, 100, 30))
	closeButton.textSize = 18
	closeButton.color = Color(81, 81, 81, 255)
	closeButton.onClick.Add(function()
		Storage_Panel.Destroy()
		Storage_Panel = nil
	end)
	Storage_Panel.AddChild(closeButton)
end)


Client.GetTopic("밴당한놈들").Add(function(TEXT)
	ban_list_panel(Utility.JSONParse(TEXT))
end)








