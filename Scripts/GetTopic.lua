local dark_pal = Panel(Rect(0, 0, Client.width, Client.height))
dark_pal.showOnTop = true
dark_pal.color = Color(0, 0, 0, 120)
dark_pal.visible = false

local dark_txt = Text('', Rect(0, 0, 600, 600))
dark_txt.anchor = 4
dark_txt.pivotX = 0.5
dark_txt.pivotY = 0.5
dark_txt.textSize = 24
dark_txt.textAlign = 4
dark_pal.AddChild(dark_txt)
local COL = {[0] = '<color=#FFBF00>', [1] = '<color=#BFFF00>'}
Client.GetTopic('보따리_열기').Add(function(num)
	-- 363부터 인벤
	if num == -1 then
		dark_pal.visible = false
		dark_txt.text = ''
	else
		dark_pal.visible = true
		local i = num%2
		if num < 363 then
			dark_txt.text = Client.GetItem(num).name..COL[i]..'를 뒤적거리는 중입니다.</color>\n'
		else
			dark_txt.text = Client.GetItem(num).name..COL[i]..'을 뒤적거리는 중입니다.</color>\n'
		end
	end
end)






