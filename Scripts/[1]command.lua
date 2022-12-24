
--Client.FireEvent('serverJoin')

function Loading_start()
    if LoadingPanel then return end
    LoadingPanel = Panel(Rect(0, 0, Client.width, Client.height))
    LoadingPanel.color = Color(0,0,0,50)
    LoadingPanel.showOnTop = true

    local LoadingText = Text('<size=30>Loading..</size>\n\n'..'데이터를 불러오는 중입니다.', Rect(0, 0, LoadingPanel.width, LoadingPanel.height))
    LoadingText.textAlign = 4
    LoadingText.textSize = 14
    LoadingText.borderEnabled = true
    LoadingText.borderDistance = Point(1,1)
    LoadingText.borderColor = Color(0,0,0)
    LoadingPanel.AddChild(LoadingText)
end

function Loading_end()
    if not LoadingPanel then return end
    LoadingPanel.Destroy()
    LoadingPanel = nil
end

function comma(str)
    local left, num, right = string.match(str,'^([^%d]*%d)(%d*)(.-)$')
    return left .. (num:reverse():gsub('(%d%d%d)','%1,'):reverse()) .. right
end

StatInfo = {
	type = {
		[0] = {'', ''},
		[1] = {'직업', ''},
		[2] = {'직업', '%'},
		[3] = {'아이템', ''},
		[4] = {'아이템', '%'},
	},
	name = {
		[0] = Client.GetStrings().attack == '' and '공격력' or Client.GetStrings().attack,
		[1] = Client.GetStrings().defense == '' and '방어력' or Client.GetStrings().defense,
		[2] = Client.GetStrings().magic_attack == '' and '마법 공격력' or Client.GetStrings().magic_attack,
		[3] = Client.GetStrings().magic_defense == '' and '마법 방어력' or Client.GetStrings().magic_defense,
		[4] = Client.GetStrings().agility == '' and '민첩' or Client.GetStrings().agility,
		[5] = Client.GetStrings().lucky == '' and '행운' or Client.GetStrings().lucky,
		[6] = Client.GetStrings().hp == '' and '체력' or Client.GetStrings().hp,
		[7] = Client.GetStrings().mp == '' and '마력' or Client.GetStrings().mp,
	},
	custom = {Client.GetStrings().custom1,Client.GetStrings().custom2,Client.GetStrings().custom3,Client.GetStrings().custom4,Client.GetStrings().custom5,Client.GetStrings().custom6,Client.GetStrings().custom7,Client.GetStrings().custom8,Client.GetStrings().custom9,Client.GetStrings().custom10,Client.GetStrings().custom11,Client.GetStrings().custom12,Client.GetStrings().custom13,Client.GetStrings().custom14,Client.GetStrings().custom15,Client.GetStrings().custom16,Client.GetStrings().custom17,Client.GetStrings().custom18,Client.GetStrings().custom19,Client.GetStrings().custom20,Client.GetStrings().custom21,Client.GetStrings().custom22,Client.GetStrings().custom23,Client.GetStrings().custom24,Client.GetStrings().custom25,Client.GetStrings().custom26,Client.GetStrings().custom27,Client.GetStrings().custom28,Client.GetStrings().custom29,Client.GetStrings().custom30,Client.GetStrings().custom31,Client.GetStrings().custom32},
}

function Stat_Text(statID)
    if not statID then return end

	local txt = StatInfo.name[statID]
    if statID >= 100 then
		txt = StatInfo.custom[statID-100]
	end

    return txt
end

function Option_Text(typeNum, statID, value)
	if not typeNum or not statID or not value then return end

	local txt = ''

	if statID < 100 then
		txt = '<color=#00ffff>'..StatInfo.type[typeNum][1]..' '..StatInfo.name[statID]..' +'..value..StatInfo.type[typeNum][2]..'</color>\n'
	else
		local customStat = StatInfo.custom[statID-100]
		txt = '<color=#00ffff>'..StatInfo.type[typeNum][1]..' '..customStat..' +'..value..StatInfo.type[typeNum][2]..'</color>\n'
	end
	return txt
end

TypeName = {
	[0] = '모자',
	[1] = '갑옷',
	[2] = '무기',
	[3] = '방패',
	[4] = '신발',
	[5] = '반지',
	[6] = '악세사리',
	[7] = '날개',
	[8] = '포션',
	[9] = '재료',
	[10] = '소모품',
}

