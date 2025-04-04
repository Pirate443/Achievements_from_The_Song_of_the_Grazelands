local sb_achievements = require("sb_achievements.interop")
local i18n = mwse.loadTranslations("SotG.Achievements")
local colours = {
		greenSotG  = { 63 / 255, 193 / 255, 55 / 255 },
		}

local function checkBook(e)
			if tes3.player.data.achievements.SotG_5 == false
				then
				if e.book.id == "KJS_song_grazelands" then SotGBook = true
				end
			end
		end

local function initializedcheckBook()
		SotGBook = false
		if not tes3.player.data.achievements.SotG_5 and not event.isRegistered("bookGetText", checkBook)
		then 
		event.register("bookGetText", checkBook)
		end
	  end
event.register(tes3.event.loaded, initializedcheckBook)

local function init()
	local iconPath = "Icons\\SotG\\"

	local cats = {
		main = sb_achievements.registerCategory(i18n("Main Quest")),
		side = sb_achievements.registerCategory(i18n("Side Quest")),
		faction = sb_achievements.registerCategory(i18n("Faction")),
		misc = sb_achievements.registerCategory(i18n("Miscellaneous"))
	}

	sb_achievements.registerAchievement {
		id = "SotG_1",
		category = cats.side,
		condition = function()
			return tes3.getJournalIndex { id = "KJS_SotG_Deserters" } >= 30
		end,
		icon = iconPath .. "SotG_Deserters.tga",
		colour = colours.greenSotG,
		title = i18n("SotG_Deserters.Name"), desc = i18n("SotG_Deserters.Desc"),
		configDesc = sb_achievements.configDesc.hideDesc,
		lockedDesc = sb_achievements.lockedMessage.steamKeepPlaying
	}
	
	sb_achievements.registerAchievement {
		id = "SotG_2",
		category = cats.side,
		condition = function()
			return tes3.getJournalIndex { id = "KJS_SotG_Pal" } >= 90
		end,
		icon = iconPath .. "SotG_Pal.tga",
		colour = colours.greenSotG,
		title = i18n("SotG_Pal.Name"), desc = i18n("SotG_Pal.Desc"),
		configDesc = sb_achievements.configDesc.hideDesc,
		lockedDesc = sb_achievements.lockedMessage.steamKeepPlaying
	}
	
	sb_achievements.registerAchievement {
		id = "SotG_3",
		category = cats.side,
		condition = function()
			return tes3.getJournalIndex { id = "KJS_SotG_Mabrigash" } >= 60
		end,
		icon = iconPath .. "SotG_Mabrigash.tga",
		colour = colours.greenSotG,
		title = i18n("SotG_Mabrigash.Name"), desc = i18n("SotG_Mabrigash.Desc"),
		configDesc = sb_achievements.configDesc.hideDesc,
		lockedDesc = sb_achievements.lockedMessage.steamKeepPlaying
	}
	
	sb_achievements.registerAchievement {
		id = "SotG_4",
		category = cats.side,
		condition = function()
			return tes3.getJournalIndex { id = "KJS_SotG_Vert" } >= 30
		end,
		icon = iconPath .. "SotG_Vert.tga",
		colour = colours.greenSotG,
		title = i18n("SotG_Vert.Name"), desc = i18n("SotG_Vert.Desc"),
		configDesc = sb_achievements.configDesc.hideDesc,
		lockedDesc = sb_achievements.lockedMessage.steamKeepPlaying
	}
	
	sb_achievements.registerAchievement {
		id = "SotG_5",
		category = cats.misc,
		condition = function()
			return SotGBook == true
		end,
		icon = iconPath .. "SotG_Song.tga",
		colour = colours.greenSotG,
		title = i18n("SotG_Song.Name"), desc = i18n("SotG_Song.Desc"),
		configDesc = sb_achievements.configDesc.hideDesc,
		lockedDesc = sb_achievements.lockedMessage.steamKeepPlaying
	}

end

local function initializedCallback(e)
	init()
end
event.register("initialized", initializedCallback, { priority = sb_achievements.priority + 1 })
