----------
--Hint when enter or leave combat
----------
local locale = GetLocale()
local L = {
	enterCombat = { default = "Enter Combat", zhTW = "進 入 戰 鬥", zhCN = " 进 入 战 斗" },
	leaveCombat = { default = "Leave Combat", zhTW = "離 開 戰 鬥", zhCN = " 离 开 战 斗" },
}

local alertFrame = CreateFrame("Frame")
alertFrame:SetSize(250, 40)
alertFrame:SetPoint("TOP", 0, -200)
alertFrame:SetScale(0.8)
alertFrame.Bg = alertFrame:CreateTexture(nil, "BACKGROUND")
alertFrame.Bg:SetTexture("Interface\\LevelUp\\MinorTalents")
alertFrame.Bg:SetPoint("TOP")
alertFrame.Bg:SetSize(260, 42)
alertFrame.Bg:SetTexCoord(0, 400/512, 341/512, 407/512)
alertFrame.Bg:SetVertexColor(1, 1, 1, 0.5)
alertFrame:Hide()

-- 小字体
-- GameFontNormalSmall GameFont_Gigantic GameFontHighlightSmall 
-- GameFontDisableSmall GameFontDisableSmall GameFontHighlightSmallOutline
-- GameFontDarkGraySmall GameFontDarkGraySmall GameFontGreenSmall GameFontRedSmall

-- 大字体
-- GameFontNormalLarge GameFontHighlightLarge GameFontDisableLarge GameFontDisableLarge GameFontGreenLarge GameFontRedLarge

-- 主要字体
-- GameFontNormal GameFontHighlight GameFontDisable GameFontDisable GameFontGreen GameFontRed

-- 极大字体：Raid警报
-- GameFontNormalHuge

alertFrame.text = alertFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightHuge")
alertFrame.text:SetPoint("CENTER")
alertFrame.text:SetTextColor(1, 1, 0)

-- alertFrame.text:SetText("进 入 战 斗")
-- alertFrame:Show()

alertFrame:SetScript("OnUpdate", function(self, elapsed)
	self.timer = self.timer + elapsed
	if (self.timer > self.totalTime) then self:Hide() end
	if (self.timer <= 0.5) then self:SetAlpha(self.timer * 2)
	elseif (self.timer > 2) then self:SetAlpha(1-self.timer/self.totalTime)
	end
end)

alertFrame:SetScript("OnShow", function(self)
    self.totalTime = 3.2
    self.timer = 0	
end)

alertFrame:SetScript("OnEvent", function(self, event, ...)
	self:Hide()
	if (event == "PLAYER_REGEN_DISABLED") then
		self.text:SetText(L.enterCombat[locale] or L.enterCombat.default)
   	elseif (event == "PLAYER_REGEN_ENABLED") then
    	self.text:SetText(L.leaveCombat[locale] or L.leaveCombat.default)
   	end
   	if CCYtable[1] == true then self:Show() end
--	if CCYtable[1] == true then print("COMBAT_CCYtable[1] = true") end -- for debug
--	if CCYtable[1] == false then print("COMBAT_CCYtable[1] = false") end -- for debug
end)

alertFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
alertFrame:RegisterEvent("PLAYER_REGEN_DISABLED")

----------
--LOADING HINT FOR DEBUG
----------
--print("ClassicCy_CombatHint 加载成功") -- for debug