local path = 'Pictures/분해UI/'
function Desc_Panel(create, dataID, level, options)
	if not dataID then return end

	local Type = '종류: ' .. TypeName[Client.GetItem(dataID).type] ..'\n'
    local Trade = Client.GetItem(dataID).canTrade and '<color=#3DB7CC>거래가능</color>\n' or '<color=#F78181>거래불가</color>\n'
    local Price = '판매가격: '..comma(Client.GetItem(dataID).sellerPrice)..'\n'
	local Opt = ''

	if options then
		Opt = #options > 0 and '\n<color=#FF00FF>옵션</color>\n' or ''
		for i=1, #options, 3 do
			Opt = Opt .. Option_Text(options[i], options[i+1], options[i+2])
		end
	end
    
	local txt = Trade .. Price .. Type .. Client.GetItem(dataID).desc .. Opt
	if not create then return txt end

	local DescB = Button('', Rect(0, 0, Client.width,  Client.height))
    DescB.color = Color(0,0,0,0)
    DescB.showOnTop = true
    DescB.onClick.add(function()
        DescB.Destroy()
        DescB = nil
    end)

    local DescP = Panel(Rect(0, 0, 260, 400))
    DescP.color = Color(0,0,0,220)
    DescP.anchor = 4
    DescP.pivotX = 0.5
    DescP.pivotY = 0.5
    DescB.AddChild(DescP)

    local DescIBG = Image(path..'투명.png', Rect(0, 10, 48, 48))
    DescIBG.anchor = 1
    DescIBG.pivotX = 0.5
    DescP.AddChild(DescIBG)

    local DescIMG = Image('', Rect(7.5, 7.5, DescIBG.width-15, DescIBG.height-15))
    DescIMG.SetImageID(Client.GetItem(dataID).imageID)
    DescIBG.AddChild(DescIMG)

	local Dlev = not level and 0 or level
    local Dlev = Dlev == 0 and '' or '+'..Dlev

    local DescLEV = Text(Dlev, Rect(2.5, 2.5, DescIBG.width-10, DescIBG.height-10))
    DescLEV.color = Color(0,255,0)
    DescLEV.textAlign = 0
    DescLEV.textSize = 12
    DescLEV.borderEnabled = true
    DescLEV.borderDistance = Point(0.8,0.8)
    DescLEV.borderColor = Color(0,0,0)
    DescIBG.AddChild(DescLEV)

    local DescNAME = Text(Client.GetItem(dataID).name ..' '.. Dlev, Rect(0, DescIBG.y+DescIBG.height-5, DescP.width-20, 25))
    DescNAME.textAlign = 4
    DescNAME.textSize = 13
    DescNAME.anchor = 1
    DescNAME.pivotX = 0.5
    DescP.AddChild(DescNAME)
    
    local DescLINE = Panel(Rect(0, 5, DescNAME.width, 1.5))
    DescLINE.color = Color(180,180,180,160)
    DescLINE.anchor = 6
    DescNAME.AddChild(DescLINE)

    local DescT = Text(txt, Rect(10, DescNAME.y+DescNAME.height+15, DescP.width-20, DescP.height-(DescNAME.y+DescNAME.height+20)))
    DescT.textAlign = 0
    DescT.textSize = 12
    DescP.AddChild(DescT)
end


