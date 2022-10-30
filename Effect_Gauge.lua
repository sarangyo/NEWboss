--이거에여 이거는 잘작동ㅎ래요? 이것도 조금씩 오류나서 유저들이 경험치바랑 체력꼬여서 나갔다가 다른게임다녀오면 정상작동한데여ㅛ
-- 이거는 누구스크립트에여? isoft 맞나 그 개발자  ㅋㅋㅋ 알아용ㅋㅋㅋ옛날에 사둔건데 이제 꺼내서 써봣어요 초보때 산거
-- 이게 텍스트가 예전에는 검은색 테두리 만드려면 5개의 객체를 만들었어야 했는데 테두리 만드는 기능이 새로 생겨서 1개면 되거든요
-- 이거는 근데 옛날거라 5개를 여전히 쓰고있네여 아아
----------------------사용자 정의 설정-------------------

--레벨 텍스트 위치 및 크기 설정
lv_x_pos = 10             --기본 250
lv_y_pos = 1              --기본 335
lv_text_size = 21         --기본 25


--체력 텍스트 위치 및 크기 설정
hp_text_x_pos = 100       --기본 330
hp_text_y_pos = 4       --기본 375
hp_text_size = 13         --기본 15


--마력 텍스트 위치 및 크기 설정
mp_text_x_pos = 100       --기본 330
mp_text_y_pos = 24       --기본 405
mp_text_size = 13         --기본 15


--경험치 텍스트 위치 및 크기 설정
xp_x_pos = 0              --기본 0
xp_y_pos = 435            --기본 435
xp_text_size = 15         --기본 15


--게이지 위치 설정
gauge_hp_x_pos = 85      --체력 게이지의 가로 위치 기본240
gauge_hp_y_pos = 5       --체력 게이지의 세로 위치 기본375

gauge_mp_x_pos = 85      --마력 게이지의 가로 위치 기본240
gauge_mp_y_pos = 25      --마력 게이지의 세로 위치 기본405
 
gauge_xp_x_pos = 0        --경험치 게이지의 가로 위치 기본0
gauge_xp_y_pos = 470      --경험치 게이지의 세로 위치 기본470


--게이지 크기 설정
gauge_hp_x_size = 180      --체력 게이지의 가로 길이 기본260
gauge_hp_y_size = 18       --체력 게이지의 세로 길이 기본25

gauge_mp_x_size = 180      --마력 게이지의 가로 길이 기본260
gauge_mp_y_size = 18       --마력 게이지의 세로 길이 기본25

gauge_xp_x_size = Client.width      --경험치 게이지의 가로 길이
gauge_xp_y_size = 20       --경험치 게이지의 세로 길이 기본10





--구름 위치 설정
cloud_x_pos = 0           --기본 0
cloud_y_pos = 0           --기본 0

--구름 크기 설정
cloud_x_size = 860        --기본860
cloud_y_size = 538        --기본538

----------------------------------------------------------

ScreenUI.hpBarVisible = false
ScreenUI.mpBarVisible = false
ScreenUI.expBarVisible = false
ScreenUI.levelVisible = false

local exp_text1 = Text("", Rect(xp_x_pos-1, xp_y_pos, 500, 50))
exp_text1.color = Color(255, 255, 255)
exp_text1.borderEnabled = true
exp_text1.borderColor = Color(0, 0, 0)
exp_text1.borderDistance = Point(1, 1)
exp_text1.textSize = xp_text_size

local level_text1 = Text("", Rect(lv_x_pos-1, lv_y_pos, 300, 50))
level_text1.color = Color(255, 255, 255)
level_text1.borderEnabled = true
level_text1.borderColor = Color(0, 0, 0)
level_text1.borderDistance = Point(1, 1)
level_text1.textSize = lv_text_size




local hp_text1 = Text("",Rect(hp_text_x_pos, hp_text_y_pos, 250, 20))
hp_text1.color = Color(255, 120, 170)
hp_text1.borderEnabled = true
hp_text1.borderColor = Color(67, 67, 67)
hp_text1.borderDistance = Point(1, 1)
hp_text1.textSize = hp_text_size 

