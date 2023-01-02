-- 모든것은 38번 폴더안에 있다.
local m = Server.GetMap
local folder = m(38)
Global_map = {}

function Global_map:potal(id, x, y)
	if self[id] then
		if not unit then
			unit.SendSay('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0003</color>')
			unit.SendCenterLabel('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0003</color>')
			return
		end
		local X, Y  = x*32+16, y*-32-16
		local ch = rand(0, self[id])
		local change_ch = unit.field.channelID+1
		unit.SpawnAtFieldID(id, X, Y, ch)
		unit.FireEvent('채널변경', ch+1, change_ch)
	else
		if not unit then
			unit.SendSay('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0003</color>')
			unit.SendCenterLabel('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0003</color>')
			return
		end
		local X, Y  = x*32+16, y*-32-16
		local change_ch = unit.field.channelID+1
		unit.SpawnAtFieldID(id, X, Y)
		unit.FireEvent('채널변경', 1, change_ch)
	end
end

Server.GetTopic('채널변경시도').Add(function()
	if not (unit and unit.field) then
		unit.SendSay('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0004</color>')
		unit.SendCenterLabel('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0004</color>')
		return
	end
	
	local id = unit.field.dataID
	if Global_map[id] then
		local data = {}
		for i=1, Global_map[id] do
			local f = Server.GetField(id, i-1)
			data[i] = f and f.playerCount or 0
		end
		unit.FireEvent('채널변경UI요구', unit.field.channelID+1, Utility.JSONSerialize(data), id, unit.field.name)
	else
		unit.SendCenterLabel('채널을 변경할 수 없는 맵입니다.')
	end
end)

local cool = 6
Server.GetTopic('채널선택완료').Add(function(ch, x, y, dataID)
	if not (unit and unit.field) then
		unit.SendSay('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0004</color>')
		unit.SendCenterLabel('<color=#FF0000>오류입니다. 운영자에게 문의해주세요.\n오류코드 : 0004</color>')
		return
	end
	
	if unit.field.dataID==dataID and unit.GetVar(135)+cool < os.time() then
		unit.SpawnAtFieldID(dataID, x, y, ch-1)
		unit.SetVar(135, os.time())
		unit.FireEvent('채널변경', unit.field.channelID+1)
	else
		unit.SendCenterLabel('채널변경까지 '..string.format('%.2f', unit.GetVar(135)+cool-os.time())..'초 남았습니다.')
	end
end)

m(2, m(1, folder)).channelCount = 10 --[[아주 넓은 평원]] Global_map[2] = 10
m(4, m(2, m(1, folder))).channelCount = 15 --[[넓디 넓은 평원]] Global_map[4] = 15
m(6, m(2, m(1, folder))).channelCount = 5 --[[보스가 모인 평원]] Global_map[6] = 5

m(3, m(1, folder)).channelCount = 10 --[[드넓은 평원]] Global_map[3] = 10
m(5, m(3, m(1, folder))).channelCount = 10 --[[무지개 평원]] Global_map[5] = 10
m(7, m(3, m(1, folder))).channelCount = 10 --[[무지개 평원2]] Global_map[7] = 10

m(9, m(8, folder)).channelCount = 10 --[[미노밭]] Global_map[9] = 10
m(10, m(9, m(8, folder))).channelCount = 10 --[[오크밭]] Global_map[10] = 10
m(11, m(9, m(8, folder))).channelCount = 15 --[[위험한 오크밭]] Global_map[11] = 15
m(12, m(9, m(8, folder))).channelCount = 5 --[[포식자 오크밭]] Global_map[12] = 5

m(13, m(8, folder)).channelCount = 15 --[[할로윈 괴물던전1]] Global_map[13] = 15
m(14, m(13, m(8, folder))).channelCount = 15 --[[할로윈 괴물던전2]] Global_map[14] = 15
m(15, m(13, m(8, folder))).channelCount = 15 --[[할로윈 괴물던전3]] Global_map[15] = 15
m(16, m(13, m(8, folder))).channelCount = 15 --[[할로윈 괴물던전4]] Global_map[16] = 15
m(17, m(13, m(8, folder))).channelCount = 5 --[[할로윈 괴물던전5]] Global_map[17] = 5
m(18, m(13, m(8, folder))).channelCount = 15 --[[할로윈 괴물던전6]] Global_map[18] = 15
m(19, m(13, m(8, folder))).channelCount = 15 --[[할로윈 괴물던전7]] Global_map[19] = 15

