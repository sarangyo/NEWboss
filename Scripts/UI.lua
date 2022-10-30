--ScreenUI.expBarVisible  = false
local exp_pal = Panel(Rect(0, 0, Client.width, 12))
exp_pal.showOnTop = true
exp_pal.color = Color(0, 0, 0, 140)
exp_pal.anchor = 6
exp_pal.pivotY = 1

local exp_bar = Panel(Rect(1, 1, exp_pal.width, 9))
exp_bar.color = Color(65, 143, 0)
exp_bar.visible = false
exp_pal.AddChild(exp_bar)

local exp_txt = Text('', Rect(0, 0, exp_pal.width, 14))
exp_txt.textSize = 12
exp_txt.textAlign = 7
exp_txt.showOnTop = true
exp_txt.anchor = 6
exp_txt.pivotY = 1
--[[
local lv_img = Image('Pictures/HPMPEXP_BAR/lv.png', Rect(0, 0, 74, 18))
lv_img.showOnTop = true]]

local function bar_UI()
	local me = Client.myPlayerUnit
	local Q = {me.exp, me.maxEXP}
	local R = 2--소수점 자리
	local W = math.floor((Q[1]/Q[2]*100)*10^R)/10^R
	local E = W..'%'
	exp_txt.text = E
	exp_bar.DOScale(Point(Q[1]/Q[2], 1), 0.3)
end

Client.RunLater(function() 
	Client.onTick.Add(bar_UI)
	exp_bar.visible = true
end, 0.5)