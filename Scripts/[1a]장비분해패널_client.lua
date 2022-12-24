
Destroy = {}

-- 아이템 배경 기본색상
Destroy.normalCor = Color(0,0,0,0)

-- 아이템 선택 시 배경색상
Destroy.checkCor = Color(200,200,0,255)

-- 장비 타입 메뉴
Destroy.menuN = {'전체', '룬', '무기', '방어구', '악세사리'} -- 해당 이름으로 메뉴버튼 생성 (이름은 마음대로 바꿔도 상관없습니다)
Destroy.menuT = {}
Destroy.menuT[Destroy.menuN[1]] = {0,1,2,3,4,5,6,7,9}    -- '전체' 메뉴에 설정할 아이템 타입번호
Destroy.menuT[Destroy.menuN[2]] = {9}                     -- '룬'
Destroy.menuT[Destroy.menuN[3]] = {2}                     -- '무기'
Destroy.menuT[Destroy.menuN[4]] = {0,1,3,4}               -- '방어구'
Destroy.menuT[Destroy.menuN[5]] = {5,6}                   -- '악세사리'


-- 아이템 타입번호 : 모자 0 / 갑옷 1 / 무기 2 / 방패 3 / 신발 4 / 반지 5 / 악세사리 6 / 날개 7 / 포션 8 / 재료 9 /소모품 10