local mp_text1 = Text("",Rect(mp_text_x_pos, mp_text_y_pos, 250, 20))
mp_text1.color = Color(100, 200, 255)
mp_text1.borderEnabled = true
mp_text1.borderColor = Color(67, 67, 67)
mp_text1.borderDistance = Point(1, 1)
mp_text1.textSize = mp_text_size





local s_point = Point(0, -200)
local e_point = Point(0, 0)
local x_point = Point(800, 0)
local xe_point = Point(-800, 0)

local cloud_init_point = Point(-125, -300)
local cloud_init2_point = Point(-700, -300)
local cloud_end_point = Point(800, -300)

local hp = Panel(Rect(gauge_hp_x_pos, gauge_hp_y_pos, gauge_hp_x_size, gauge_hp_y_size))
hp.SetOpacity(0)
hp.masked = true

local mp = Panel(Rect(gauge_mp_x_pos, gauge_mp_y_pos, gauge_mp_x_size, gauge_mp_y_size))
mp.SetOpacity(0)
mp.masked = true

local xp = Panel(Rect(0, gauge_xp_y_pos, gauge_xp_x_size, gauge_xp_y_size))
xp.SetOpacity(0)
xp.masked = true


local hp_orb_bot = Image("Pictures/Effect_Gauge/Health_bar_bot.png", Rect(gauge_hp_x_pos, gauge_hp_y_pos, gauge_hp_x_size, gauge_hp_y_size))
local hp_orb3 = Image("Pictures/Effect_Gauge/dot.png", Rect(gauge_hp_x_pos, gauge_hp_y_pos, gauge_hp_x_size, 300))
local hp_orb = Image("Pictures/Effect_Gauge/Health_glass_bar.png", Rect(gauge_hp_x_pos, gauge_hp_y_pos, gauge_hp_x_size, gauge_hp_y_size))
local hp_orb2 = Image("Pictures/Effect_Gauge/Health_bar.png", Rect(0, 0, gauge_hp_x_size, gauge_hp_y_size))

local mp_orb_bot = Image("Pictures/Effect_Gauge/Mana_bar_bot.png", Rect(gauge_mp_x_pos, gauge_mp_y_pos, gauge_mp_x_size, gauge_mp_y_size))
local mp_orb3 = Image("Pictures/Effect_Gauge/dot2.png", Rect(gauge_mp_x_pos, gauge_mp_y_pos, gauge_mp_x_size, 300))
local mp_orb = Image("Pictures/Effect_Gauge/Mana_glass_bar.png", Rect(gauge_mp_x_pos, gauge_mp_y_pos, gauge_mp_x_size, gauge_mp_y_size))
local mp_orb2 = Image("Pictures/Effect_Gauge/Mana_bar.png", Rect(0, 0, gauge_mp_x_size, gauge_mp_y_size))

local xp_orb_bot = Image("Pictures/Effect_Gauge/exp_bar_bot.png", Rect(gauge_xp_x_pos, gauge_xp_y_pos, gauge_xp_x_size, gauge_xp_y_size))
local xp_orb3 = Image("Pictures/Effect_Gauge/exp_bar_dot.png", Rect(0, 0, gauge_xp_x_size, 500))
local xp_orb2 = Image("Pictures/Effect_Gauge/exp_bar.png", Rect(0, 0, gauge_xp_x_size, gauge_xp_y_size))
local xp_orb22 = Image("Pictures/Effect_Gauge/exp_bar.png", Rect(0, 0, gauge_xp_x_size, gauge_xp_y_size))

