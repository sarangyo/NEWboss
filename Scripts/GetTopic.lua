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

local sos = false
local function dd()
	if sos==true then return end
	sos = true
	local pal = Panel(Rect(0, 0, Client.width, Client.height))
	pal.color = Color(0, 0, 0, 100)
	pal.showOnTop = true
	
	local UIrect = Rect(0, 0, 236, 33)
	for i=1, 11 do
		local but = Button(){
			rect = UIrect,
			anchor = 1,
			pivot = Point(0.5, -1.05*i),
			opacity = 0,
			parent = pal,
		}
		but.AddChild(Image('Pictures/잡/임시필드.png', UIrect))
		but.AddChild(Text('임시 필드'..i, UIrect){
			textSize = 15,
			textAlign = 4,
			color = Color(234, 234, 234),
			borderEnabled = true
		})
		but.onClick.Add(function()
			Client.FireEvent('임시필드', i)
			sos = false
			pal.Destroy()
		end)
	end
end

Client.GetTopic('임시필드').Add(dd)



