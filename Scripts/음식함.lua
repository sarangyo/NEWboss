

Client.RunLater(function()
	Client.FireEvent('skin_table_start')
end, 0.5)--클라가 열리면 서버를 자극. 서버에서 스킨테이블 정보를 클라에 저장함.

local skin_table, sound = nil, nil
Client.GetTopic('skin_table').Add(function(SKIN, SKIN2)
	skin_table, sound = Utility.JSONParse(SKIN), Utility.JSONParse(SKIN2)
end)


local Skin_Panel = nil
local function SkinBox(T)
	if Skin_Panel then 
		Skin_Panel.Destroy()
		Skin_Panel = nil
		return
	end
	local cw = Client.width
	local ch = Client.height
	local Garo = 240
	local Sero = 380
	
	Skin_Panel = Panel(Rect(cw/2-Garo/2, ch/2-Sero/2, Garo, Sero))
	Skin_Panel.color = Color(0, 0, 0, 255)
	Skin_Panel.showOnTop = true
	
	local Skin_Panel2 = Panel(Rect(0, 0, Skin_Panel.width-2, 1111))
	Skin_Panel2.color = Color(98, 10, 10)
	--Skin_Panel.AddChild(Skin_Panel2)
	
	local COLSE_BUTTON_SIZE = 34
	local scroll_panel = ScrollPanel()
	scroll_panel.rect = Rect(1, COLSE_BUTTON_SIZE+1, Skin_Panel.width-2, Skin_Panel.height-(2+COLSE_BUTTON_SIZE))
	scroll_panel.horizontal = false
	scroll_panel.showVerticalScrollbar = false
	scroll_panel.content = Skin_Panel2
	Skin_Panel.AddChild(scroll_panel)
	
	local Skin_Panel3 = Panel(Rect(1, 1, Skin_Panel2.width, COLSE_BUTTON_SIZE))
	Skin_Panel3.color = Color(166, 45, 45)
	Skin_Panel.AddChild(Skin_Panel3)
	
	local Skin_Text3 = Text(' 음식 도감', Rect(0, 0, Skin_Panel3.width, Skin_Panel3.height))
	Skin_Text3.textSize = 20
	Skin_Text3.textAlign = 3
	Skin_Panel3.AddChild(Skin_Text3)
	
	local CloseButton = Button('✖', Rect(Garo-COLSE_BUTTON_SIZE, 0, COLSE_BUTTON_SIZE, COLSE_BUTTON_SIZE))
	CloseButton.textSize = 22
	CloseButton.textAlign = 4
	CloseButton.color = Color(98, 10, 10)
	Skin_Panel3.AddChild(CloseButton)
	CloseButton.onClick.Add(function()
		Skin_Panel.Destroy()
		Skin_Panel = nil
	end)
	
	local skins = {basic={}, basic2={}, but={}, img={}, text={}, black={}}
	local j = 0
	local Front, back = 0, 0
	local data_panelX = Skin_Panel.width+6
	local data_panel = Panel(Rect(data_panelX, Skin_Panel.y+10, 140, 90))
	data_panel.color = Color(0, 0, 0, 140)
	data_panel.visible = false
	Skin_Panel.AddChild(data_panel)
	
	local data_text = Text('', Rect(10, 10, data_panel.width-10, data_panel.height-10))
	data_text.textAlign = 0
	data_panel.AddChild(data_text)
	
	local data_but = Button('<color=#F781BE>먹는 소리 듣기</color>', Rect(10, 50, 100, 35))
	data_but.color = Color(0, 0, 0)
	data_panel.AddChild(data_but)
	
	local se = 0
	for i, v in pairs(T) do
		j = j+1
		skins.basic[j] = Panel(Rect(8+(j%4==0 and 3 or j%4-1)*58, 8+math.floor((j-1)/4)*75, 48, 65))
		skins.basic[j].color = Color(200, 200, 200)
		Skin_Panel2.AddChild(skins.basic[j])
		
		skins.basic2[j] = Panel(Rect(1, 1, skins.basic[j].width-2, skins.basic[j].height-2))
		skins.basic2[j].color = Color(66, 66, 66)
		skins.basic[j].AddChild(skins.basic2[j])
		
		skins.but[j] = Button('', Rect(2, 2, skins.basic2[j].width-4, skins.basic2[j].width-4))
		skins.basic2[j].AddChild(skins.but[j])
		
		local id = tonumber(string.sub(i, 2, #i))
		skins.but[j].onClick.Add(function()
			data_panel.visible = true
			Front = j
			skins.but[j].color = Color(160, 220, 235)
			if back == 0 then
				back = j
			elseif Front == back then
				
			else
				skins.but[back].color = Color(255, 255, 255)
				back = Front
			end
			se = i
			data_text.text = Client.GetItem(id).name..'\n체력 : +'..skin_table[i][1]
		end)
		
		skins.text[j] = Text(Client.GetItem(id).name, Rect(0, skins.but[j].y+skins.but[j].height-1, skins.basic2[j].width, 20))
		skins.basic2[j].AddChild(skins.text[j])
		skins.text[j].textAlign = 4
		skins.text[j].textSize = 10
		
		skins.img[j] = Image('', Rect(0, 0, skins.but[j].width, skins.but[j].height))
		skins.img[j].SetImageID(Client.GetItem(id).imageID)
		skins.but[j].AddChild(skins.img[j])
		
		skins.black[j] = Panel(Rect(0, 0, skins.basic[j].width, skins.basic[j].height))
		skins.black[j].color = Color(0, 0, 0, 150)
		skins.basic[j].AddChild(skins.black[j])
		skins.black[j].visible = false
		if v==false then
			skins.black[j].visible = true
		end
	end
	
	data_but.onClick.Add(function()
		if se ~= 0 then
			Client.myPlayerUnit.PlaySE('먹는 소리/'..sound[skin_table[se][2]], 1.5)
		end
	end)
	Skin_Panel2.height = 8 + math.ceil(j/4)*75
end

Client.GetTopic("skin_start").Add(function(text)
	if not skin_table then
		Client.ShowAlert('다시 시도해주세요.')
		return
	end
	local T = Utility.JSONParse(text)
	SkinBox(T)
end)


























