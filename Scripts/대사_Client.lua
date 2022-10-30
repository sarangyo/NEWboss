local Desa = nil
local but = nil
Client.GetTopic("Send_Desa").Add(function(Desa_text, List, tx3)
	local Choice_List = Utility.JSONParse(List)
	local Choice_Button = {}
	
	local Cw = Client.width
	local Ch = Client.height
	local AA = Ch-Ch*0.45
	local BB = Ch-AA
	
	if Desa then return end
	if not Choice_List[1] then
		Desa = Panel(Rect(0, AA, Cw, BB))
		Desa.color = Color(22, 22, 22, 230)
		Desa.showOnTop = true
		
		local Touch_Text = Text("<color=#00FFFF>Touch</color>", Rect(Desa.width-100, Desa.height-60, 100, 100))
		Touch_Text.textAlign = 0
		Touch_Text.textSize = 25
		Touch_Text.color = Color(255, 255, 255, 230)
		Desa.AddChild(Touch_Text)
	else
		Desa = Panel(Rect(0, AA, Cw, BB))
		Desa.color = Color(22, 22, 22, 230)
		Desa.showOnTop = true
	end
	
	local DesaText = Text(Desa_text, Rect(30, 20, Desa.width-30, Desa.height-20))
	DesaText.textAlign = 0
	DesaText.textSize = 19
	DesaText.color = Color(255, 255, 255, 230)
	Desa.AddChild(DesaText)
	
	if not Choice_List[1] then
		but = Button('', Rect(0, 0, Cw, BB))
		but.color = Color(0, 0, 0, 0)
		Desa.AddChild(but)
		
		but.onClick.Add(function()
			Client.FireEvent("Desa_End")
			Desa.Destroy()
			Desa = nil
		end)
	end
	
	for i=1,#Choice_List do
		Choice_List[i] = Choice_List[i]:gsub("<color>", "</color>")
		Choice_List[i] = Choice_List[i]:gsub("<size>", "</size>")
		if i > 5 then
			Choice_Button[i] = Button("", Rect(Cw-375, (Ch-440) * (i-5)-Desa.y, 335, 35))
		else
			if #Choice_List <= 5 then
				Choice_Button[i] = Button("", Rect(Cw-720, (Ch-440) * i-Desa.y, 670, 35))
			else
				Choice_Button[i] = Button("", Rect(Cw-720, (Ch-440) * i-Desa.y, 335, 35))
			end
		end
		Choice_Button[i].text = "<size=26> " .. Choice_List[i] .. "</size>"
		Choice_Button[i].color = Color(0, 0, 0, 200)
		Choice_Button[i].showOnTop = true
		Choice_Button[i].onClick.Add(function()
			Client.myPlayerUnit.PlaySE('시스템소리/빡.ogg', 0.8)
			Client.FireEvent("Desa_End"..i..tx3)
			Desa.Destroy()
			Desa = nil
		end)
		Desa.AddChild(Choice_Button[i])
	end
end)