---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
local path = 'Pictures/분해UI/'
function Destroy:window()

    if self.mask then
        self.mask.Destroy()
        self.mask = nil
    end

    self.Tab_a = 1

    self.mask = Panel(Rect(0, 0, Client.width, Client.height))
    self.mask.color = Color(0,0,0,150)
    self.mask.showOnTop = true

    local panel = Image(path..'MainPanel.png', Rect(0, 0, 652, 420))
    panel.anchor = 4
    panel.pivotX = 0.5
    panel.pivotY = 0.5
    panel.borderEnabled = true
    panel.borderDistance = Point(1,1)
    panel.borderColor = Color(0,0,0)
    self.mask.AddChild(panel)

    local text = Text('장비분해', Rect(0, 0, panel.width, 45))
    text.color = Color(245, 185, 52)
    text.textAlign = 4
    text.textSize = 14
    panel.AddChild(text)

    local line = Panel(Rect(10, -1, panel.width-20, 2))
    line.color = Color(255,255,255,50)
    line.anchor = 6
    line.pivotY = 1
    text.AddChild(line)

    local close = Image(path..'icon_Close.png', Rect(-14.5, 0, 15, 15))
    close.anchor = 5
    close.pivotX = 1
    close.pivotY = 0.5
    text.AddChild(close)
    local closeBtn = Button('', Rect(0, 0, 45, text.height))
    closeBtn.color = Color(0,0,0,0)
    closeBtn.anchor = 2
    closeBtn.pivotX = 1
    closeBtn.textSize = 12
    closeBtn.textAlign = 4
    text.AddChild(closeBtn)
    closeBtn.onClick.Add(function()
        self.mask.Destroy()
        self.mask = nil
    end)

    local mpanel = Panel(Rect(10, text.height, panel.width-20, panel.height-(text.height+10)))
    mpanel.color = Color(0,0,0,0)
    panel.AddChild(mpanel)

    local mname = Text('종류', Rect(0, 0, 90, 25))
    mname.textAlign = 4
    mname.textSize = 12
    mpanel.AddChild(mname)

    local menuSCP = ScrollPanel(Rect(0, mname.height, mname.width, mpanel.height-60))
    menuSCP.color = Color(0,0,0,0)
    menuSCP.horizontal = false
    menuSCP.vertical = true
    mpanel.AddChild(menuSCP)

    local menuCON = Panel(Rect(0, 0, menuSCP.width, menuSCP.height))
    menuCON.color = Color(0,0,0,0)
    menuSCP.content = menuCON
    
    self.type = {bg={},btn={}}
    
    for i=1, #self.menuN do
        self.type.bg[i] = Image(path..'MenuBtn.png', Rect(0, (i-1)*43, menuCON.width, 40))
        self.type.bg[i].borderEnabled = true
        self.type.bg[i].borderColor = Color(0,0,0)
        self.type.bg[i].borderDistance = Point(1,1)
        menuCON.AddChild(self.type.bg[i])

        self.type.btn[i] = Button(self.menuN[i], Rect(0, 0, self.type.bg[i].width, self.type.bg[i].height))
        self.type.btn[i].color = Color(0,0,0,0)
        self.type.btn[i].textColor = Color(140,140,140)
        self.type.btn[i].textAlign = 4
        self.type.btn[i].textSize = 12
        self.type.bg[i].AddChild(self.type.btn[i])
        self.type.btn[i].onClick.Add(function()
            if self.Tab_a == i then return end

            for z, x in ipairs(self.type.bg) do
                self.type.bg[z].SetImage(path..'MenuBtn.png')
                self.type.btn[z].textColor = Color(140,140,140)
            end
            self.type.bg[i].SetImage(path..'MenuBtn_press.png')
            self.type.btn[i].textColor = Color(255,255,255)

            self.Tab_a = i
            Destroy:menuClick()
        end)
    end
    menuCON.height = (#self.menuN*43)-3

    local oname = Text('보유 장비', Rect(menuSCP.width+10, 0, 272, 25))
    oname.textAlign = 4
    oname.textSize = 12
    mpanel.AddChild(oname)

    local ownBG = Image(path..'ScrollPanel.png', Rect(oname.x, oname.height, oname.width, mpanel.height-oname.height))
    ownBG.borderEnabled = true
	ownBG.borderColor = Color(0,0,0)
	ownBG.borderDistance = Point(1,1)
    mpanel.AddChild(ownBG)

    self.ownSCP = ScrollPanel(Rect(0, 0, ownBG.width, ownBG.height))
    self.ownSCP.color = Color(0,0,0,0)
    self.ownSCP.horizontal = false
    self.ownSCP.vertical = true
    ownBG.AddChild(self.ownSCP)

    self.sname = Text('분해대상 장비', Rect(0, 0, 250, 25))
    self.sname.textAlign = 4
    self.sname.textSize = 12
    self.sname.anchor = 2
    self.sname.pivotX = 1
    mpanel.AddChild(self.sname)

    local selectBG = Image(path..'ScrollPanel_T.png', Rect(0, self.sname.height, self.sname.width, 290))
    selectBG.anchor = 2
    selectBG.pivotX = 1
    mpanel.AddChild(selectBG)

    self.selectSCP = ScrollPanel(Rect(0, 0, selectBG.width, selectBG.height))
    self.selectSCP.color = Color(0,0,0,0)
    self.selectSCP.vertical = true
    self.selectSCP.horizontal = false
    selectBG.AddChild(self.selectSCP)

    local funcBg = Panel(Rect(0, 0, 200, 40))
    funcBg.color = Color(0,0,0,0)
    funcBg.anchor = 8
    funcBg.pivotX = 1
    funcBg.pivotY = 1
    mpanel.AddChild(funcBg)

    local filter_bg = Image(path..'MenuBtnM.png', Rect(-5, 0, 45, funcBg.height))
    filter_bg.anchor = 3
    filter_bg.pivotX = 1
    filter_bg.pivotY = 0.5
    filter_bg.borderEnabled = true
    filter_bg.borderColor = Color(0,0,0)
    filter_bg.borderDistance = Point(1,1)
    funcBg.AddChild(filter_bg)

    local filter_img = Image(path..'icon_filter.png', Rect(0, 0, 17, 17))
    filter_img.anchor = 4
    filter_img.pivotX = 0.5
    filter_img.pivotY = 0.5
    filter_bg.AddChild(filter_img)

    local filter_btn = Button('', Rect(0, 0, filter_bg.width, filter_bg.height))
    filter_btn.color = Color(0,0,0,0)
    filter_bg.AddChild(filter_btn)
    filter_btn.onMouseDown.Add(function()
        filter_bg.SetImage(path..'MenuBtnM_press.png')
    end)
    filter_btn.onMouseUp.Add(function()
        filter_bg.SetImage(path..'MenuBtnM.png')

        local Filter_set = {level={},class={}}

        for i, v in ipairs(self.setting.filterLevel) do
            Filter_set.level[i] = v
        end
        for i, v in pairs(self.setting.filterClass) do
            Filter_set.class[i] = v
        end
      
        if self.flmask then
            self.flmask.Destroy()
            self.flmask = nil
        end

        self.flmask = Panel(Rect(0, 0, Client.width, Client.height))
        self.flmask.color = Color(0,0,0,100)
        self.flmask.showOnTop = true

        local panel = Image(path..'VerticalPanel.png', Rect(0, 0, 280, 280))
        panel.anchor = 4
        panel.pivotX = 0.5
        panel.pivotY = 0.5
        panel.borderEnabled = true
        panel.borderColor = Color(0,0,0)
        panel.borderDistance = Point(1,1)
        self.flmask.AddChild(panel)
    
        local title = Text('자동 선택 필터', Rect(0, 0, panel.width, 45))
        title.color = Color(245, 185, 52)
        title.textAlign = 4
        title.textSize = 14
        panel.AddChild(title)
    
        local line = Panel(Rect(10, -1, panel.width-20, 2))
        line.color = Color(255,255,255,50)
        line.anchor = 6
        line.pivotY = 1
        title.AddChild(line)
    
        local close = Image(path..'icon_Close.png', Rect(-14.5, 0, 15, 15))
        close.anchor = 5
        close.pivotX = 1
        close.pivotY = 0.5
        title.AddChild(close)
        local closeBtn = Button('', Rect(0, 0, 45, title.height))
        closeBtn.color = Color(0,0,0,0)
        closeBtn.anchor = 2
        closeBtn.pivotX = 1
        title.AddChild(closeBtn)
        closeBtn.onClick.Add(function()
            self.flmask.Destroy()
            self.flmask = nil
        end)

        local mpanel = Panel(Rect(10, title.height+10, panel.width-20, panel.height-(title.height+20)))
        mpanel.color = Color(0,0,0,0)
        panel.AddChild(mpanel)

        local l_tab = Image(path..'MenuTab.png', Rect(0, 0, mpanel.width, 25))
        mpanel.AddChild(l_tab)

        local l_txt = Text('강화된 장비', Rect(5, 0, l_tab.width-10, l_tab.height))
        l_txt.textAlign = 3
        l_txt.textSize = 12
        l_tab.AddChild(l_txt)

        local l_bg = Image(path..'ClassBtnM_'..Filter_set.level[1]..'.png', Rect(5, l_tab.height+10, 80, 40))
        mpanel.AddChild(l_bg)
       
        local l_levtxt = Text('', Rect(0, 0, l_bg.width, l_bg.height))
        l_levtxt.textAlign = 4
        l_levtxt.textSize = 12
        l_levtxt.borderEnabled = true
        l_levtxt.borderColor = Color(0,0,0)
        l_levtxt.borderDistance = Point(0.6,0.6)
        l_bg.AddChild(l_levtxt)

        local l_btn = Button('', Rect(0, 0, l_bg.width, l_bg.height))
        l_btn.color = Color(0,0,0,0)
        l_bg.AddChild(l_btn)

        local l_setbg = Panel(Rect(l_bg.width+17, l_bg.y, 160, l_bg.height))
        l_setbg.color = Color(0,0,0,0)
        mpanel.AddChild(l_setbg)

        l_btn.onClick.Add(function()
            if Filter_set.level[1] == 0 then
                Filter_set.level[1] = 1
                l_setbg.visible = true
                l_levtxt.text = '포함'
            else
                Filter_set.level[1] = 0
                l_setbg.visible = false
                l_levtxt.text = '제외'
            end
            l_bg.SetImage(path..'ClassBtnM_'..Filter_set.level[1]..'.png')
        end)
        if Filter_set.level[1] == 0 then
            l_setbg.visible = false
            l_levtxt.text = '제외'
        else
            l_setbg.visible = true
            l_levtxt.text = '포함'
        end  
  
        local l_setbtnbg = Image(path..'InputImg.png', Rect(0, 0, 65, 30))
        l_setbtnbg.anchor = 3
        l_setbtnbg.pivotY = 0.5
        l_setbtnbg.borderEnabled = true
        l_setbtnbg.borderColor = Color(0,0,0)
        l_setbtnbg.borderDistance = Point(1,1)
        l_setbg.AddChild(l_setbtnbg)
        local l_setbtn = Button('+'..Filter_set.level[2], Rect(0, 0, l_setbtnbg.width, l_setbtnbg.height))
        l_setbtn.color = Color(0,0,0,0)
        l_setbtn.textColor = Color(0,255,0)
        l_setbtn.textSize = 13
        l_setbtn.textAlign = 4
        l_setbtnbg.AddChild(l_setbtn)
        l_setbtn.onMouseDown.Add(function()
            l_setbtnbg.SetImage(path..'투명.png')
        end)
        l_setbtn.onMouseUp.Add(function()
            l_setbtnbg.SetImage(path..'InputImg.png')

            if self.inmask then
                self.inmask.Destroy()
                self.inmask = nil
            end
            self.inmask = Panel(Rect(0, 0, Client.width, Client.height))
            self.inmask.color = Color(0,0,0,100)
            self.inmask.showOnTop = true
    
            local panel = Image(path..'AlertPanel.png', Rect(0, 0, 280, 180))
            panel.anchor = 4
            panel.pivotX = 0.5
            panel.pivotY = 0.5
            panel.borderEnabled = true
            panel.borderColor = Color(0,0,0)
            panel.borderDistance = Point(1,1)
            self.inmask.AddChild(panel)

            local title = Text('자동선택 레벨 설정', Rect(0, 0, panel.width, 40))
            title.color = Color(245, 185, 52)
            title.textAlign = 4
            title.textSize = 14
            panel.AddChild(title)
    
            local line = Panel(Rect(10, -1, panel.width-20, 2))
            line.color = Color(255,255,255,50)
            line.anchor = 6
            line.pivotY = 1
            title.AddChild(line)

            local close = Image(path..'icon_Close.png', Rect(-14.5, 0, 15, 15))
            close.anchor = 5
            close.pivotX = 1
            close.pivotY = 0.5
            title.AddChild(close)
            local closeBtn = Button('', Rect(0, 0, 45, title.height))
            closeBtn.color = Color(0,0,0,0)
            closeBtn.anchor = 2
            closeBtn.pivotX = 1
            closeBtn.textSize = 12
            closeBtn.textAlign = 4
            title.AddChild(closeBtn)
            closeBtn.onClick.Add(function()
                self.inmask.Destroy()
                self.inmask = nil
            end)

            local input = InputField(Rect(0, 85, 180, 30))
            input.color = Color(255,255,255)
            input.textAlign = 4
            input.textSize = 12
            input.anchor = 1
            input.pivotX = 0.5
            input.contentType = 1
            input.characterLimit = 2
            input.imagePath = path..'InputPanel.png'
            panel.AddChild(input)

            local notice = '선택될 레벨을 입력하세요 (현재설정 <color=#00ff00>+'..Filter_set.level[2]..'</color> 이하)'
            local text = Text(notice, Rect(5, 0, panel.width-10, 45))
            text.textAlign = 4
            text.textSize = 12
            text.anchor = 1
            text.pivotX = 0.5
            text.pivotY = 1
            input.AddChild(text)

            input.onValueChanged.Add(function()
                if input.text == '' then
                    text.text = notice
                    return
                end
                if input.text == '0' then
                    input.text = '1'
                end
                text.text = '장비의 레벨이 <color=#00ff00>+'..input.text..'</color> 이하인 경우 자동선택 됩니다.'
            end)

            local setbtnBg = Image(path..'MenuBtnL2.png', Rect(0, -10, panel.width-20, 35))
            setbtnBg.anchor = 7
            setbtnBg.pivotX = 0.5
            setbtnBg.pivotY = 1
            panel.AddChild(setbtnBg)
            local setBtn = Button('설정하기', Rect(0, 0, setbtnBg.width, setbtnBg.height))
            setBtn.color = Color(0,0,0,0)
            setBtn.textSize = 12
            setBtn.textAlign = 4
            setbtnBg.AddChild(setBtn)
            setBtn.onMouseDown.Add(function()
                setbtnBg.SetImage(path..'MenuBtnL2_press.png')
            end)
            setBtn.onMouseUp.Add(function()
                setbtnBg.SetImage(path..'MenuBtnL2.png')
                if input.text == '' then
                    return
                end
                    
                Filter_set.level[2] = tonumber(input.text)
                l_setbtn.text = '+'..Filter_set.level[2]

                self.inmask.Destroy()
                self.inmask = nil
            end)
        end)

        local l_txt2 = Text('이하 장비', Rect(l_setbtnbg.width+7, 0, l_setbg.width-(l_setbtnbg.width+10), l_bg.height))
        l_txt2.textAlign = 3
        l_txt2.textSize = 12
        l_setbg.AddChild(l_txt2)

        local b_tab = Image(path..'MenuTab.png', Rect(0, l_bg.y+l_bg.height+10, mpanel.width, 25))
        mpanel.AddChild(b_tab)

        local b_txt = Text('제외할 등급', Rect(5, 0, b_tab.width-10, b_tab.height))
        b_txt.textAlign = 3
        b_txt.textSize = 12
        b_tab.AddChild(b_txt)

        local b_bg = Panel(Rect(0, b_tab.y+b_tab.height+10, mpanel.width, 150))
        b_bg.color = Color(0,0,0,0)
        mpanel.AddChild(b_bg)

        local list, cnt = {bg={},txt={},btn={}}, 0

        for i, v in pairs(self.cData) do
            cnt = cnt + 1

            list.bg[i] = Image(path..'ClassBtnM_'..Filter_set.class[i]..'.png', Rect(5+85*(((cnt%3==0 and 3) or cnt%3)-1), 45*math.ceil(cnt/3-1), 80, 40))
            b_bg.AddChild(list.bg[i])

            list.txt[i] = Text(v.name, Rect(0, 0, list.bg[i].width, list.bg[i].height))
            list.txt[i].textAlign = 4
            list.txt[i].textSize = 12
            list.txt[i].borderEnabled = true
            list.txt[i].borderColor = Color(0,0,0,200)
            list.txt[i].borderDistance = Point(0.6,0.6)
            list.bg[i].AddChild(list.txt[i])
    
            list.btn[i] = Button('', Rect(0, 0, list.bg[i].width, list.bg[i].height))
            list.btn[i].color = Color(0,0,0,0)
            list.bg[i].AddChild(list.btn[i])
            list.btn[i].onClick.Add(function()
                if Filter_set.class[i] == 0 then
                    Filter_set.class[i] = 1
                else
                    Filter_set.class[i] = 0
                end
                list.bg[i].SetImage(path..'ClassBtnM_'..Filter_set.class[i]..'.png')
            end)
        end
        local HE = ((math.ceil(cnt/3)-1) * 45) - 5
        mpanel.height = mpanel.height + HE
        panel.height = panel.height + HE

        local saveBg = Image(path..'MenuBtnL2.png', Rect(0, 0, mpanel.width, 35))
        saveBg.anchor = 7
        saveBg.pivotX = 0.5
        saveBg.pivotY = 1
        mpanel.AddChild(saveBg)
        local saveBtn = Button('저장하기', Rect(0, 0, saveBg.width, saveBg.height))
        saveBtn.color = Color(0,0,0,0)
        saveBtn.textSize = 12
        saveBtn.textAlign = 4
        saveBg.AddChild(saveBtn)
        saveBtn.onMouseDown.Add(function()
            saveBg.SetImage(path..'MenuBtnL2_press.png')
        end)
        saveBtn.onMouseUp.Add(function()
            saveBg.SetImage(path..'MenuBtnL2.png')
            
            self.setting.filterLevel = Filter_set.level
            self.setting.filterClass = Filter_set.class
            Client.FireEvent('Destroy:filterSet', Utility.JSONSerialize(Filter_set))

            self.flmask.Destroy()
            self.flmask = nil
            self.func.btn[2].onMouseUp.Call()
        end)
    end)

    self.func = {
        name = {'자동선택', '선택해제', '분 해'},
        img = {'MenuBtnM', 'MenuBtnM', 'MenuBtnMG'},
        bg={}, btn={}
    }
    
    for i=1, #self.func.name do
        self.func.bg[i] = Image(path..''..self.func.img[i]..'.png', Rect((i-1)*69, 0, 64, funcBg.height))
        self.func.bg[i].borderEnabled = true
        self.func.bg[i].borderColor = Color(0,0,0)
        self.func.bg[i].borderDistance = Point(1,1)
        funcBg.AddChild(self.func.bg[i])

        self.func.btn[i] = Button(self.func.name[i], Rect(0, 0, self.func.bg[i].width, self.func.bg[i].height))
        self.func.btn[i].color = Color(0,0,0,0)
        self.func.btn[i].textSize = 11
        self.func.bg[i].AddChild(self.func.btn[i])
        self.func.btn[i].onMouseDown.Add(function()
            self.func.bg[i].SetImage(path..''..self.func.img[i]..'_press.png')
        end)
    end

    self.func.btn[1].onMouseUp.Add(function()
        self.func.bg[1].SetImage(path..''..self.func.img[1]..'.png')
        Destroy:autoChoice()
    end)

    self.func.btn[2].onMouseUp.Add(function()
        self.func.bg[2].SetImage(path..''..self.func.img[2]..'.png')

        for z, x in ipairs(self.item.bg) do
            self.item.bg[z].color = self.normalCor
        end
        Destroy:menuClick(true)
    end)

    self.func.btn[3].onMouseUp.Add(function()
        self.func.bg[3].SetImage(path..''..self.func.img[3]..'.png')

        local reward_Items = {data={},min={},max={}}
        local destroy_List = {}

        for i, v in ipairs(self.selectList.tem) do
            if self.select.bg[i].visible == true then

                destroy_List[#destroy_List+1] = v.table.id

                for k, n in pairs(self.reward[tostring(v.table.data)]) do
                    local ns = tostring(n[1])
                    
                    if not reward_Items.min[ns] then
                        reward_Items.data[#reward_Items.data+1] = n[1]
                        reward_Items.min[ns] = (n[2] * v.table.count)
                        reward_Items.max[ns] = (n[3] * v.table.count)
                    else
                        reward_Items.min[ns] = reward_Items.min[ns] + (n[2] * v.table.count)
                        reward_Items.max[ns] = reward_Items.max[ns] + (n[3] * v.table.count)
                    end
                end
            end
        end

        if #destroy_List == 0 then
            Client.ShowCenterLabel('<size=16><color=Red>선택된 아이템이 없습니다.</color></size>')
            return
        end
 
        if self.vmask then
            self.vmask.Destroy()
            self.vmask = nil
        end
        self.vmask = Panel(Rect(0, 0, Client.width, Client.height))
        self.vmask.color = Color(0,0,0,100)
        self.vmask.showOnTop = true

        local panel = Image(path..'VerticalPanel.png', Rect(0, 0, 300, 160))
        panel.anchor = 4
        panel.pivotX = 0.5
        panel.pivotY = 0.5
        panel.borderEnabled = true
        panel.borderColor = Color(0,0,0)
        panel.borderDistance = Point(1,1)
        self.vmask.AddChild(panel)
    
        local text = Text('획득 가능한 아이템', Rect(0, 0, panel.width, 45))
        text.color = Color(245, 185, 52)
        text.textAlign = 4
        text.textSize = 14
        panel.AddChild(text)
    
        local line = Panel(Rect(10, -1, panel.width-20, 2))
        line.color = Color(255,255,255,50)
        line.anchor = 6
        line.pivotY = 1
        text.AddChild(line)
    
        local close = Image(path..'icon_Close.png', Rect(-14.5, 0, 15, 15))
        close.anchor = 5
        close.pivotX = 1
        close.pivotY = 0.5
        text.AddChild(close)
        local closeBtn = Button('', Rect(0, 0, 45, text.height))
        closeBtn.color = Color(0,0,0,0)
        closeBtn.anchor = 2
        closeBtn.pivotX = 1
        closeBtn.textSize = 12
        closeBtn.textAlign = 4
        text.AddChild(closeBtn)
        closeBtn.onClick.Add(function()
            self.vmask.Destroy()
            self.vmask = nil
        end)

        local vscroll = ScrollPanel(Rect(10, text.height+8, panel.width-20, panel.height-(text.height+65)))
        vscroll.color = Color(0,0,0,0)
        vscroll.horizontal = false
        vscroll.showVerticalScrollbar = true
        vscroll.verticalScrollbar.scale = Point(0.4, 1)
        vscroll.verticalScrollbar.color = Color(255,255,255,50)
        panel.AddChild(vscroll)

        local vcontent = Panel(Rect(0, 0, vscroll.width, vscroll.height))
        vcontent.color = Color(0,0,0,0)
        vscroll.content = vcontent

        local N = #reward_Items.data
        panel.height = N > 5 and panel.height + (4*51) or panel.height + ((#reward_Items.data-1)*51)
        vscroll.height = N > 5 and (5*51) - 1 or (#reward_Items.data*51) - 1
        vcontent.width = N > 5 and vcontent.width - 15 or vscroll.width
        vcontent.height = (#reward_Items.data*51) - 1

        local list, cnt = {bg={},img={},txt={},btn={}}, 0

        for i, v in ipairs(reward_Items.data) do
            local min = reward_Items.min[tostring(v)]
            local max = reward_Items.max[tostring(v)]
            local count = min == max and min or min..' ~ '..max

            list.bg[i] = Image(path..'DescPanel.png', Rect(0, (i-1)*51, vcontent.width, 50))
            vcontent.AddChild(list.bg[i])
    
            list.img[i] = Image('', Rect(9, 9, list.bg[i].height-18, list.bg[i].height-18))
            list.img[i].SetImageID(Client.GetItem(v).imageID)
            list.bg[i].AddChild(list.img[i])
    
            list.txt[i] = Text(Client.GetItem(v).name..'\n<size=11>'..count..'개</size>', Rect((list.img[i].x*2)+list.img[i].width, 0, list.bg[i].width-((list.img[i].x*2)+list.img[i].width), list.bg[i].height))
            list.txt[i].textAlign = 3
            list.txt[i].textSize = 12
            list.txt[i].lineSpacing = 1.2
            list.bg[i].AddChild(list.txt[i])

            list.btn[i] = Button('', Rect(0, 0, list.bg[i].width, list.bg[i].height))
            list.btn[i].color = Color(0,0,0,0)
            list.bg[i].AddChild(list.btn[i])
            list.btn[i].onClick.Add(function()
                Desc_Panel(true, v)
            end)
        end

        local desrtoy = Image(path..'MenuBtnL2.png', Rect(0, -10, vscroll.width, 35))
        desrtoy.anchor = 7
        desrtoy.pivotX = 0.5
        desrtoy.pivotY = 1
        panel.AddChild(desrtoy)
        local desrtoyBtn = Button('분해하기', Rect(0, 0, desrtoy.width, desrtoy.height))
        desrtoyBtn.color = Color(0,0,0,0)
        desrtoyBtn.textSize = 12
        desrtoy.AddChild(desrtoyBtn)
        desrtoyBtn.onMouseDown.Add(function()
            desrtoy.SetImage(path..'MenuBtnL2_press.png')
        end)
        desrtoyBtn.onMouseUp.Add(function()
            desrtoy.SetImage(path..'MenuBtnL2.png')

            Loading_start()
            Client.FireEvent('Destroy:Item', Utility.JSONSerialize(destroy_List))
            self.vmask.Destroy()
            self.vmask = nil
        end)
    end)
	--[[
    local autodesBg = Panel(Rect(0, 0, 90, 35))
    autodesBg.color = Color(0,0,0,0)
    autodesBg.anchor = 6
    autodesBg.pivotY = 1
    mpanel.AddChild(autodesBg)

    local autodesImg = Image(path..'icon_setting.png', Rect(7.5, 7.5, autodesBg.height-15, autodesBg.height-15))
    autodesBg.AddChild(autodesImg)

    local autodesTxt = Text('자동분해', Rect(autodesImg.x+autodesImg.width+7.5, 0, autodesBg.width-(autodesImg.x+autodesImg.width+15), autodesBg.height))
    autodesTxt.textAlign = 4
    autodesTxt.textSize = 12
    autodesBg.AddChild(autodesTxt)

    local autodesBtn = Button('', Rect(0, 0, autodesBg.width, autodesBg.height))
    autodesBtn.color = Color(0,0,0,0)
    autodesBtn.textSize = 12
    autodesBg.AddChild(autodesBtn)
    autodesBtn.onMouseDown.Add(function()
        autodesImg.SetImage(path..'투명.png')
        autodesTxt.text = ''
    end)
    autodesBtn.onMouseUp.Add(function()
        autodesImg.SetImage(path..'icon_setting.png')
        autodesTxt.text = '자동분해'

        local autoDes_set = {}
        for i, v in pairs(self.setting.autoDestroy) do 
            autoDes_set[i] = v
        end

        if self.admask then
            self.admask.Destroy()
            self.admask = nil
        end

        self.admask = Panel(Rect(0, 0, Client.width, Client.height))
        self.admask.color = Color(0,0,0,100)
        self.admask.showOnTop = true
    
        local panel = Image(path..'VerticalPanel.png', Rect(0, 0, 280, 320))
        panel.anchor = 4
        panel.pivotX = 0.5
        panel.pivotY = 0.5
        panel.borderEnabled = true
        panel.borderColor = Color(0,0,0)
        panel.borderDistance = Point(1,1)
        self.admask.AddChild(panel)
    
        local title = Text('자동 분해 설정', Rect(0, 0, panel.width, 45))
        title.color = Color(245, 185, 52)
        title.textAlign = 4
        title.textSize = 14
        panel.AddChild(title)
    
        local line = Panel(Rect(10, -1, panel.width-20, 2))
        line.color = Color(255,255,255,50)
        line.anchor = 6
        line.pivotY = 1
        title.AddChild(line)

        local close = Image(path..'icon_Close.png', Rect(-14.5, 0, 15, 15))
        close.anchor = 5
        close.pivotX = 1
        close.pivotY = 0.5
        title.AddChild(close)
        local closeBtn = Button('', Rect(0, 0, 45, title.height))
        closeBtn.color = Color(0,0,0,0)
        closeBtn.anchor = 2
        closeBtn.pivotX = 1
        title.AddChild(closeBtn)
        closeBtn.onClick.Add(function()
            self.admask.Destroy()
            self.admask = nil
        end)

        local mpanel = Panel(Rect(10, title.height+10, panel.width-20, panel.height-(title.height+65)))
        mpanel.color = Color(0,0,0,0)
        panel.AddChild(mpanel)

        self.auto, cnt = {bg={},txt={},btn={}}, 0

        for i, v in pairs(self.cData) do
            cnt = cnt + 1

            self.auto.bg[i] = Image(path..'ClassBtnL_'..autoDes_set[i]..'.png', Rect(132.5*(((cnt%2==0 and 2) or cnt%2)-1), 45*math.ceil(cnt/2-1), 127.5, 40))
            mpanel.AddChild(self.auto.bg[i])

            self.auto.txt[i] = Text(v.name..'등급', Rect(0, 0, self.auto.bg[i].width, self.auto.bg[i].height))
            self.auto.txt[i].textAlign = 4
            self.auto.txt[i].textSize = 12
            self.auto.txt[i].borderEnabled = true
            self.auto.txt[i].borderColor = Color(0,0,0,200)
            self.auto.txt[i].borderDistance = Point(0.6,0.6)
            self.auto.bg[i].AddChild(self.auto.txt[i])

            self.auto.btn[i] = Button('', Rect(0, 0, self.auto.bg[i].width, self.auto.bg[i].height))
            self.auto.btn[i].color = Color(0,0,0,0)
            self.auto.bg[i].AddChild(self.auto.btn[i])
            self.auto.btn[i].onClick.Add(function()
                autoDes_set[i] = autoDes_set[i] == 0 and 1 or 0
                self.auto.bg[i].SetImage(path..'ClassBtnL_'..autoDes_set[i]..'.png')
            end)
        end

        local saveBg = Image(path..'MenuBtnL2.png', Rect(0, -10, panel.width-20, 35))
        saveBg.anchor = 7
        saveBg.pivotX = 0.5
        saveBg.pivotY = 1
        panel.AddChild(saveBg)
        local saveBtn = Button('저장하기', Rect(0, 0, saveBg.width, saveBg.height))
        saveBtn.color = Color(0,0,0,0)
        saveBtn.textSize = 12
        saveBg.AddChild(saveBtn)
        saveBtn.onMouseDown.Add(function()
            saveBg.SetImage(path..'MenuBtnL2_press.png')
        end)
        saveBtn.onMouseUp.Add(function()
            saveBg.SetImage(path..'MenuBtnL2.png')

            Client.FireEvent('Destroy_autoSet', Utility.JSONSerialize(autoDes_set))
            self.setting.autoDestroy = autoDes_set

            self.admask.Destroy()
            self.admask = nil
        end)
    end)
	]]
    Loading_start()
    Client.FireEvent('Destroy:info')
end

function Destroy:autoChoice()
    
    self.clnum = self.clnum + 1

    if self.clnum > self.cDatalen then
        local Txt = self.setting.filterLevel[1] == 0 and '강화장비 제외 / ' or '강화 <color=#00ff00>+'..self.setting.filterLevel[2]..'</color> 이하 / '
        
        local Txt2 = ''
        for i=1, self.cDatalen do
            if self.setting.filterClass[tostring(i)] == 1 then
                Txt2 = Txt2 .. '<color='..self.cData[tostring(i)].color..'>'..self.cData[tostring(i)].name..'</color> '
            end
        end
        Txt2 = Txt2 == '' and '모든등급 포함' or Txt2 .. '등급 제외'
        Client.ShowCenterLabel('<size=16><color=Red>필터 조건에 해당하는 장비가 없습니다.</color></size>\n<size=14>('.. Txt..Txt2 ..')</size>')
        return
    end

    local cnt = 0

    for i, v in ipairs(self.ownTem[tostring(self.Tab_a)]) do
        local cn = self.class[tostring(v.data)]
        if not v.check.filter and not v.check.choice and tonumber(cn) == self.clnum then
            self.item.bg[i].color = self.checkCor

            local N = #self.selectList.tem+1
            self.selectList.tem[N] = {num=i, table=v}
            self.selectList.num[tostring(i)] = N

            v.check.choice = true
            cnt = cnt + 1
        end
    end

    if cnt == 0 then Destroy:autoChoice() return end

    local txt = self.menuN[self.Tab_a] == '전체' and '장비' or self.menuN[self.Tab_a]
	Client.ShowCenterLabel('<size=16><color='..self.cData[tostring(self.clnum)].color..'>'..self.cData[tostring(self.clnum)].name..'등급</color> '..txt..'<color=#00ff00> ' ..cnt..'</color>개가 선택되었습니다.</size>')
    Destroy:selectTem_create()
end


function Destroy.data(data,class,reward,item,setting)
    Destroy.cData = Utility.JSONParse(data)
    Destroy.class = Utility.JSONParse(class)
    Destroy.reward = Utility.JSONParse(reward)
    Destroy.tem = Utility.JSONParse(item)
    Destroy.setting = Utility.JSONParse(setting)

    Destroy.cDatalen = 0
    for _ in pairs(Destroy.cData) do Destroy.cDatalen = Destroy.cDatalen + 1 end

    Destroy.ownTem = {}
    for k=1, #Destroy.menuN do
        Destroy.ownTem[tostring(k)] = {}

        for i=1, #Destroy.tem.info do
            local v = Destroy.tem.info[i]
            local o = Destroy.tem.opts[tostring(i)]

            for j=1, #Destroy.menuT[Destroy.menuN[k]] do
                if Client.GetItem(v.data).type == Destroy.menuT[Destroy.menuN[k]][j] then
                    local N = #Destroy.ownTem[tostring(k)]+1
                    Destroy.ownTem[tostring(k)][N] = {}
                    Destroy.ownTem[tostring(k)][N].check = {}
                    Destroy.ownTem[tostring(k)][N].id = v.id
                    Destroy.ownTem[tostring(k)][N].data = v.data
                    Destroy.ownTem[tostring(k)][N].level = v.level
                    Destroy.ownTem[tostring(k)][N].count = v.count
                    Destroy.ownTem[tostring(k)][N].opts = o
                end
            end
        end
    end
    Destroy:menuClick()
end
Client.GetTopic('Destroy:data').Add(Destroy.data)


function Destroy:menuClick(filter_set)
    local SN = tostring(self.Tab_a)

    self.sname.text = '분해대상 장비'
    self.type.bg[self.Tab_a].SetImage(path..'MenuBtn_press.png')
    self.type.btn[self.Tab_a].textColor = Color(255,255,255)

    local lv_filter = self.setting.filterLevel[1] == 0 and 0 or self.setting.filterLevel[2]

    for i, v in ipairs(self.ownTem[SN]) do
        local cn = self.class[tostring(v.data)]
        if self.setting.filterClass[cn] == 0 and v.level <= lv_filter then
            v.check = {filter=false,choice=false}
        else
            v.check = {filter=true,choice=false}
        end
    end

    if self.selectCON then
        self.selectCON.Destroy()
        self.selectCON = nil
    end
    self.selectCON = Panel(Rect(0, 0, self.selectSCP.width-5, self.selectSCP.height))
    self.selectCON.color = Color(0,0,0,0)
    self.selectSCP.content = self.selectCON

    self.clnum = 0
    self.select, self.selectList = {bg={},img={},lev={},btn={}}, {tem={},num={}}

    if filter_set then return end

    if self.ownCON then
        self.ownCON.destroy()
        self.ownCON = nil
    end
    self.ownCON = Panel(Rect(0, 0, self.ownSCP.width, self.ownSCP.height))
    self.ownCON.color = Color(0,0,0,0)
    self.ownSCP.content = self.ownCON

    self.item = {bg={},img={},lev={},cnt={},btn={}}

    for i, v in ipairs(self.ownTem[SN]) do
        local lv = v.level == 0 and '' or '+'..v.level
        local cnt = v.count == 1 and '' or v.count

        self.item.bg[i] = Panel(Rect(2+45*(((i%6==0 and 6) or i%6)-1), 2+45*math.ceil(i/6-1), 43, 43))
        self.item.bg[i].color = self.normalCor
        self.ownCON.AddChild(self.item.bg[i])

        self.item.img[i] = Image('', Rect(5, 5, self.item.bg[i].width-10, self.item.bg[i].height-10))
        self.item.img[i].SetImageID(Client.GetItem(v.data).imageID)
        self.item.bg[i].AddChild(self.item.img[i])

        self.item.lev[i] = Text(lv, Rect(2.5, 2.5, self.item.bg[i].width-5, self.item.bg[i].height-5))
        self.item.lev[i].color = Color(0,255,0)
        self.item.lev[i].textAlign = 0
        self.item.lev[i].textSize = 12
        self.item.lev[i].borderEnabled = true
        self.item.lev[i].borderColor = Color(0,0,0)
        self.item.lev[i].borderDistance = Point(0.8,0.8)
        self.item.bg[i].AddChild(self.item.lev[i])

        self.item.cnt[i] = Text(cnt, Rect(2.5, 2.5, self.item.bg[i].width-5, self.item.bg[i].height-5))
        self.item.cnt[i].textAlign = 8
        self.item.cnt[i].textSize = 12
        self.item.cnt[i].borderEnabled = true
        self.item.cnt[i].borderColor = Color(0,0,0)
        self.item.cnt[i].borderDistance = Point(0.8,0.8)
        self.item.bg[i].AddChild(self.item.cnt[i])

        self.item.btn[i] = Button('', Rect(0, 0, self.item.bg[i].width, self.item.bg[i].height))
        self.item.btn[i].color = Color(0,0,0,0)
        self.item.bg[i].AddChild(self.item.btn[i])
        self.item.btn[i].onClick.Add(function()
            if not self.selectList.num[tostring(i)] then
                Destroy:itemInfo(i, v, 1)
            else
                Destroy:itemInfo(i, v, 2)
            end
        end)
    end
    self.ownCON.height = 2+(math.ceil(#self.ownTem[SN]/6)*45)
    Loading_end()
end
Client.GetTopic('분해UI열기').Add(function()
	Destroy:window()
end)

function Destroy:selectTem_create()
    for z=#self.select.bg+1, #self.selectList.tem do
        local i = self.selectList.tem[z].num
        local v = self.selectList.tem[z].table

        self.select.bg[z] = self.item.bg[i].Clone()
        self.select.bg[z].rect = (Rect(2+41.2*(((z%6==0 and 6) or z%6)-1), 2+41.2*math.ceil(z/6-1), 40, 40))
        self.select.bg[z].color = Color(0,0,0,0)
        self.selectCON.AddChild(self.select.bg[z])
    end
    Destroy:selectTem_array()
end

function Destroy:selectTem_array()
    local cnt = 0
    for i=1, #self.selectList.tem do
        if self.select.bg[i] and self.select.bg[i].visible == true then
            cnt = cnt + 1
            self.select.bg[i].x = 2+41.2*(((cnt%6==0 and 6) or cnt%6)-1)
            self.select.bg[i].y = 2+41.2*(math.ceil(cnt/6)-1)
        end
    end
    self.selectCON.height =  4+(math.ceil(cnt/6)*41.2)
    self.sname.text = cnt == 0 and '분해대상 장비' or '분해대상 장비 ('..cnt..')'
end

function Destroy:itemInfo(i, v, logic)

    local DescB = Button('', Rect(0, 0, Client.width,  Client.height))
    DescB.color = Color(0,0,0,0)
    DescB.showOnTop = true
    DescB.onClick.add(function()
        DescB.Destroy()
        DescB = nil
    end)

    local DescP = Panel(Rect(0, 0, 260, 420))
    DescP.color = Color(0,0,0,230)
    DescP.anchor = 4
    DescP.pivotX = 0.5
    DescP.pivotY = 0.5
    DescB.AddChild(DescP)

    local DescIBG = Image(path..'투명.png', Rect(0, 10, 48, 48))
    DescIBG.anchor = 1
    DescIBG.pivotX = 0.5
    DescP.AddChild(DescIBG)

    local DescIMG = Image('', Rect(7.5, 7.5, DescIBG.width-15, DescIBG.height-15))
    DescIMG.SetImageID(Client.GetItem(v.data).imageID)
    DescIBG.AddChild(DescIMG)

    local Dlev = v.level == 0 and '' or '+'..v.level

    local DescLEV = Text(Dlev, Rect(2.5, 2.5, DescIBG.width-10, DescIBG.height-10))
    DescLEV.color = Color(0,255,0)
    DescLEV.textAlign = 0
    DescLEV.textSize = 12
    DescLEV.borderEnabled = true
    DescLEV.borderDistance = Point(0.8,0.8)
    DescLEV.borderColor = Color(0,0,0)
    DescIBG.AddChild(DescLEV)

    local DescNAME = Text(Client.GetItem(v.data).name ..' '.. Dlev, Rect(0, DescIBG.y+DescIBG.height-5, DescP.width-20, 25))
    DescNAME.textAlign = 4
    DescNAME.textSize = 13
    DescNAME.anchor = 1
    DescNAME.pivotX = 0.5
    DescP.AddChild(DescNAME)
    
    local DescLINE = Panel(Rect(0, 5, DescNAME.width, 1.5))
    DescLINE.color = Color(180,180,180,160)
    DescLINE.anchor = 6
    DescNAME.AddChild(DescLINE)

    local DescT = Text('', Rect(10, DescNAME.y+DescNAME.height+15, DescP.width-20, DescP.height-(DescNAME.y+DescNAME.height+60)))
    DescT.textAlign = 0
    DescT.textSize = 12
    DescP.AddChild(DescT)

    local Type = '종류: '.. TypeName[Client.GetItem(v.data).type] ..'\n'
    local Trade = Client.GetItem(v.data).canSell and '<color=#3DB7CC>거래가능</color>\n' or '<color=Red>거래불가</color>\n'
    local SellPrice = '판매가격: '..comma(Client.GetItem(v.data).sellerPrice)..'\n'
    local Opt = ''

    if #v.opts ~= 0 then
        Opt = '\n<color=#FF00FF>옵션</color>\n' or ''
        for i=1, #v.opts, 3 do
            Opt = Opt .. Option_Text(v.opts[i], v.opts[i+1], v.opts[i+2])
        end
    end
    DescT.text = Trade .. SellPrice .. Type .. Client.GetItem(v.data).desc .. Opt

    local btnimg = logic == 1 and 'MenuBtnL3' or 'MenuBtnL'
    local Desc_YBG = Image(path..''..btnimg..'.png', Rect(0, -7.5, DescP.width-15, 45))
    Desc_YBG.anchor = 7
    Desc_YBG.pivotX = 0.5
    Desc_YBG.pivotY = 1
    DescP.AddChild(Desc_YBG)

    local btntxt = logic == 1 and '선택하기' or '해제하기'
    local Desc_YBTN = Button(btntxt, Rect(0, 0, Desc_YBG.width, Desc_YBG.height))
    Desc_YBTN.color = Color(0,0,0,0)
    Desc_YBTN.textSize = 12
    Desc_YBG.AddChild(Desc_YBTN)

    Desc_YBTN.onMouseDown.Add(function()
        Desc_YBG.SetImage(path..''..btnimg..'_press.png')
    end)
    Desc_YBTN.onMouseUp.Add(function()
        Desc_YBG.SetImage(path..''..btnimg..'.png')

        if logic == 1 then

            self.item.bg[i].color = self.checkCor

            local N = #self.selectList.tem+1
            self.selectList.tem[N] = {num=i, table=v}
            self.selectList.num[tostring(i)] = N

            v.check.choice = true
            Destroy:selectTem_create()

        elseif logic == 2 then

            self.clnum = 0
            self.item.bg[i].color = self.normalCor

            local N = self.selectList.num[tostring(i)]
            self.select.bg[N].visible = false
            self.selectList.num[tostring(i)] = false

            v.check.choice = false
            Destroy:selectTem_array()
        end

        DescB.Destroy()
        DescB = nil
    end)
end
