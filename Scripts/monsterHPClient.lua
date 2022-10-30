
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
mon_data[63] = '시안파파'
mon_data[64] = 'o안농o'
mon_data[65] = '알비론'
mon_data[66] = '린디기'
mon_data[67] = '궁4'
mon_data[68] = '두베'
mon_data[69] = '빛의검사'
mon_data[70] = '짝퉁!'
mon_data[71] = '넹비'
mon_data[72] = '단군윤지'
mon_data[73] = '이머니'
mon_data[74] = '수니몬제자'
mon_data[75] = '마령왕'
mon_data[76] = '거래꾼'
mon_data[77] = '녹빛'
mon_data[78] = '(주)물고기'
mon_data[79] = '니니즈'
mon_data[80] = '헤드killerr'
mon_data[81] = '뀨쀼이'
mon_data[82] = '사과당'
mon_data[83] = '동물좋아'
mon_data[84] = '우선민'
mon_data[85] = '차운기억'
mon_data[92] = '쿠퍼스톤'
mon_data[97] = '푸른눈'
mon_data[107] = '타나토스'
mon_data[110] = '타나데스'

--첫타격후 체력바가 사라질시간(단위 : 초)

local bt = 10


--몬스터 이름 글자 크기

local nts = 16
----------------------------------------------------------------------------
local bp = nil
local hpText = nil
local hpbar = nil
local function ruu() --파괴
   bp.Destroy()
   hpText.Destroy()
   bp = nil
end


local function ru() --텍스트만 변경
	local hpt = bhhb/bhb * 100
	hpt = hpt * 100
	hpt = math.floor(hpt)
	hpt = hpt * 0.01

	hpText.text = hpt .. "%"
	
	-- bnnb = bnnb:gsub("\\n", "")
	-- bnnb = bnnb:gsub("악당", "")
	
	nnText.text = bnnb
	nn1Text.text =  bnnb
	nn2Text.text =  bnnb
	nn3Text.text =  bnnb
	nn4Text.text =  bnnb

	hpbar.DOScale(Point(bhhb/bhb, 1), 0.5)

	if bhhb <= 0 then
		ruu()
	end
end

local function rug()
	if bp == nil then
		bp = Image("Pictures/악당HP/hppenal.png", Rect(Client.width*0.30, Client.height*0.03, 250, 150))
		bp.SetOpacity(180)
		
		hpbar = Image("Pictures/악당HP/hpbar5.png", Rect(bp.width*0.04, bp.height*0.44, 230, 17.5))
		hpbar.SetOpacity(180)
		bp.AddChild(hpbar)

		hpText = Text("100%", Rect(bp.width*0.04, bp.height*0.44, 218, 17.5))
		hpText.textAlign = 5
		hpText.textSize = 12
		bp.AddChild(hpText)

		bpw = bp.width*0.2
		bph = bp.height*0.3


		nn1Text = Text()
		nn1Text.rect = Rect(bpw+1, bph+1, 150, 30)
		nn1Text.textAlign = 4
		nn1Text.color = Color(0,0,0)
		nn1Text.textSize = nts
		bp.AddChild(nn1Text)

		nn2Text = Text()
		nn2Text.rect = Rect(bpw+1, bph-1, 150, 30)
		nn2Text.textAlign = 4
		nn2Text.color = Color(0,0,0)
		nn2Text.textSize = nts
		bp.AddChild(nn2Text)

		nn3Text = Text()
		nn3Text.rect = Rect(bpw-1, bph-1, 150, 30)
		nn3Text.textAlign = 4
		nn3Text.color = Color(0,0,0)
		nn3Text.textSize = nts
		bp.AddChild(nn3Text)

		nn4Text = Text()
		nn4Text.rect = Rect(bpw-1, bph-1, 150, 30)
		nn4Text.textAlign = 4
		nn4Text.color = Color(0,0,0)
		nn4Text.textSize = nts
		bp.AddChild(nn4Text)

		nnText = Text()
		nnText.rect = Rect(bpw, bph, 150, 30)
		nnText.textAlign = 4
		nnText.textSize = nts
		bp.AddChild(nnText)

		ru()
		Client.RunLater(ruu, bt) --bt초 후 파괴

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



