local pal = nil
local txt = nil
local item_pal, item_but, item_img, item_txt = nil, nil, nil, nil
local sold_out_panel, sold_out_text = nil, nil
local data = nil
local function item_shop(T, count, num, T2, var)
	if pal then return end
	data = T
	
	pal = Panel(Rect(0, 0, 190, 240))
	pal.color = Color(0, 0, 0)
	pal.showOnTop = true
	pal.anchor = 4
	pal.pivotX = 0.5
	pal.pivotY = 0.5
	
	local line = 1
	local line2= line*2
	local CloseButton = Button('✖', Rect(pal.width+line, 0, 36, 36))
	CloseButton.textSize = 24
	CloseButton.textAlign = 4
	CloseButton.color = Color(0, 0, 0, 255)
	pal.AddChild(CloseButton)
	CloseButton.onClick.Add(function()
		pal.Destroy()
		pal = nil
	end)
	
	local Pal = {}
	local color = 15
	Pal[1] = Panel(Rect(line, line, pal.width-line2, pal.height-line2))
	Pal[1].color = Color(color, color, color)
	pal.AddChild(Pal[1])
	local Max = 7
	for i=2, Max do
		local num = i*color
		Pal[i] = Panel(Rect(line, line, Pal[i-1].width-line2, Pal[i-1].height-line2))
		Pal[i].color = Color(num, num, num)
		Pal[i-1].AddChild(Pal[i])
	end
	Pal[Max-1].RemoveChild(Pal[Max])
	
	local img = Image('', Rect(0, 200, 32, 32))
	img.SetImageID(Client.GetItem(num).imageID)
	Pal[Max-1].AddChild(img)
	
	txt = Text(count, Rect(line2+32, img.y, 100, 32))
	txt.textAlign = 3
	Pal[Max-1].AddChild(txt)
	
	local scroll_panel = ScrollPanel(Rect(Pal[Max].x, Pal[Max].y, Pal[Max].width, 200))
	scroll_panel.horizontal = false
	scroll_panel.content = Pal[Max]
	Pal[Max-1].AddChild(scroll_panel)
	
	Pal[Max].x = 0
	Pal[Max].y = 0
	Pal[Max-1].color = Color(58, 58, 58)
	
	item_pal, item_but, item_img, item_txt = {}, {}, {}, {}
	sold_out_panel, sold_out_text = {}, {}
	local hei = 40
	local name = Client.GetItem(num).name
	for i, v in ipairs(T) do
		item_pal[i] = Panel(Rect(line2, line2+(hei+line2)*(i-1), Pal[Max].width-line2*2, hei))
		item_pal[i].color = Color(86, 86, 86)
		Pal[Max].AddChild(item_pal[i])
		
		item_but[i] = Button('', Rect(0, 0, item_pal[i].width, item_pal[i].height))
		item_but[i].color = Color(0, 0, 0, 0)
		item_pal[i].AddChild(item_but[i])
		
		item_img[i] = Image('', Rect(line2, line2, hei-line2*2, hei-line2*2))
		item_img[i].SetImageID(Client.GetItem(v.id).imageID)
		item_but[i].AddChild(item_img[i])
		
		item_txt[i] = Text(Client.GetItem(v.id).name..'\n<color=#FAAC58><size=12>'..name..':'..v.cost..'개</size></color>', Rect(hei, line2, item_pal[i].width-hei, hei-line2*2))
		item_txt[i].textAlign = 0
		item_but[i].AddChild(item_txt[i])
		
		item_but[i].onClick.Add(function()
			Client.ShowYesNoAlert(Client.GetItem(v.id).desc..'\n구매하시겠습니까?', function(a)
				if a==1 then
					Client.FireEvent('정수상점_구매시도', i, var)
				end
			end)
		end)
		
		sold_out_panel[i] = Panel(Rect(0, 0, item_pal[i].width, item_pal[i].height))
		sold_out_panel[i].color = Color(0, 0, 0, 100)
		item_pal[i].AddChild(sold_out_panel[i])
		
		sold_out_text[i] = Text('<color=#FAAC58>품 절</color>', Rect(0, 0, sold_out_panel[i].width, sold_out_panel[i].height))
		sold_out_text[i].textAlign = 4
		sold_out_text[i].textSize = 24
		sold_out_panel[i].AddChild(sold_out_text[i])
		sold_out_panel[i].visible = T2[i]
	end
	Pal[Max].height = line2+(hei+line2)*#T
end

Client.GetTopic("정수상점_start").Add(function(T, count, num, T2, var)
	item_shop(Utility.JSONParse(T), count, num, Utility.JSONParse(T2), var)
end)

Client.GetTopic("정수상점_구매실패").Add(function()
	Client.ShowAlert('구매 실패하였습니다.')
end)

Client.GetTopic("정수상점_구매성공").Add(function(num, count)
	sold_out_panel[num].visible = true
	txt.text = count
end)

Client.GetTopic("정수상점_data").Add(function()
	Client.FireEvent('정수상점_data')
end)

















