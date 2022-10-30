local function UI_Button(Q, W, R, T, Item_button, Item_image)
	for i, p in pairs(Q) do
		Item_button[i].onClick.Add(function()
			if Item_button[i].color.r == RGB then
				Item_button[i].color = blue_COLOR
				Item_image[i].SetOpacity(100)
			elseif Item_button[i].color.r == 255 then --장착중인 아이템
				
			else
				Item_button[i].color = COLOR
				Item_image[i].SetOpacity(255)
			end
			if UI_Panel ~= nil then
				UI_Panel.Destroy()
				UI_Panel = nil
			end
			UI_Panel = Button("", Rect(Full_panel.x+Full_panel.width+10, 110, 200, 90))
			UI_Panel.color = Color(0, 0, 0, 210)
			UI_Panel.showOnTop = true
			UI_Panel.onClick.Add(function() UI_Panel.Destroy() UI_Panel = nil end)
			UI_Text = Text("", Rect(5, 5, UI_Panel.width-5, UI_Panel.height-5))
			UI_Panel.AddChild(UI_Text)
			local Text01 = " +"..R[i]
			if R[i] == 0 then Text01 = "" end
			UI_Text.text = Client.GetItem(p).name..Text01
			UI_Text.textAlign = 0
			UI_Text.textSize = 17
			
			UI_Text02 = Text("", Rect(5, 27, UI_Panel.width-5, UI_Panel.height-5))
			UI_Panel.AddChild(UI_Text02)
			UI_Text02.text = (Client.GetItem(p).canSell and "<color=#A9D0F5>판매가능" or 
				Client.GetItem(p).canSell or "<color=#F5A9A9>판매불가").."</color>\n판매가격 : "..Client.GetItem(p).sellerPrice.."\n"
			UI_Text02.textAlign = 0
			UI_Text02.textSize = 14
			
			UI_Text03 = Text((T[i]:gsub('<color>', '</color>')), Rect(5, 65, UI_Panel.width-5, UI_Panel.height-5))
			UI_Panel.AddChild(UI_Text03)
			UI_Text03.textAlign = 0
			if UI_Text03.text == '' then
				UI_Text03.text = '<color=#BDBDBD>특별옵션 없음</color>'
				UI_Text03.textSize = 12
			else
				
				UI_Text03.text = 
					'<color=#FF00FF><size=15>옵션</size>\n</color><color=#00FFFF>'..
					(T[i]:gsub('<color>', '</color>'))..'</color>'
				UI_Text03.textSize = 13
				local line_break = 1
				local i_su = 0
				local str = T[i]
				
				for j=1, #T[i] do
					local check = string.find(T[i], '\n', line_break)
					if check then
						i_su = i_su + 1
						line_break = check + 1
					else
						break
					end
				end
				UI_Panel.height = UI_Panel.height + i_su*15
				UI_Text03.height = UI_Text03.height + i_su*15
			end
		end)
	end
end

