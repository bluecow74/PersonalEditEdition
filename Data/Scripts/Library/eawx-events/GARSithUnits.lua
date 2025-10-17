require("deepcore/std/class")
require("PGSpawnUnits")
require("eawx-util/StoryUtil")
require("eawx-util/UnitUtil")

---@class GARSithUnitsEvent
GARSithUnitsEvent = class()

function GARSithUnitsEvent:new(gc)
    self.is_complete = false
    self.is_valid = false
    
    self.ForPlayer = Find_Player("Empire")
    self.HumanPlayer = Find_Player("local")

    self.Killed_Heroes = 0
	self.Dookus = 0
    self.Order66_Flag = 0

    self:activate()

    self.galactic_hero_killed_event = gc.Events.GalacticHeroKilled
    self.galactic_hero_killed_event:attach_listener(self.on_galactic_hero_killed, self)
end

function GARSithUnitsEvent:activate()
    self.is_valid = true
    self:check_conditions()
end

function GARSithUnitsEvent:on_galactic_hero_killed(hero_name, owner)
    if (hero_name == "VENTRESS_TEAM")
	or (hero_name == "SORA_BULQ_TEAM")
	or (hero_name == "YANSU_GRJAK_TEAM")
	or (hero_name == "SEVRANCE_TEAM")
	or (hero_name == "SHAALA_DONEETA_TEAM") then
        self.Killed_Heroes = self.Killed_Heroes + 1
    end
	if (hero_name == "DOOKU_TEAM") then
        self.Dookus = self.Dookus + 1
    end
    self:check_conditions()
end

function GARSithUnitsEvent:check_conditions()
    local order_66 = GlobalValue.Get("ORDER_66")

    if order_66 == true and self.Order66_Flag == 0 then
        self.Order66_Flag = 1
    end

    if (self.Dookus >= 2) and (self.Killed_Heroes >= 1) and (self.Order66_Flag == 1) and (self.is_valid == true) then
        self:fulfil()
    end
end

function GARSithUnitsEvent:fulfil()
    if self.is_complete == false then
        self.is_complete = true
		
        UnitUtil.SetLockList("REBEL", {"Sith_Academy", "Dark_Jedi_Company", "Sith_Knight_Company"}, false)
		UnitUtil.SetLockList("EMPIRE", {"Sith_Academy", "Dark_Jedi_Company", "Sith_Knight_Company"})

        if self.ForPlayer == self.HumanPlayer then
            StoryUtil.Multimedia("TEXT_STORY_SITH_UNITS_AVAILABLE", 15, nil, "Emperor_Loop", 0)
        end

        self.galactic_hero_killed_event:detach_listener(self.on_galactic_hero_killed)
    end
end

return GARSithUnitsEvent
