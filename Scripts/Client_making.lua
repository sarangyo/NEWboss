function bll()
	garfa = Panel(Rect(0, 0,  Client.width + 1, Client.height))
	garfa.showOnTop = true
	garfa.color = Color(000 ,000 ,000,  50) 
	local garfatext=Text("Loading",Rect(Client.width/2-70,200,300,50))
	garfatext.textSize = 35
    garfa.AddChild(garfatext)
end

function make_Up()
	Client.FireEvent("make:Up")
	bll()
end
Client.GetTopic('make_Up').Add(make_Up)

local a, b, c, d = 1, 1, 1, 1

local ItemType = {'모자', '갑옷', '무기', '방패', '신발', '반지', '악세서리', '날개', '포션', '재료', '소모품'}


function C_commaValue(n)
	local left,num,right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end
 

local path = 'Pictures/MakeUI/'
Client.GetTopic("make:down").Add(function(MenuName, MenuList, ItemCount, UnitGold)
	local data = {}
	data.ItemMakerMenu = nil
	data.ItemMakerCount = nil
	data.ItemMakerCountMin = nil
	data.ItemMakerDataID = nil
	data.ItemMakerVar = nil

	data.MenuName = json.parse(MenuName)
	data.MenuList = json.parse(MenuList)
	data.ItemCount = json.parse(ItemCount)
	data.cw = Client.width
	data.ch = Client.height
	data.Garo = 750 --650
	data.Sero = 400

	data.blick = Panel(Rect(0, 0, Client.width, Client.height))
	data.blick.showOnTop = true

	data.Make_Panel = Panel(Rect(data.cw/2-data.Garo/2, data.ch/2-data.Sero/2, data.Garo, data.Sero))
	data.Make_Panel.color = Color(0, 0, 0, 255)
	data.blick.AddChild(data.Make_Panel)

	data.Make_Panel2 = Panel(Rect(1, 1, data.Make_Panel.width-2, data.Make_Panel.height-2))
	data.Make_Panel2.AddChild(Image(path..'큐브상점 이미지.PNG', Rect(0, 0, data.Garo, data.Sero)))
	data.Make_Panel2.color = Color(66, 66, 66, 255)
	data.Make_Panel.AddChild(data.Make_Panel2)

	local maketext = Text('아이템 제작', Rect(340, -10, 100, 50))
	maketext.textSize = 15
	data.Make_Panel2.AddChild(maketext)
	--data.Make_Panel2.AddChild(Image(path..'Background.png', Rect(0, 0, data.Make_Panel.width-2, data.Make_Panel.height-2)))

	data.CloseButton = Button('닫기', Rect(data.Garo-65, 5, 60, 25))
	data.CloseButton.SetOpacity(0)
	local CloseButtonImg =  Image(path..'취소.PNG', Rect(data.Garo-65, 5, 60, 25))
	data.Make_Panel2.AddChild(CloseButtonImg)
	--data.CloseButton.textSize = 26
	data.CloseButton.textAlign = 4
	data.Make_Panel2.AddChild(data.CloseButton)
	data.CloseButton.onClick.Add(function()
		data.blick.Destroy() data = nil
	end)

	data.main_panel = Panel(Rect(100, 85, 643, 308)) -- 553
	data.main_panel.color = Color(77, 77, 77, 100)
	data.Make_Panel2.AddChild(data.main_panel)

	data.sendPanel = Panel(Rect(315, 90, 210, 268)) -- 190
	--data.sendPanel.setOpacity(0)
	data.Make_Panel2.AddChild(data.sendPanel)

	data.MakerButton = Button("제작",Rect(675, 363.5, 65, 25))
	data.MakerButton.setOpacity(0)

	local makebutton = Image(path..'취소.PNG', Rect(675, 363.5, 65, 25))

	data.Make_Panel.AddChild(makebutton)

	data.MakerButton.onClick.Add(function()
		if data.ItemMakerMenu ~= nil or data.ItemMakerCount ~= nil or data.ItemMakerCountMin ~= nil or 	data.ItemMakerDataID ~= nil then
			Client.ShowYesNoAlert(Client.GetItem(data.ItemMakerDataID).name..'\n'..data.ItemMakerVar..'개 제작 하시겠습니까?'..
			'\n제작 성공 확률 : <color=#74DF00>'..data.MenuList[data.MenuName.main[data.ItemMakerMenu]][data.MenuName.index[tostring(data.ItemMakerMenu)][data.ItemMakerCount]].chance[data.ItemMakerCountMin]..'%</color>', function(result)
				if result == 1 then
					Client.FireEvent("make:MakeUp", data.ItemMakerMenu, data.ItemMakerCount, data.ItemMakerCountMin, data.ItemMakerDataID, data.ItemMakerVar)
					data.blick.Destroy()
					data = nil
					make_Up()
				end
			end)
		end
	end)

	data.Make_Panel.AddChild(data.MakerButton)

	data.inP = Panel(Rect(data.main_panel.width-213, 5, 210, 268)) --253 -- 258
	data.inP.AddChild(Image(path..'내부1.png', Rect(0, 0, 210, 268)))
	data.inP.SetOpacity(0)
	data.main_panel.AddChild(data.inP)
	data.inL = Panel(Rect(0, 0, 205, data.inP.height+30)) -- 285 -- 190
	
	local itempaneling = Image(path..'내부1.png', Rect(5, 5, 205, 298))
	data.main_panel.AddChild(itempaneling)
	

	data.scroll_panel = ScrollPanel(Rect(5, 5, 205, 298))-- 190
	data.scroll_panel.SetOpacity(0)
	data.scroll_panel.horizontal = false
	data.scroll_panel.content = data.inL
	data.main_panel.AddChild(data.scroll_panel)


	data.Choice_Panel = Panel(Rect(5, 85, 90, 308))
	data.Choice_Panel.color = Color(77, 77, 77, 255)
	data.Make_Panel2.AddChild(data.Choice_Panel)

	local moveimg =  Image(path..'90300.png', Rect(0, 0, 90, 308)) ----------------------------------------------------
	data.Choice_Panel.AddChild(moveimg) 

	data.menwscroll_panel = ScrollPanel(Rect(0, 0, 90, 305))
	data.menwscroll_panel.setOpacity(0)
	data.menwscroll_panel.horizontal = false

	data.Choice_Panel.AddChild(data.menwscroll_panel)

	data.WHfektnPanel = Panel(Rect(0, 0, 90, 100 ))
	data.WHfektnPanel.setOpacity(0)


	data.menwscroll_panel.AddChild(data.WHfektnPanel)
	data.menwscroll_panel.content = data.WHfektnPanel

	data.itemScrollPanel = ScrollPanel(Rect(0, 0, 190, 268)) -----아이템
	data.itemScrollPanel.horizontal = false
	data.itemScrollPanel.setOpacity(0)
	data.inP.AddChild(data.itemScrollPanel)

	-- data.itemScrollPaneladd = Panel(Rect(0, 0, 190, 268))-----아이템

	-- data.itemScrollPanel.AddChild(data.itemScrollPaneladd)

	-- data.itemScrollPanel.content = data.itemScrollPaneladd


	data.mainMenuScrollPanel = ScrollPanel(Rect(5, 50, 740, 32))
	local a = Image(path..'740300.png', Rect(5, 50, 740, 32))


	data.mainMenuScrollPanel.setOpacity(0)
	data.mainMenuScrollPanel.vertical = false
	data.mainMenuSon = Panel(Rect(0, 0, 105*(#data.MenuName.main), 32))
	data.mainMenuSon.setOpacity(0)

	data.mainMenuScrollPanel.AddChild(data.mainMenuSon)

	data.mainMenuScrollPanel.content = data.mainMenuSon
	data.Make_Panel.AddChild(a) 
	data.Make_Panel.AddChild(data.mainMenuScrollPanel) 
	data.happy_panel = {} data.MainMenuButton = {} data.happy_but = {}  data.Choice_but = {} data.happy_butImg = {} data.happy_butSetimG = {}

	data.bagic2 = Color(111, 111, 111, 255)


	for i = 1, #data.MenuName.main do
		local img =  Image(path..'취소.PNG', Rect(5+100*(i-1), 0, 90, 32))

		data.MainMenuButton[i] = Button(data.MenuName.main[i], Rect(5+100*(i-1), 0, 90, 32))
		

		data.MainMenuButton[i].setOpacity(0)

		data.mainMenuSon.AddChild(img)
		data.mainMenuSon.AddChild(data.MainMenuButton[i])

		data.MainMenuButton[i].onClick.Add(function()
			--a, b, c, d = 1, 1, 1, 1
			c = i
			d = i
			a = 1
			b = 1

			text3(data, i, UnitGold)
			return
		end)
	end
	text3(data, d, UnitGold)
	garfa.Destroy() garfa = nil
end)


function text3(data, i, UnitGold)

	data.WHfektnPanel.rect = Rect(0, 0, 90, 5+37*(#data.MenuName.index[tostring(i)]))


	data.ItemMakerMenu = nil
	data.ItemMakerCount = nil

	for k, n in pairs(data.Choice_but) do
		data.happy_butImg[k].Destroy()
		n.Destroy()
	end

	for n = 1, #data.MenuName.main do
		data.MainMenuButton[n].text = '<color=#FFFFFF>'..data.MenuName.main[n]..'</color>'
	end
	data.MainMenuButton[i].text = '<color=#01A9DB>'..data.MenuName.main[i]..'</color>'

	if asd then asd.Destroy() asd = nil  end
	for n = 1, #data.MenuName.index[tostring(i)] do

		data.happy_butImg[n] =  Image(path..'취소.PNG', Rect(5, 5+37*(n-1), 80, 32))

		data.Choice_but[n] = Button(data.MenuName.index[tostring(i)][n], Rect(5, 5+37*(n-1), 80, 32))
		data.Choice_but[n].setOpacity(0)
		data.Choice_but[n].textSize = 14
		data.Choice_but[n].textAlign = 4
		data.WHfektnPanel.AddChild(data.happy_butImg[n])
		data.WHfektnPanel.AddChild(data.Choice_but[n])

		data.Choice_but[n].onClick.Add(function()
			a = n
			c = i
			b = 1
			test(data, n, i, UnitGold)
			return
		end)
	end
	test(data, a, c, UnitGold)
end


function CountCheck(text)
	if text <= 0 then
		return false
	end
end


function test(data, bb, i, UnitGold)
	if not data.MenuName.index[tostring(i)][bb] then
		a = 1
		b = 1
		bb = 1
	end

	data.ItemMakerMenu = nil
	data.ItemMakerCount = nil
	data.ItemMakerCountMin = nil
	data.ItemMakerDataID = nil
	if asd then asd.Destroy() asd = nil end

	for n = 1, #data.MenuName.index[tostring(i)] do
		data.Choice_but[n].text = '<color=#FFFFFF>'..data.MenuName.index[tostring(i)][n]..'</color>'
	end
	data.Choice_but[bb].text = '<color=#01A9DB>'..data.MenuName.index[tostring(i)][bb]..'</color>'

	for k, n in pairs(data.happy_but) do
		data.happy_butSetimG[k].Destroy()
		n.Destroy()
	end

	data.inL.rect = Rect(0, 0, 205, 45*#data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].dataID)

	for j, n in pairs(data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].dataID) do
		data.happy_but[j] = Button('', Rect(5, 5+45*(j-1), data.inL.width-10, 40))
		data.happy_but[j].color = Color(0, 0, 0, 0)

		data.happy_butSetimG[j]= Image(path..'상점2.png', Rect(5, 5+45*(j-1), data.inL.width-10, 40))
		--				data.happy_but[j].setOpacity(100)
		-- data.happy_panel[j] = Panel(Rect(0, 0, data.happy_but[j].width, data.happy_but[j].height))
		-- --data.happy_panel[j].color = bagic
		-- data.happy_but[j].AddChild(data.happy_panel[j])
		data.inL.AddChild(data.happy_butSetimG[j])
		data.inL.AddChild(data.happy_but[j])

		local icon_panel = Panel(Rect(1, 1, data.happy_but[j].height-2, data.happy_but[j].height-2))
		icon_panel.setOpacity(100) --- 0
		data.happy_but[j].AddChild(icon_panel)

		local happy_image = Image('', Rect(0, 0, icon_panel.width, icon_panel.height))
		happy_image.SetImageID(Client.GetItem(n).imageID)
		icon_panel.AddChild(happy_image)

		local happy_text = Text(Client.GetItem(n).name, Rect(icon_panel.width+7, 0, data.happy_but[j].width-icon_panel.width-10, data.happy_but[j].height))
		happy_text.textSize = 14
		happy_text.textAlign = 3
		data.happy_but[j].AddChild(happy_text)

		data.happy_but[j].onClick.Add(function()
			--j = 1
			test2(data, i, j, n, UnitGold, bb)
			b = j
		end)
		if j == b then
			test2(data, i, b, n, UnitGold, bb)
		end
	end
end




function test2(data, i, j, n, UnitGold, bb)

	--data.happy_but[j].setOpacity(0)

	--print(i, j, n)
	local ItemCountVar = 1

	data.ItemMakerMenu = i
	data.ItemMakerCount = bb
	data.ItemMakerCountMin = j
	data.ItemMakerDataID = n
	data.ItemMakerVar = ItemCountVar

	local data2 = {}
	data2.ItemCount = {}
	data2.NowItemCoeuntText = {}
	data2.ItemCoeuntText = {}

	if asd then asd.Destroy() asd = nil  end
	asd = Panel(Rect(0, 0, 210, 268))
	asd.AddChild(Image(path..'거래소구매이미지.png', Rect(0, 0, 210, 268)))
	data.sendPanel.AddChild(asd)

	data2.ItemPanel = Panel(Rect(75, 10, 60, 60))

	data2.ItemPanel.AddChild(Image(path..'아이템.png', Rect(0, 0, 60, 60)))

	asd.AddChild(data2.ItemPanel)

	data2.ItemImage = Image("", Rect(5, 5, 50, 50))
	data2.ItemImage.SetImageID(Client.GetItem(n).imageID)
	data2.ItemPanel.AddChild(data2.ItemImage)

	data2.ItemText = Text(Client.GetItem(n).name,Rect(-64, 63, 190, 25))
	data2.ItemText.textAlign = 1
	data2.ItemText.textSize = 14
	data2.ItemPanel.AddChild(data2.ItemText)

	----------아이템 정보창

	local a = Image(path..'내부1.png', Rect(5, 95, 200, 167))
	asd.AddChild(a)

	data2.sendPanelscroll_panel = ScrollPanel(Rect(5, 95, 200, 167))
	data2.sendPanelscroll_panel.setOpacity(0)
	data2.sendPanelscroll_panel.horizontal = false
	asd.AddChild(data2.sendPanelscroll_panel)

	data2.ItemTextPanel = Panel(Rect(0, 0, 204, 500))
	data2.sendPanelscroll_panel.AddChild(data2.ItemTextPanel)
	data2.sendPanelscroll_panel.content = data2.ItemTextPanel


	data2.ItemDescText = Text('종류:'..ItemType[Client.GetItem(n).type+1].."\n"..(Client.GetItem(n).canTrade == false and 
		"<color=#FE2E2E>거래 불가능</color>\n" or 
		"<color=#58D3F7>거래 가능</color>\n")..Client.GetItem(n).desc, Rect(5, 5, 204, 500))
	data2.ItemDescText.textSize = 13.5
	data2.ItemDescText.textAlign = 0

	data2.ItemTextPanel.AddChild(data2.ItemDescText)
		
	----------아이템 정보창

	data2.itemScrollPanel = ScrollPanel(Rect(215, 0, 210, 265)) -----아이템
	data2.itemScrollPanel.horizontal = false
	data2.itemScrollPanel.setOpacity(0)
	asd.AddChild(data2.itemScrollPanel)

	-- local a = Image(path..'아이템1.png', Rect(215, 0, 300, 268))

	-- data.itemScrollPanel.AddChild(a)
	

	--print(json.serialize(data.MenuList[data.MenuName[i]]))

	--print(json.serialize(data.MenuList[data.MenuName.index[tostring(i)]]))

	
--print(json.serialize(data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][b]].itemdataID))
	--print(json.serialize(data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][j]]))
	-- print(json.serialize(data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][j]].itemdataID[tostring(j)]))
	

	data2.itemScrollPaneladd = Panel(Rect(0, 0, 210, 5+(2+#data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].itemdataID[tostring(j)])*62))-----아이템
	data2.itemScrollPaneladd.setOpacity(0)
	data2.itemScrollPanel.AddChild(data2.itemScrollPaneladd)
	data2.itemScrollPanel.content = data2.itemScrollPaneladd

	data2.ItemCount[1] = Panel(Rect(5, 5, 200, 60))
	data2.ItemCount[1].setOpacity(255)
	data2.itemScrollPaneladd.AddChild(data2.ItemCount[1])

	data2.ItemCount[1].AddChild(Image(path..'상점3.png',Rect(0, 0, 200, 60)))
	
	local img = Image(path..'Item_0091.png', Rect(10, 12.5, 35, 35))
	data2.ItemCount[1].AddChild(img)
	
	local yy = 7
	local ItemText = Text("<color=#D7DF01>골드</color>",Rect(50, yy, 139, 30))
	ItemText.textAlign = 0
	ItemText.textSize = 12
	data2.ItemCount[1].AddChild(ItemText)

	local NowItemCount = UnitGold >= data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].gold[j] and 
		'<color=#00FFFF>'..C_commaValue(UnitGold)..'</color>' or 
		'<color=#FE2E2E>'..C_commaValue(UnitGold)..'</color>'

	data2.ItemCoeuntText[1] = Text('<color=#D8D8D8>소지:</color>'..NowItemCount ,Rect(50, yy+15, 139, 30))
	data2.ItemCoeuntText[1].textAlign = 0
	data2.ItemCoeuntText[1].textSize = 11
	data2.ItemCount[1].AddChild(data2.ItemCoeuntText[1])


	data2.NowItemCoeuntText[1] = Text('<color=#D8D8D8>필요:</color>'..C_commaValue(data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].gold[j]), Rect(50, yy+30, 139, 30))
	data2.NowItemCoeuntText[1].textAlign = 0
	data2.NowItemCoeuntText[1].textSize = 11
	data2.ItemCount[1].AddChild(data2.NowItemCoeuntText[1])

	data2.ItemCount[2] = Panel(Rect(5, 67, 200, 60))
	data2.itemScrollPaneladd.AddChild(data2.ItemCount[2])

	data2.ItemCount[2].AddChild(Image(path..'상점3.png',Rect(0, 0, 200, 60)))

	local ItemText = Text("제작 성공 확률",Rect(50, yy, 139, 30))
	ItemText.textAlign = 0
	ItemText.textSize = 12
	data2.ItemCount[2].AddChild(ItemText)

	local img = Image(path..'캡처 (1).png', Rect(7.5, 10, 40, 40))
	--img.textSize = 30
	data2.ItemCount[2].AddChild(img)


	local ItemCoeuntText = Text('<color=#D8D8D8>성공 확률:</color><color=#74DF00>'..data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].chance[j]..'%'..'</color>', Rect(50, yy+15, 139, 30))
	ItemCoeuntText.textAlign = 0
	ItemCoeuntText.textSize = 11
	data2.ItemCount[2].AddChild(ItemCoeuntText)
	
	local t1 = data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]]
	local J = tostring(j)
	local t2 = data.ItemCount[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]]
	for k = 3, 2+#t1.itemdataID[J] do

		data2.ItemCount[k] = Panel(Rect(5, 5+((k-1)*60)+((k-1)*2), 200, 60))
		data2.ItemCount[k].AddChild(Image(path..'상점3.png',Rect(0, 0, 200, 60)))
		data2.itemScrollPaneladd.AddChild(data2.ItemCount[k])

		local img = Image("", Rect(10, 12.5, 35, 35))
		img.SetImageID(Client.GetItem(t1.itemdataID[J][k-2]).imageID)
		data2.ItemCount[k].AddChild(img)

		local ItemText = Text(Client.GetItem(t1.itemdataID[J][k-2]).name,Rect(50, yy, 139, 30))
		ItemText.textAlign = 0
		ItemText.textSize = 12
		data2.ItemCount[k].AddChild(ItemText)

		local NowItemCount = t2.data[J][k-2] >= t1.itemcount[J][k-2] and 
			'<color=#00FFFF>'..C_commaValue(t2.data[J][k-2])..'</color>' or 
			'<color=#FE2E2E>'..C_commaValue(t2.data[J][k-2])..'</color>'

		data2.ItemCoeuntText[k-1] = Text('<color=#D8D8D8>소지:</color>'..NowItemCount ,Rect(50, yy+15, 139, 30))
		data2.ItemCoeuntText[k-1].textAlign = 0
		data2.ItemCoeuntText[k-1].textSize = 11
		data2.ItemCount[k].AddChild(data2.ItemCoeuntText[k-1])

		data2.NowItemCoeuntText[k-1] = Text('<color=#D8D8D8>필요:</color>'..C_commaValue(t1.itemcount[J][k-2]), Rect(50, yy+30, 139, 30))
		data2.NowItemCoeuntText[k-1].textAlign = 0
		data2.NowItemCoeuntText[k-1].textSize = 11
		data2.ItemCount[k].AddChild(data2.NowItemCoeuntText[k-1])
	end
	data2.CountPanel = Panel(Rect(250, 272.5, 100, 25))
	data2.CountPanel.setOpacity(120)
	asd.AddChild(data2.CountPanel)

	data2.CountPanelText = Text(ItemCountVar, Rect(10, 5, 80, 25))
	data2.CountPanelText.textSize = 12
	data2.CountPanelText.textAlign = 1

	data2.CountPanel.AddChild(data2.CountPanelText)
