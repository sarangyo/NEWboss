local box = {}
function box:random_box(path, T, id)
	math.randomseed(os.time())
	self.main_pal = Image("Pictures/random_box/background.png", Rect(0, 0, 220, 160))
	self.main_pal.showOnTop = true
	self.main_pal.anchor = 4
	self.main_pal.pivotX = 0.5
	self.main_pal.pivotY = 0.5

	local item_pal = Image("Pictures/random_box/unknown_block.png", Rect(0, 10, 68, 68))
	item_pal.anchor = 1
	item_pal.pivotX = 0.5
	self.main_pal.AddChild(item_pal)

	local getItem = Client.GetItem
	self.item_img = Image("", Rect(2, 2, 64, 64))
	self.item_img.SetImageID(getItem(path).imageID)
	item_pal.AddChild(self.item_img)
	
	self.item_count = Text('', Rect(0, 0, self.item_img.width, self.item_img.height))
	self.item_count.textSize = 16
	self.item_count.borderEnabled = true
	self.item_count.borderColor = Color(0, 0, 0)
	self.item_count.borderDistance = Point(1, 1)
	self.item_count.textAlign = 8
	self.item_count.visible = false
	self.item_img.AddChild(self.item_count)

	local item_txtY = item_pal.y + item_pal.height + 4
	self.item_txt = Text("", Rect(0, item_txtY, 200, 20))
	self.item_txt.textAlign = 4
	self.item_txt.textSize = 15
	self.item_txt.anchor = 1
	self.item_txt.pivotX = 0.5
	self.main_pal.AddChild(self.item_txt)

	local but_imgY = self.item_txt.y+self.item_txt.height+10
	self.but_img1 = Image('Pictures/random_box/button.png', Rect(0, but_imgY, 75, 32))
	self.but_img1.anchor = 1
	self.but_img1.pivotX = -0.1
	self.but_img1.visible = false
	self.main_pal.AddChild(self.but_img1)
	
	self.but_img2 = Image('Pictures/random_box/button.png', Rect(0, but_imgY, self.but_img1.width, self.but_img1.height))
	self.but_img2.anchor = 1
	self.but_img2.pivotX = 1.1
	self.but_img2.visible = false
	self.main_pal.AddChild(self.but_img2)
	
	local but_txt1 = Button('닫 기', Rect(0, 0, self.but_img1.width, self.but_img1.height))
	but_txt1.color = Color(0, 0, 0, 0)
	but_txt1.textSize = 17
	self.but_img1.AddChild(but_txt1)
	but_txt1.onClick.Add(function()
		self.main_pal.Destroy()
		self.main_pal = nil
	end)
	
	
	
	local but_txt2 = Button('계 속', Rect(0, 0, self.but_img1.width, self.but_img1.height))
	but_txt2.color = Color(0, 0, 0, 0)
	but_txt2.textSize = 17
	self.but_img2.AddChild(but_txt2)
	
	local dark_panel = Panel(Rect(0, 0, self.but_img1.width, self.but_img1.height))
	self.but_img2.AddChild(dark_panel)
	dark_panel.visible = false
	but_txt2.onClick.Add(function()
		dark_panel.visible = true
		Client.RunLater(function()
			dark_panel.visible = false
		end, 0.35)
		Client.FireEvent('box_keepOpen', path, id)
	end)

	self.hide_pal = Panel(Rect(0, 0, item_pal.width, item_pal.height))
	self.hide_pal.color = Color(255, 255, 255)
	self.hide_pal.visible = false
	item_pal.AddChild(self.hide_pal)

	self.bar01 = Panel(Rect(0, but_imgY + 2, 120, 28))
	self.bar01.anchor = 1
	self.bar01.pivotX = 0.5
	self.bar01.color = Color(128, 128, 0)
	self.main_pal.AddChild(self.bar01)

	local bar02 = Panel(Rect(1, 1, 1, 26))
	bar02.color = Color(255, 255, 0)
	self.bar01.AddChild(bar02)

	bar02.DOScale(Point(118, 1), 5)

	local me = Client.myPlayerUnit
	local point = {[0] = Point(1, 1), [1] = Point(5, 1)}
	local names = {text = {}, dataID = {}}
	local j = 1
	for i, _ in pairs(T) do
		names.text[j] = getItem(tonumber(i)).name
		names.dataID[j] = tonumber(i)
		j = j + 1
	end
	me.PlaySE("랜덤상자/상자 여는중.ogg", 1)
	for i = 1, 44 do
		Client.RunLater(function()
			self.item_img.DOMove(point[i % 2], 0.1)
		end, 0.1 * i)
	end
	for i = 1, 49 do
		Client.RunLater(function()
			math.randomseed(os.time()+rand(1, 10001))
			local num = math.random(1, #names.text)
			self.item_txt.text = names.text[num]
			if i >= 25 then
				self.item_img.SetImageID(getItem(names.dataID[num]).imageID)
				self.hide_pal.SetOpacity(255 / (50 - i))
				if i == 49 then
					Client.FireEvent('box_open', id, path)
				end
			end
		end, 0.1 * i)
	end
	Client.RunLater(function()
		self.hide_pal.visible = true
	end, 2.5)
end

Client.GetTopic("random_box").Add(function(path, table01, num)
	if box.main_pal then
		Client.FireEvent("box_false", path)
		return
	end
	box:random_box(path, Utility.JSONParse(table01), num)
end)

Client.GetTopic('box_show').Add(function(id, item_bool, count)
	if item_bool then
		box.but_img2.visible = true
		local R = box.item_img
		box.item_img.rect = Rect(R.x-6, R.y-6, R.width+12, R.height+12)
		Client.RunLater(function()
			box.item_img.rect = Rect(R.x+6, R.y+6, R.width-12, R.height-12)
		end, 0.2)
	else
		box.but_img1.pivotX = 0.5
		box.but_img2.visible = false
	end
	box.but_img1.visible = true
	box.bar01.visible = false
	box.hide_pal.visible = false
	box.item_count.text = count
	box.item_count.visible = true
	
	box.item_img.SetImageID(Client.GetItem(id).imageID)
	box.item_txt.text = Client.GetItem(id).name
	local me = Client.myPlayerUnit
	me.PlaySE('랜덤상자/상자 여는 소리.ogg', 1)
	me.PlaySE('랜덤상자/아이템 등장.ogg', 1)
end)