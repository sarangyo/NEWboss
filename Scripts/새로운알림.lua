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
			print(555)
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

Client.GetTopic('새로운알림').Add(function(txt)
	local txt = Text(txt, Rect(0, 100, 400, 400))
	txt.anchor = 4
	txt.pivotX = 0.5
	txt.pivotY = 0.5
	txt.textSize = 26
	txt.textAlign= 4
	txt.DOMove(Point(txt.x, txt.y-40), 1.5)
	Client.RunLater(function() 
		txt.Destroy() 
		txt=nil
	end, 1.5)
end)

Client.GetTopic('새로운알림2').Add(function(txt)
	local txt = Text(txt, Rect(0, 100, 400, 400))
	txt.anchor = 4
	txt.pivotX = 0.5
	txt.pivotY = 0.5
	txt.textSize = 22
	txt.textAlign= 4
	txt.DOMove(Point(txt.x, txt.y-40), 3)
	Client.RunLater(function() 
		txt.Destroy() 
		txt=nil
	end, 3)
end)

Client.GetTopic('ShowYesNoAlert').Add(function(txt, signal)
	Client.ShowYesNoAlert(txt, function(a)
		if a==1 then
			Client.FireEvent(signal)
		end
	end)
end)