--[[
	data2.PlusButtonX10 = Button('+1', Rect(175, 272.5, 65, 25))
	local PlusButtonX10Img =  Image(path..'취소.PNG',Rect(175, 272.5, 65, 25))
	asd.AddChild(PlusButtonX10Img)
	data2.PlusButtonX10.setOpacity(0)
	data2.PlusButtonX10.textSize = 12
	asd.AddChild(data2.PlusButtonX10)

	data2.PlusButtonX10.onClick.Add(function()
		if ItemCountVar >= 10 then
			return false
		end
		ItemCountVar = ItemCountVar + 1
		data2.CountPanelText.text = ItemCountVar
		data.ItemMakerVar = ItemCountVar
		CountUpData(data2.NowItemCoeuntText, t1.gold[j], t1.itemcount[J], ItemCountVar, UnitGold, data2.ItemCoeuntText, t2.data[J])
	end)
]]
	data2.PlusButtonX100 = Button('+10', Rect(175, 272.5, 65, 25))
	local PlusButtonX100 =  Image(path..'취소.PNG',Rect(175, 272.5, 65, 25))
	asd.AddChild(PlusButtonX100)
	data2.PlusButtonX100.setOpacity(0)
	data2.PlusButtonX100.textSize = 12
	asd.AddChild(data2.PlusButtonX100)

	data2.PlusButtonX100.onClick.Add(function()
		--[[if ItemCountVar >= 900 then
			return false
		end]]
		--ItemCountVar = ItemCountVar + 100
		ItemCountVar = 10
		data2.CountPanelText.text = ItemCountVar
		data.ItemMakerVar = ItemCountVar
		CountUpData(data2.NowItemCoeuntText, t1.gold[j], t1.itemcount[J], ItemCountVar, UnitGold, data2.ItemCoeuntText, t2.data[J])
	end)
	
	data2.ResetButton = Button('Reset', Rect(100, 272.5, 65, 25))
	local ResetButton =  Image(path..'취소.PNG', Rect(100, 272.5, 65, 25))
	asd.AddChild(ResetButton)
	data2.ResetButton.setOpacity(0)
	data2.ResetButton.textSize = 12
	asd.AddChild(data2.ResetButton)

	data2.ResetButton.onClick.Add(function()
		ItemCountVar = 1
		data2.CountPanelText.text = ItemCountVar
		data.ItemMakerVar = ItemCountVar
		CountUpData(data2.NowItemCoeuntText, t1.gold[j], t1.itemcount[J], ItemCountVar, UnitGold, data2.ItemCoeuntText, t2.data[J])
	end)

	data2.PlusButton = Button('+', Rect(325, 272.5, 25, 25))
	data2.PlusButton.setOpacity(20)
	asd.AddChild(data2.PlusButton)

	data2.PlusButton.onClick.Add(function()
		if ItemCountVar >= 10 then
			return false
		end
		ItemCountVar = ItemCountVar + 1
		data2.CountPanelText.text = ItemCountVar
		data.ItemMakerVar = ItemCountVar
		CountUpData(data2.NowItemCoeuntText, t1.gold[j], t1.itemcount[J], ItemCountVar, UnitGold, data2.ItemCoeuntText, t2.data[J])
	end)

	data2.DownButton = Button('-', Rect(250, 272.5, 25, 25))
	data2.DownButton.setOpacity(20)
	asd.AddChild(data2.DownButton)

	data2.DownButton.onClick.Add(function()
		if ItemCountVar <= 1 then
			return false
		end
		ItemCountVar = ItemCountVar - 1
		data2.CountPanelText.text = ItemCountVar
		data.ItemMakerVar = ItemCountVar
		CountUpData(data2.NowItemCoeuntText, t1.gold[j], data.MenuList[data.MenuName.main[i]][data.MenuName.index[tostring(i)][bb]].itemcount[J], ItemCountVar, UnitGold, data2.ItemCoeuntText, t2.data[J])
	end)
	
end

function CountUpData(data, gold, itemcount, var, nowgold, data2, nowitem)
	data2[1].text = '소지:'..(nowgold >= gold*var and C_commaValue(nowgold) or "<color=#FF0000>"..C_commaValue(nowgold).."</color>")

	data[1].text = '필요:'..C_commaValue(gold*var)
	
	for i = 2, #data do
		data2[i].text = '소지:'..(nowitem[i-1] >=itemcount[i-1]*var and C_commaValue(nowitem[i-1]) or "<color=#FF0000>"..C_commaValue(nowitem[i-1]).."</color>")
		data[i].text = '필요:'..(C_commaValue(itemcount[i-1]*var))
	end
end

Client.GetTopic("ItemMakeUpData").Add(function(up, down, dataID)
	Client.ShowAlert(Client.GetItem(dataID).name..' \n<color=#01A9DB>'..up..'개 제작 성공</color>\n<color=#DBA901>'..down..'개 제작 실패</color>')
end)