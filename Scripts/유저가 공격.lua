local user_break = {}
user_break.width = 222
user_break.height = 105

local txt_type = {'용사가 습격을 고민 중입니다.', '용사가 습격을 망설입니다.', '용사가 습격을 두려워합니다.', 
	'용사가 습격을 피하고 싶어 합니다.', '용사가 습격을 용기내서 도전합니다.',  '용사가 습격을 자신 있어 합니다.', 
	'보스가 무서워서 쭈구리가 되었습니다.', '몇몇의 용사가 오줌을 지렸습니다.', '용사가 손바닥에 땀이 납니다.',
	'용사들이 엄마가 보고싶습니다.', '용사가 두려움에 맞섭니다.'}
function user_break:main()
	self.main_panel = Panel(Rect(0, 0, self.width, self.height))
	self.main_panel.color = Color(0, 0, 0, 0)
	self.main_panel.anchor = 5
	self.main_panel.pivotX = 1.1
	self.main_panel.pivotY = 0.8
	self.main_panel.showOnTop = true
	self.main_panel.AddChild(Image('Pictures/user_break/background.png', Rect(0, 0, self.width, self.height)))
	self.main_panel.visible = false
	
	self.main_text = Text('<color=#000000><size=12>[테스트중] '..txt_type[rand(1, #txt_type+1)]..'</size></color>', Rect(15, 22, self.width-30, self.height-44))
	self.main_text.textAlign = 1
	self.main_panel.AddChild(self.main_text)
	
	local but, txt = {}, {}
	for i=1, 2 do
		but[i] = Button('', Rect(0, 0, 75, 32))
		but[i].color = Color(0, 0, 0, 0)
		but[i].anchor = 7
		but[i].pivotY = 1.4
		self.main_panel.AddChild(but[i])
		
		but[i].AddChild(Image('Pictures/user_break/yes_no_button.png', Rect(0, 0, but[i].width, but[i].height)))
		
		txt[i] = Text('', Rect(0, 0, but[i].width, but[i].height))
		txt[i].textSize = 12
		txt[i].textAlign = 4
		but[i].AddChild(txt[i])
	end
	txt[1].text = '<color=#000000>덤벼</color>'
	txt[2].text = '<color=#000000>무시</color>'
	
	but[1].pivotX = 1.1
	but[2].pivotX = -0.1
	
	but[1].onClick.Add(function()
		self.main_panel.visible = false
		Client.FireEvent('습격맵이동')
	end)
	
	but[2].onClick.Add(function()
		self.main_panel.visible = false
	end)
end

Client.GetTopic('플레이어습격').Add(function(t1)
	local table01 = Utility.JSONParse(t1)
	local sum = 0
	for i, v in ipairs(table01) do
		sum = sum+user_break.lv[v]
	end
	sum = math.ceil(sum/#table01)
	user_break.main_text.text = '<color=#000000><size=12>['..#table01..'인파티] '..txt_type[rand(1, #txt_type+1)]..' <color=#0404B4>평균레벨 : '..sum..'</color></size></color>'
	user_break.main_panel.visible = true
end)

user_break:main()

Client.GetTopic('플레이어_습격데이터반응').Add(function(t1, t2)
	user_break.lv, user_break.per = Utility.JSONParse(t1), Utility.JSONParse(t2)
end)