local cloud = Image("Pictures/Effect_Gauge/cloud.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))
local cloud2 = Image("Pictures/Effect_Gauge/cloud.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))

local cloud3 = Image("Pictures/Effect_Gauge/cloud2.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))
local cloud4 = Image("Pictures/Effect_Gauge/cloud2.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))

local cloud5 = Image("Pictures/Effect_Gauge/cloud3.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))
local cloud6 = Image("Pictures/Effect_Gauge/cloud3.png", Rect(cloud_x_pos, cloud_y_pos, cloud_x_size, cloud_y_size))

hp.AddChild(hp_orb2)
hp.AddChild(hp_orb3)
hp.AddChild(cloud)
hp.AddChild(cloud2)

mp.AddChild(mp_orb2)
mp.AddChild(mp_orb3)
mp.AddChild(cloud3)
mp.AddChild(cloud4)
mp.AddChild(mp_text1)

xp.AddChild(xp_orb2)
xp.AddChild(xp_orb22)
xp.AddChild(xp_orb3)
xp.AddChild(cloud5)
xp.AddChild(cloud6)


hp_orb_bot.showOnTop = true
hp.showOnTop = true
hp_orb.showOnTop = true
mp_orb_bot.showOnTop = true
mp.showOnTop = true
mp_orb.showOnTop = true
xp_orb_bot.showOnTop = true
xp.showOnTop = true
level_text1.showOnTop = true
hp_text1.showOnTop = true
mp_text1.showOnTop = true


local function ExpOrbMove() 
    xp_orb2.DOMove(e_point,0)
    xp_orb2.DOMove(x_point,9)

    cloud.DOMove(cloud_init_point,0)
    cloud.DOMove(cloud_end_point,10)
    cloud2.DOMove(cloud_init2_point,0)
    cloud2.DOMove(cloud_end_point,28)

    cloud3.DOMove(cloud_init_point,0)
    cloud3.DOMove(cloud_end_point,10)
    cloud4.DOMove(cloud_init2_point,0)
    cloud4.DOMove(cloud_end_point,28)

    cloud5.DOMove(cloud_init_point,0)
    cloud5.DOMove(cloud_end_point,18)
    cloud6.DOMove(cloud_init2_point,0)
    cloud6.DOMove(cloud_end_point,18)

    xp_orb22.DOMove(xe_point,0)
    xp_orb22.DOMove(x_point,18)
end

local cloud_bool = false
local function OrbMove() 
	cloud_bool = not cloud_bool
    if cloud_bool then
        hp_orb3.DOMove(s_point, 10)
        mp_orb3.DOMove(s_point, 10)
        xp_orb3.DOMove(s_point, 10)
    else
        hp_orb3.DOMove(e_point, 10)
        mp_orb3.DOMove(e_point, 10)
        xp_orb3.DOMove(e_point, 10)
    end
end

local function cv(n)
	local left, num, right = string.match(n,'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end

local Time = 5 
local Dtime = 5
local function Orb(t) 
	local me = Client.myPlayerUnit
    if me == nil then
        return
    end
	
	Time = Time+t
	if Time >= Dtime then
		OrbMove()
		ExpOrbMove()
		Time = 0
	end

    hp_text1.text = cv(me.hp).."/"..cv(me.maxHP)
    mp_text1.text = cv(me.mp).."/"..cv(me.maxMP)


    --[[mhp = me.hp / me.maxHP * 100
    Thp = gauge_hp_x_size * mhp / 100
    hp.rect = Rect(gauge_hp_x_pos, gauge_hp_y_pos, Thp, gauge_hp_y_size)]]
	hp.DOScale(Point(me.hp/me.maxHP, 1), 0.3)


    --[[mmp = me.mp / me.maxMP * 100
    Tmp = gauge_mp_x_size * mmp / 100
    mp.rect = Rect(gauge_mp_x_pos, gauge_mp_y_pos, Tmp, gauge_mp_y_size)]]
	mp.DOScale(Point(me.mp/me.maxMP, 1), 0.3)


    --[[mxp = me.exp / me.maxEXP * 100
    Txp = gauge_xp_x_size * mxp / 100
    xp.rect = Rect(gauge_xp_x_pos, gauge_xp_y_pos, Txp, gauge_xp_y_size)]]
	xp.DOScale(Point(me.exp/me.maxEXP, 1), 0.3)


    per = string.format("%.2f", me.exp / me.maxEXP * 100)

    level_text1.text = "Lv."..me.level

    if me.maxEXP == 0 then
        exp_text1.text = "최대 레벨 달성" 
    else
        exp_text1.text = '<color=#00FF00>'..cv(me.exp).."</color>/<color=#FFBF00>"..cv(me.maxEXP).."</color> ("..per.."%)"
    end
end

Client.onTick.Add(Orb)