function Reward_Item(table)
    local Item = Utility.JSONParse(table)

    if remask then
        remask.Destroy()
        remask = nil
    end

    remask = Panel(Rect(0, 0, Client.width, Client.height))
    remask.color = Color(0,0,0,100)
    remask.showOnTop = true

    local panel = Image(path..'AlertPanel.png', Rect(0, 0, 305, 165))
    panel.anchor = 4
    panel.pivotX = 0.5
    panel.pivotY = 0.5
	panel.borderEnabled = true
    panel.borderColor = Color(0,0,0)
    panel.borderDistance = Point(1,1)
    remask.AddChild(panel)
    panel.height = #Item.data > 6 and panel.height + 47 or panel.height

	local title = Text('획득한 아이템', Rect(0, 0, panel.width, 45))
	title.color = Color(245,185,52)
    title.textAlign = 4
    title.textSize = 14
    panel.AddChild(title)

    local line = Panel(Rect(10, -1, title.width-20, 2))
    line.color = Color(255,255,255,50)
    line.anchor = 6
    line.pivotY = 1
    title.AddChild(line)

	local close = Image(path..'MenuBtnL2.png', Rect(10, -10, panel.width-20, 35))
    close.anchor = 6
    close.pivotY = 1
    panel.AddChild(close)
    local closeBtn = Button('확 인', Rect(0, 0, close.width, close.height))
    closeBtn.color = Color(0,0,0,0)
	closeBtn.textSize = 12
    close.AddChild(closeBtn)
    closeBtn.onMouseDown.Add(function()
		close.SetImage(path..'MenuBtnL2_press.png')
    end)
    closeBtn.onMouseUp.Add(function()
		close.SetImage(path..'MenuBtnL2.png')
        remask.Destroy()
        remask = nil
    end)

    local itemBG = Image(path..'ScrollPanel.png', Rect(10, title.height+10, panel.width-20, panel.height-115))
    itemBG.borderEnabled = true
	itemBG.borderColor = Color(0,0,0)
	itemBG.borderDistance = Point(1,1)
    panel.AddChild(itemBG)

    local itemSCP = ScrollPanel(Rect(0, 0, itemBG.width, itemBG.height))
    itemSCP.color = Color(0,0,0,0)
    itemSCP.horizontal = false
    itemBG.AddChild(itemSCP)

    local itemCON = Panel(Rect(0, 0, itemSCP.width, itemSCP.height))
    itemCON.color = Color(0,0,0,0)
    itemSCP.content = itemCON

    local list = {bg={},img={},txt={},mask={},btn={}}

    for i=1, #Item.data do
        local v = Item.data[i]
        local c = Item.count[tostring(v)]

        list.bg[i] = Panel(Rect(2.5+47*(((i%6==0 and 6) or i%6)-1), 2.5+47*math.ceil(i/6-1), 45, 45))
        list.bg[i].color = Color(255,255,255,0)
        itemCON.AddChild(list.bg[i])

        list.img[i] = Image('', Rect(7.5, 7.5, list.bg[i].width-15, list.bg[i].height-15))
        list.img[i].SetImageID(Client.GetItem(v).imageID)
        list.bg[i].AddChild(list.img[i])

        list.txt[i] = Text(c, Rect(2.5, 2.5, list.bg[i].width-5, list.bg[i].height-5))
        list.txt[i].textAlign = 8 
        list.txt[i].textSize = 12
        list.txt[i].borderEnabled = true
        list.txt[i].borderDistance = Point(0.8,0.8)
        list.txt[i].borderColor = Color(0,0,0)
        list.bg[i].AddChild(list.txt[i])

        list.btn[i] = Button('', Rect(0, 0, list.bg[i].width, list.bg[i].height))
        list.btn[i].color = Color(0,0,0,0)
        list.bg[i].AddChild(list.btn[i])
        list.btn[i].onClick.Add(function()
            Desc_Panel(true, v)
        end)
    end
    itemCON.height = 5+((math.ceil(#Item.data/6)*47)-2)

end
Client.GetTopic('Reward_Item').Add(Reward_Item)


function Alert_Panel(...)
    local Table = {...}
    
    local sendData = {}
    for i=3, #Table do
        sendData[#sendData+1] = Table[i]
    end

    if alertmask then
        alertmask.Destroy()
        alertmask = nil
    end

    alertmask = Panel(Rect(0, 0, Client.width, Client.height))
    alertmask.color = Color(0,0,0,100)
    alertmask.showOnTop = true

    local panel = Image(path..'AlertPanel.png', Rect(0, 0, 350, 220))
    panel.anchor = 4
    panel.pivotX = 0.5
    panel.pivotY = 0.5
    panel.borderEnabled = true
    panel.borderDistance = Point(1,1)
    panel.borderColor = Color(0,0,0)
    alertmask.AddChild(panel)

    local title = Text('알림', Rect(0, 0, panel.width, 45))
    title.color = Color(245, 185, 52)
    title.textAlign = 4
    title.textSize = 14
    panel.AddChild(title)

    local line = Panel(Rect(10, -1, panel.width-20, 2))
    line.color = Color(255,255,255,50)
    line.anchor = 6
    line.pivotY = 1
    title.AddChild(line)
    
    local text = Text(Table[1], Rect(0, title.height+10, panel.width, panel.height-(title.height+65)))
    text.textAlign = 4
    text.textSize = 13
    text.lineSpacing = 1.3
    panel.AddChild(text)

    local nbtnBG = Image(path..'MenuBtnL2.png', Rect(10, -10, (panel.width/2-15), 35))
    nbtnBG.anchor = 6
    nbtnBG.pivotY = 1
    panel.AddChild(nbtnBG)
    local nbtnBTN = Button('닫기', Rect(0, 0, nbtnBG.width, nbtnBG.height))
    nbtnBTN.color = Color(0,0,0,0)
    nbtnBTN.textSize = 12
    nbtnBG.AddChild(nbtnBTN)
    nbtnBTN.onMouseDown.Add(function()
        nbtnBG.SetImage(path..'MenuBtnL2_press.png')
    end)
    nbtnBTN.onMouseUp.Add(function()
        nbtnBG.SetImage(path..'MenuBtnL2.png')
        alertmask.Destroy()
        alertmask = nil
    end)

    local ybtnBG = Image(path..'MenuBtnL3.png', Rect(-10, -10, (panel.width/2-15), 35))
    ybtnBG.anchor = 8
    ybtnBG.pivotX = 1
    ybtnBG.pivotY = 1
    panel.AddChild(ybtnBG)
    local ybtnBTN = Button('확인', Rect(0, 0, ybtnBG.width, ybtnBG.height))
    ybtnBTN.color = Color(0,0,0,0)
    ybtnBTN.textSize = 12
    ybtnBG.AddChild(ybtnBTN)
    ybtnBTN.onMouseDown.Add(function()
        ybtnBG.SetImage(path..'MenuBtnL3_press.png')
    end)
    ybtnBTN.onMouseUp.Add(function()
        ybtnBG.SetImage(path..'MenuBtnL3.png')
        Client.FireEvent(Table[2], Utility.JSONSerialize(sendData))
        alertmask.Destroy()
        alertmask = nil
    end)
end