m(22, m(21, folder)).channelCount = 15 --[[할로윈 괴물던전8]] Global_map[22] = 15
m(23, m(22, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전9]] Global_map[23] = 15
m(24, m(22, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전10]] Global_map[24] = 15
m(25, m(22, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전11]] Global_map[25] = 15
m(26, m(22, m(21, folder))).channelCount = 5 --[[할로윈 괴물던전12]] Global_map[26] = 5

m(28, m(21, folder)).channelCount = 15 --[[할로윈 괴물던전13]] Global_map[28] = 15
m(29, m(28, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전14]] Global_map[29] = 15
m(30, m(28, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전15]] Global_map[30] = 15
m(31, m(28, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전16]] Global_map[31] = 15
m(32, m(28, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전17]] Global_map[32] = 15
m(33, m(28, m(21, folder))).channelCount = 15 --[[할로윈 괴물던전18]] Global_map[33] = 15
m(34, m(28, m(21, folder))).channelCount = 5 --[[할로윈 괴물던전19]] Global_map[34] = 5
m(80, m(21, folder)).channelCount = 99 --[[할로윈 괴물던전13]] Global_map[80] = 99

m(37, folder).channelCount = 15 --[[조각난 사원 필드]] Global_map[37] = 15
m(40, m(37, folder)).channelCount = 15 --[[조각난 사원 필드2]] Global_map[40] = 15
m(41, m(37, folder)).channelCount = 15 --[[조각난 사원 필드3]] Global_map[41] = 15
m(43, m(37, folder)).channelCount = 15 --[[조각난 사원 필드4]] Global_map[43] = 15
m(44, m(37, folder)).channelCount = 5 --[[조각난 사원 필드5]] Global_map[44] = 5
m(45, m(37, folder)).channelCount = 15 --[[우거진 숲]] Global_map[45] = 15
m(46, m(37, folder)).channelCount = 15 --[[우거진 숲2]] Global_map[46] = 15
m(47, m(37, folder)).channelCount = 15 --[[우거진 숲3]] Global_map[47] = 15
m(48, m(37, folder)).channelCount = 15 --[[우거진 숲4]] Global_map[48] = 15

m(50, m(49, folder)).channelCount = 10 --[[커오블린 동굴]] Global_map[50] = 10
m(51, m(49, folder)).channelCount = 20 --[[코이즈 필드]] Global_map[51] = 20
m(52, m(51, m(49, folder))).channelCount = 20 --[[코이즈 필드2]] Global_map[52] = 20
m(53, m(51, m(49, folder))).channelCount = 20 --[[코이즈 필드3]] Global_map[53] = 20
m(54, m(51, m(49, folder))).channelCount = 20 --[[코이즈 필드4]] Global_map[54] = 20
m(55, m(51, m(49, folder))).channelCount = 5 --[[코이즈 필드5]] Global_map[55] = 5
m(56, m(51, m(49, folder))).channelCount = 20 --[[리우브 필드]] Global_map[56] = 20
m(57, m(51, m(49, folder))).channelCount = 20 --[[리우브 필드2]] Global_map[57] = 20
m(58, m(51, m(49, folder))).channelCount = 20 --[[리우브 필드3]] Global_map[58] = 20
m(60, m(51, m(49, folder))).channelCount = 20 --[[리우브 필드4]] Global_map[60] = 20
m(59, m(51, m(49, folder))).channelCount = 5 --[[리우브 필드5]] Global_map[59] = 5

m(62, m(49, folder)).channelCount = 20 --[[다가오는 위험]] Global_map[62] = 20
m(63, m(62, m(49, folder))).channelCount = 20 --[[다가오는 위험2]] Global_map[63] = 20
m(64, m(62, m(49, folder))).channelCount = 20 --[[다가오는 위험3]] Global_map[64] = 20
m(65, m(62, m(49, folder))).channelCount = 20 --[[다가오는 위험4]] Global_map[65] = 20
m(66, m(62, m(49, folder))).channelCount = 20 --[[다가오는 위험5]] Global_map[66] = 20
m(67, m(62, m(49, folder))).channelCount = 5 --[[다가오는 위험6]] Global_map[67] = 5