local function sooni_mon(Q, W, E, R, T, Eq)
	if Full_panel ~= nil then return end
	RGB = 111
	classic_RGB = 150
	COLOR = Color(RGB, RGB, RGB, 255)
	blue_COLOR = Color(160, 220, 235, 255)
	classic_COLOR = Color(classic_RGB, classic_RGB, classic_RGB, 255)
	red_color = Color(255, 167, 167, 255)
	local Garo = 420
	local Sero = 350
	Full_panel = ScrollPanel()
	Full_panel.content = Full_panel
	Full_panel.rect = Rect(Client.width/2-Garo/2, Client.height/2-Sero/2, Garo, Sero)
	Full_panel.color = Color(87, 87, 87, 255)
	
	local Close_button = Button('✖', Rect(Full_panel.width-36, 0, 36, 36))
	Close_button.color = Color(87, 87, 87, 255)
	Close_button.textAlign = 4
	Close_button.textSize = 23
	Close_button.onClick.Add(function()
	--[[
		Full_panel.DOScale(Point(0.01, 0.01), 0.2)
		Full_panel.DOMove(Point(whole_panel.x+whole_panel.width-43*3+20, whole_panel.y+20), 0.2)
	
		Client.RunLater(function()
		]]
			Full_panel.Destroy()
			Full_panel = nil
		--end, 0.2)
		if UI_Panel ~= nil then
			UI_Panel.Destroy()
			UI_Panel = nil
		end
	end)
	
	local Full_panel_text = Text(" ✪ 편리한 가방", Rect(0, -7, 250, 50))
	Full_panel_text.textSize = 22
	
	local Assi_panel = Panel()
	Assi_panel.rect = Rect(0, 0, Garo-30, Sero-110)
	Assi_panel.color = Color(63, 63, 63, 255)
	
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(5, 81, Garo-10, Sero-130)
	scroll_panel.color = classic_COLOR

	scroll_panel.AddChild(Assi_panel)
	scroll_panel.content = Assi_panel
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = true
	
	Full_panel.AddChild(scroll_panel)
	Full_panel.AddChild(Full_panel_text)
	Full_panel.AddChild(Close_button)
	Full_panel.showOnTop = true
	
	local menu_button = {}
	for i=1, 6 do
		menu_button[i] = Button('', Rect((57.5)*(i-1)+5, 37, 52.5, 40))
		Full_panel.AddChild(menu_button[i])
		menu_button[i].color = classic_COLOR
		menu_button[i].textAlign = 4
		menu_button[i].textSize = 16
	end
	menu_button[1].color = blue_COLOR
	
	Tip_button = Button('TIP', Rect((57.5)*6+5, 37, 52.5, 40))
	Full_panel.AddChild(Tip_button)
	Tip_button.color = classic_COLOR
	Tip_button.textAlign = 4
	Tip_button.textSize = 16
	Tip_button.onClick.Add(function()
		Client.ShowAlert("수량이 부족하여 편리한 가방에 있는 아이템이 사라져도 실제 인벤에 영향이 있지는 않음.")
	end)
	
	local key_button = {}
	for i=1, 6 do
		key_button[i] = Button('', Rect(69*(i-1)+5, Sero-45, 64, 40))
		Full_panel.AddChild(key_button[i])
		key_button[i].color = classic_COLOR
		key_button[i].textAlign = 4
		key_button[i].textSize = 16
	end
	
	for i=1, 6 do
		menu_button[i].onClick.Add(function()
			menu_button[i].color = blue_COLOR
			for j=1, 6 do
				if i ~= j then
					menu_button[j].color = classic_COLOR
				end
			end	
		end)
		key_button[i].onClick.Add(function()
			key_button[i].color = blue_COLOR
			for j=1, 6 do
				if i ~= j then
					key_button[j].color = classic_COLOR
				end
			end	
		end)
	end
	
	local Item_button = {}
	local streng_text = {}
	local count_text = {}
	local Item_image = {}
	local ItemEq_text = {}
	Assi_panel.height =  5+math.ceil(#Q/7)*55.2
	for i, p in pairs(Q) do
		Item_button[i] = Button('', Rect(5+55*(((i%7==0 and 7) or i%7)-1), 5+55*(math.ceil(i/7)-1), 50, 50))
		Item_button[i].color = COLOR
		Item_image[i] = Image('', Rect(0, 0, Item_button[i].width, Item_button[i].height))
		Item_image[i].SetImageID(Client.GetItem(p).imageID)
		if R[i] ~= 0 then
			streng_text[i] = Text("<color=#00FF00>+"..R[i].."</color>", Rect(0, 0, 50, 15))
			streng_text[i].textSize = 11
			Item_image[i].AddChild(streng_text[i])
		end
		if Eq[i] then
			ItemEq_text[i] = Text("<color=#00FF00>E</color>", Rect(0, 0, 50, 15))
			ItemEq_text[i].textAlign = 2
			ItemEq_text[i].textSize = 12
			Item_image[i].AddChild(ItemEq_text[i])
			Item_button[i].color = red_color
		elseif not Client.GetItem(p).canSell then
			Item_button[i].color = red_color
		end
		count_text[i] = Text(E[i], Rect(0, 37, 50, 15))
		count_text[i].textAlign = 2
		count_text[i].textSize = 11
		Item_button[i].AddChild(Item_image[i])
		Assi_panel.AddChild(Item_button[i])
		Item_image[i].AddChild(count_text[i])
	end
	UI_Button(Q, W, R, T, Item_button, Item_image)
	
	menu_button[1].text = 'ALL'
	menu_button[1].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			if E[i] then
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
				Item_button[i].visible = true
			end
		end
		Assi_panel.height =  5+math.ceil(jk/7)*55.2
	end)
	
	menu_button[2].text = '무기'
	menu_button[2].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			if Client.GetItem(p).type == 2 and E[i] then
				Item_button[i].visible = true
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
			else
				Item_button[i].visible = false
			end
		end
		Assi_panel.height =  5+math.ceil(jk/7)*55.2
	end)
	
	menu_button[3].text = '방어구'
	menu_button[3].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			local Item = Client.GetItem(p).type
			if (Item == 0 or Item == 1 or Item == 3 or Item == 4) and E[i] then
				Item_button[i].visible = true
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
			else
				Item_button[i].visible = false
			end
		end
		Assi_panel.height =  5+math.ceil(jk/7)*55.2
	end)
	
	menu_button[4].text = '장신구'
	menu_button[4].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			local Item = Client.GetItem(p).type
			if (Item == 5 or Item == 6 or Item == 7) and E[i] then
				Item_button[i].visible = true
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
			else
				Item_button[i].visible = false
			end
		end
		Assi_panel.height =  5+math.ceil(jk/7)*55.2
	end)
	
	menu_button[5].text = '소모품'
	menu_button[5].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			local Item = Client.GetItem(p).type
			if (Item == 8 or Item == 10) and E[i] then
				Item_button[i].visible = true
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
			else
				Item_button[i].visible = false
			end
		end
		Assi_panel.height =  5 +math.ceil(jk/7)*55.2
	end)

	menu_button[6].text = '재료'
	menu_button[6].onClick.Add(function()
		local jk = 0
		for i, p in pairs(Q) do
			local Item = Client.GetItem(p).type
			if Item == 9 and E[i] then
				Item_button[i].visible = true
				jk = jk + 1
				Item_button[i].x = 5+55*(((jk%7==0 and 7) or jk%7)-1)
				Item_button[i].y = 5+55*(math.ceil(jk/7)-1)
			else
				Item_button[i].visible = false
			end
		end
		Assi_panel.height =  5+math.ceil(jk/7)*55.2
	end)
	
	key_button[1].text = '초기화'
	key_button[1].onClick.Add(function()
		for i, p in pairs(Q) do
			Item_button[i].color = COLOR
			Item_image[i].SetOpacity(255)
			if Eq[i] or not Client.GetItem(p).canSell then
				Item_button[i].color = red_color
			end
		end
	end)
	
	local Input_text = nil
	key_button[2].text = '숫자입력'
	key_button[2].onClick.Add(function()
		if Input_text then return end
		Input_text = InputField(Rect(0, 0, key_button[3].width, key_button[3].height))
		Input_text.textSize = 14
		Input_text.textAlign = 4
		Input_text.color = Color(255, 255, 255, 255)
		Input_text.placeholder = "<size=10><color=#FFFFFF>숫자입력\n하세요...</color></size>"
		key_button[3].AddChild(Input_text)
	end)
	
	key_button[3].onClick.Add(function()
		if Input_text then return end
		Input_text = InputField(Rect(0, 0, key_button[3].width, key_button[3].height))
		Input_text.textSize = 14
		Input_text.textAlign = 4
		Input_text.color = Color(255, 255, 255, 255)
		Input_text.placeholder = "<size=10><color=#FFFFFF>숫자입력\n하세요...</color></size>"
		key_button[3].AddChild(Input_text)
	end)
	
	key_button[4].text = '판매'
	key_button[4].onClick.Add(function()
		local txt = ''
		if Input_text ~= nil then
			txt = string.sub(Input_text.text, string.find(Input_text.text, '%d+')) --문자열을 제외하고 숫자만 가져옴
		else
			Client.ShowAlert('숫자를 입력해주세요.')
			return
		end
		if Input_text.text ~= txt or Input_text.text == '' or tonumber(txt) == nil then 
		--본래 적은 문자와 txt를 비교해서 다르거나, 빈칸이거나, 문자열이라 tonumber가 안되면 nil값을 반환해서 종료
			Client.ShowAlert('숫자만 입력해주세요.')
			Input_text.text = txt
			return
		end
		Client.ShowYesNoAlert("선택한 아이템을 판매하시곘습니까?", function(a)
			if a == 1 then
				local real_item = {}
				local save_count = {}
				for i, p in pairs(Q) do
					if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
						if tonumber(count_text[i].text) <  tonumber(txt) then
							Client.ShowAlert('실제 가진 수량보다 입력한 수량이 더 많습니다.')
							return
						end
					end
				end
				for i, p in pairs(Q) do
					if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
						table.insert(real_item, W[i])
						table.insert(save_count, E[i])
						count_text[i].text = tonumber(count_text[i].text)-tonumber(txt)
						E[i] = tonumber(count_text[i].text)
						if E[i] <= 0 then
							E[i] = false
							Item_button[i].visible = false
						end
					end
					if Eq[i] or not Client.GetItem(p).canSell then
						Item_button[i].color = red_color
					else
						Item_button[i].color = COLOR
						Item_image[i].SetOpacity(255)
					end
					if UI_Panel ~= nil then
						UI_Panel.Destroy()
						UI_Panel = nil
					end
				end
				if #real_item >= 1 then
					Client.FireEvent("selling_end", Utility.JSONSerialize(real_item), tonumber(txt))
				else
					Client.ShowAlert('선택하신 아이템이 없습니다.')
				end
			end
		end)
	end)
	
	key_button[5].text = '모두판매'
	key_button[5].onClick.Add(function()
		Client.ShowYesNoAlert("선택한 아이템을 판매하시곘습니까?\n<color=#FE2E2E>개수와 상관없이 모두 판매됩니다.</color>", function(a)
			if a == 1 then
				local real_item = {}
				for i, p in pairs(Q) do
					if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
						table.insert(real_item, W[i])
						E[i] = false
						Item_button[i].visible = false
					end
					if Eq[i] or not Client.GetItem(p).canSell then
						Item_button[i].color = red_color
					else
						Item_button[i].color = COLOR
						Item_image[i].SetOpacity(255)
					end
					if UI_Panel ~= nil then
						UI_Panel.Destroy()
						UI_Panel = nil
					end
				end
				if #real_item >= 1 then
					Client.FireEvent("selling_end2", Utility.JSONSerialize(real_item))
				else
					Client.ShowAlert('선택하신 아이템이 없습니다.')
				end
			end
		end)
	end)
	
	key_button[6].text = '종류판매'
	key_button[6].onClick.Add(function()
		local real_item = {}
		local real_dataID = 0
		for i, p in pairs(Q) do
			if Item_button[i].color.r == blue_COLOR.r and Item_button[i].visible then
				table.insert(real_item, Q[i])
				real_dataID = p
			end
		end
		if #real_item ~= 1 then
			Client.ShowAlert('아이템 하나만 선택 가능합니다.')
			return
		end
		Client.ShowYesNoAlert("선택한 아이템을 판매하시곘습니까?\n<color=#FE2E2E>선택하신 아이템이 모두 판매됩니다.\n종류판매는 장착된 아이템도 판매됩니다.</color>", function(a)
			if a == 1 then
				for i, p in pairs(Q) do
					if real_dataID == p and Item_button[i].visible then
						E[i] = false
						Item_button[i].visible = false
					end
					if Eq[i] or not Client.GetItem(p).canSell then
						Item_button[i].color = red_color
					else
						Item_button[i].color = COLOR
						Item_image[i].SetOpacity(255)
					end
					if UI_Panel ~= nil then
						UI_Panel.Destroy()
						UI_Panel = nil
					end
				end
				Client.FireEvent("selling_end3", real_item[1])
			end
		end)
	end)
end



--[[
function UI_Appear(ad)
	ad.Destroy()
end
]]

Client.GetTopic("selling_start").Add(function(Q, W, E, R, T, Eq)
	local dataID = Utility.JSONParse(Q)
	local ID = Utility.JSONParse(W)
	local count = Utility.JSONParse(E)
	local level = Utility.JSONParse(R)
	local UI_str = Utility.JSONParse(T)
	local IsEquippedItem = Utility.JSONParse(Eq)
	
	sooni_mon(dataID, ID, count, level, UI_str, IsEquippedItem)
end)