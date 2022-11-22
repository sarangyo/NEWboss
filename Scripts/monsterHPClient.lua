--스크립트 초보라 쓸때없는 문장이 많습니다
-- 지금보니까 클라에 렉이 잔뜩쌓이는 구조였네요 헉.. 이거 고쳐가지고 저도 써야개ㅔㅆ당
--------------------------------------------------------------------------

--사용법 : 1. 서버스크립트와 클라이언트스크립트, pictures 폴더 안에있는 자료를 모두 게임파일 내로 이동시켜주세요
--          2. 데미지콜백은 하나만 사용가능함으로 다른 스크립트에서 데미지콜백을 사용중이라면 합쳐주세요
--          3. 패널 이름이 같은게 존재한다면 오류가 날수도 있습니다. 패널이름을 바꿔주세요. 스크립트를 하나하나 빼가면서 어떤 파일과 충돌인지 찾아보세요
-- 지금 143줄이거든요 이게 얼마나 줄여지는지 보세용 102줄 됏네요 ㅎㅎ 런레이터되는것만 확인할게요 넹 아그리고 보스이름도 더 들어가요 이제 아아 봤어용
--[[
	이게 음 객체를 계쏙 생성파괴 시키고 있었어요 그러면 메모리에 쌓이게되고 가비지컬렉터가 발동하면 이제 게임이 느려지거든요
	ㄷ ㅏ행히 재접속하면 문제는 해결되겠지만 ㅎㅎ
	그래서 오브젝트 풀링이라고 한번 생성해놓고 그거를 계속 가져다 쓰는 방식으롭 바꿨구여
	체력바도 어거지로 위치맞춘 느낌이라 좀 컨트롤하기 쉽게 바꿨어요 아아 공감하는게 
	이게 시간좀지나면 다들 버벅거리더라구요 또 신기하게 재접하면 렉이사라지는게 이거때문이였구나
	다른 스크립트들도 보긴해야돼요 일단 이거는 해결됐기 때문에 수명이 몇시간은 더 늘었을거에요 와 감사합니다.ㅋㅋㅋ
]]
---------------------------------------------------------------------------
--경고

--문제 발생 시 책임은 사용자에게 있습니다.

----------------------------------------------------------------------------
--설정

--첫타격후 체력바가 사라질시간(단위 : 초)

local bt = 7

--몬스터 이름 글자 크기

local nts = 18
----------------------------------------------------------------------------

local mon = Client.GetMonster
local mon_data = {}
mon_data[5] = '쥐돌'
mon_data[10] = '웅치킨'
mon_data[15] = '구울'
mon_data[22] = '오크 장군'
mon_data[28] = '천하대장군'
mon_data[34] = '우주인'
mon_data[40] = '베늠'
mon_data[45] = '사원지킴이'
mon_data[50] = '커오블린'
mon_data[55] = '대지의 정령'
mon_data[60] = '리바이어던'
mon_data[62] = 'asb7511'
mon_data[63] = '지크바보'
mon_data[64] = 'o안농o'
mon_data[65] = 'Vip?'
mon_data[66] = '머호'
mon_data[67] = 'Gp506'
mon_data[68] = '18센치'
mon_data[69] = '망령왕'
mon_data[70] = '뱀장어15'
mon_data[71] = '커쀍6계'
mon_data[72] = '샤인즈'
mon_data[73] = '이머니'
mon_data[74] = '알라뷰곰'
mon_data[75] = '탄수'
mon_data[76] = '95E'
mon_data[77] = '녹빛'
mon_data[78] = '(주)물고기'
mon_data[79] = '니니즈'
mon_data[80] = '헤드killerr'
mon_data[81] = '뀨뿌이'
mon_data[82] = '사과당'
mon_data[83] = '동물좋아'
mon_data[84] = '우선민'
mon_data[85] = '차운기억'
mon_data[92] = '쿠퍼스톤'
mon_data[97] = '푸른눈'
mon_data[107] = '타나토스'
mon_data[110] = '타나데스'
mon_data[111] = '타나탁스'


local img = Image("Pictures/악당HP/hppenal.png", Rect(Client.width*0.30, Client.height*0.15, 250, 26))
img.showOnTop = true

local HPbar = Image("Pictures/악당HP/hpbar5.png", Rect(1, 1, img.width-2, img.height-2))
img.AddChild(HPbar)

local hpText = Text('100%', Rect(0, 0, img.width, img.height))
hpText.borderEnabled = true
hpText.textAlign = 4
hpText.textSize = 14
img.AddChild(hpText)

local nnText = Text('asdsdasadasd', Rect(0, -15, img.width, 30))
nnText.borderEnabled = true
nnText.textAlign = 1
nnText.textSize = nts
img.AddChild(nnText)

img.visible = false

local bnnb, bhb = '', 0
local function ru()
	local hpt = string.format('%.2f', bhhb/bhb * 100)

	hpText.text = hpt .. "%"
	-- hpText.text = bhhb.."/"..bhb

	if bhhb <= 0 then
		img.visible = false
	else
		nnText.text = bnnb
		HPbar.DOScale(Point(bhhb/bhb, 1), 0.5)
	end
end

local function rug()
	if img.visible == false then
		img.visible = true
		ru()
		Client.RunLater(function()
			img.visible = false
		end, bt)
	else
		ru()
	end
end

Client.GetTopic("bh").Add(function(bhha, id)
	bhb = mon(id).maxHP --현재hp
	bhhb = bhha
	if mon_data[id] then
		bnnb = mon_data[id]
	else
		bnnb = mon(id).name
	end
	
	rug()
end)

-- 일단한번 테스트할게요