m(70, m(49, folder)).channelCount = 20 --[[눈앞의 위험]] Global_map[70] = 20
m(71, m(70, m(49, folder))).channelCount = 20 --[[눈앞의 위험2]] Global_map[71] = 20
m(72, m(70, m(49, folder))).channelCount = 20 --[[눈앞의 위험3]] Global_map[72] = 20
m(73, m(70, m(49, folder))).channelCount = 20 --[[눈앞의 위험4]] Global_map[73] = 20
m(74, m(70, m(49, folder))).channelCount = 5 --[[눈앞의 위험5]] Global_map[74] = 5

m(76, m(75, folder)).channelCount = 20 --[[서리동굴]] Global_map[76] = 20
m(77, m(75, folder)).channelCount = 20 --[[서리동굴2]] Global_map[77] = 20
m(81, m(75, folder)).channelCount = 20 --[[서리동굴3]] Global_map[81] = 20
m(82, m(75, folder)).channelCount = 20 --[[서리동굴4]] Global_map[82] = 20
m(83, m(75, folder)).channelCount = 20 --[[서리동굴5]] Global_map[83] = 20
m(84, m(75, folder)).channelCount = 20 --[[서리동굴6]] Global_map[84] = 20
m(85, m(75, folder)).channelCount = 20 --[[서리동굴7]] Global_map[85] = 20
m(86, m(75, folder)).channelCount = 20 --[[서리동굴8]] Global_map[86] = 20
m(87, m(75, folder)).channelCount = 20 --[[서리동굴9]] Global_map[87] = 20
m(88, m(75, folder)).channelCount = 20 --[[서리동굴10]] Global_map[88] = 20
m(89, m(75, folder)).channelCount = 5 --[[서리동굴11]] Global_map[89] = 5
m(90, m(49, folder)).channelCount = 99 --[[내부]] Global_map[90] = 99
m(91, m(75, folder)).channelCount = 5 --[[위험1]] Global_map[91] = 5
m(92, m(75, folder)).channelCount = 5 --[[위험2]] Global_map[92] = 5
m(96, m(95, folder)).channelCount = 99 --[[내부]] Global_map[96] = 99

m(98, m(95, folder)).channelCount = 25 --[[터커즈 필드]] Global_map[98] = 25
m(100, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드2]] Global_map[100] = 25
m(101, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드3]] Global_map[101] = 25
m(102, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드4]] Global_map[102] = 25
m(103, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드5]] Global_map[103] = 25
m(105, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드6]] Global_map[105] = 25
m(106, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드7]] Global_map[106] = 25
m(107, m(98, m(95, folder))).channelCount = 25 --[[터커즈 필드8]] Global_map[107] = 25
m(108, m(98, m(95, folder))).channelCount = 5 --[[스태틱 케이브]] Global_map[108] = 5

m(109, m(95, folder)).channelCount = 25 --[[임시 필드]] Global_map[109] = 25
m(110, m(109, m(95, folder))).channelCount = 25 --[[임시 필드2]] Global_map[110] = 25
m(111, m(109, m(95, folder))).channelCount = 25 --[[임시 필드3]] Global_map[111] = 25
m(112, m(109, m(95, folder))).channelCount = 25 --[[임시 필드4]] Global_map[112] = 25
m(113, m(109, m(95, folder))).channelCount = 25 --[[임시 필드5]] Global_map[113] = 25
m(114, m(109, m(95, folder))).channelCount = 25 --[[임시 필드6]] Global_map[114] = 25
m(115, m(109, m(95, folder))).channelCount = 25 --[[임시 필드7]] Global_map[115] = 25
m(116, m(109, m(95, folder))).channelCount = 25 --[[임시 필드8]] Global_map[116] = 25
m(117, m(109, m(95, folder))).channelCount = 25 --[[임시 필드9]] Global_map[117] = 25
m(118, m(109, m(95, folder))).channelCount = 25 --[[임시 필드10]] Global_map[118] = 25
m(119, m(109, m(95, folder))).channelCount = 25 --[[임시 필드11]] Global_map[119] = 25






















