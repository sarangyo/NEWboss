local op = {}

local function dd(lv, num)
	if num and op.sequence~=num then return end
	op.levelText[op.sequence].text = lv>0 and '+'..lv or ''
	op.sequence = op.sequence+1
	
	if num>=#op.tbl then
		op.closePal.visible = true
		return
	end
	
	for i=1, 8 do
		Client.RunLater(function()
			op.aniImg[op.sequence].image = 'Pictures/잡/AddOptionAnimation/'..i..'.png'
			if i==8 then
				Client.RunLater(function()
					Client.FireEvent('옵션부여중', op.sequence, op.tbl[op.sequence].id, #op.tbl)
				end, 0.2)
			end
		end, 0.1*i)		
	end
end

local darkPanel = nil
local function OptionUI_open(txt)
	if darkPanel then return end
	
	op.tbl = Utility.JSONParse(txt)
	op.aniImg, op.levelText = {}, {}
	op.sequence = 1
	
	darkPanel = Panel(Rect(0, 0, Client.width, Client.height)){
		color = Color.black,
		opacity = 100
	}
	darkPanel.showOnTop = true
	
	local img = Image('Pictures/MakeUI/내부1.png', Rect(0, 0, 380, 321)){
		anchor = 4,
		pivot = Point(0.5, 0.5),
		parent = darkPanel
	}
	
	op.closePal = Image('Pictures/거래소/취소2.png', Rect(0, 0, 33, 33)){
		anchor = 2,
		pivot = Point(-0.1, -0.1),
		visible = false,
		parent = img
	}
	
	local closeBut = Button('✖'){
		rect = op.closePal.rect,
		textSize = 16,
		textAlign = 4,
		opacity = 0,
		parent = op.closePal
	}
	
	closeBut.onClick.Add(function()
		darkPanel.Destroy()
		darkPanel = nil
	end)
	
	local titleText = Text('자동 옵션부여', Rect(0, 0, 380, 56)){
		textAlign = 4,
		textSize = 16,
		color = Color.cyan,
		borderEnabled = true,
		parent = img
	}
	
	local Ceil = 7
	local pal = Panel(Rect(0, 8, 380, math.ceil(#op.tbl/Ceil)*52.8)){
		opacity = 0,
	}
	
	local scrollPanel = ScrollPanel(Rect(0, 56, 380, 321-56)){
		content = pal,
		horizontal = false,
		parent = img,
	}
	
	for i, v in ipairs(op.tbl) do
		local iconbackground = Image('Pictures/거래소/itemBg.png'){
			rect = Rect(6, 0, 48, 48),
			pivotX = -1.1*((i%Ceil==0 and Ceil or i%Ceil)-1),
			pivotY = -1.1*(math.ceil(i/Ceil)-1),
			parent = pal
		}
		
		local iconImg = Image('', Rect(0, 0, 44, 44)){
			parent = iconbackground
		}
		iconImg.SetImageID(Client.GetItem(v.dataID).imageID)
		
		op.aniImg[i] = Image('Pictures/잡/AddOptionAnimation/8.png'){
			rect = iconImg.rect,
			parent = iconImg
		}
		
		op.levelText[i] = Text(''){
			rect = iconImg.rect,
			color = Color.green,
			borderEnabled = true,
			parent = iconImg
		}
	end
	
	Client.RunLater(function()
		for i=1, 8 do
			Client.RunLater(function()
				op.aniImg[op.sequence].image = 'Pictures/잡/AddOptionAnimation/'..i..'.png'
				if i==8 then
					Client.RunLater(function()
						Client.FireEvent('옵션부여중', op.sequence, op.tbl[op.sequence].id, #op.tbl)
					end, 0.2)
				end
			end, 0.1*i)			
		end
	end, 1)
end

Client.GetTopic('자동옵션부여').Add(OptionUI_open)

Client.GetTopic('옵션부여중').Add(dd)
Client.GetTopic('옵션부여중단').Add(function(num)
	op.closePal.visible = true
end)
