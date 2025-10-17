require("deepcore/std/class")
require("eawx-events/GenericResearch")
require("eawx-events/GenericSwap")
require("eawx-events/GenericConquer")
require("eawx-events/CISGrievousShipHandler")
require("eawx-events/CISMandaloreSupport")
require("eawx-events/CISHoldouts")
require("eawx-events/GARSithUnits")

---@class EventManager
EventManager = class()

function EventManager:new(galactic_conquest, human_player, planets)
    self.galactic_conquest = galactic_conquest
    self.human_player = human_player
    self.planets = planets
    self.starting_era = nil
    self.Active_Planets = StoryUtil.GetSafePlanetTable()
    
    self.RendiliConquer = GenericConquer(self.galactic_conquest,
        "CONQUER_RENDILI",
        "RENDILI", {"Rebel"},
        {"Mellor_Yago_Rendili_Reign"}, false)
        
    self.MonCalConquer = GenericConquer(self.galactic_conquest,
        "CONQUER_MON_CALAMARI",
        "MON_CALAMARI", {"Rebel"},
        {"Merai_Free_Dac"}, false)

    self.CISGrievousShipHandler = CISGrievousShipEvent(self.galactic_conquest)
    self.CISHoldouts = CISHoldoutsEvent(self.galactic_conquest)
    self.CISMandaloreSupport = CISMandaloreSupportEvent(self.galactic_conquest, self.Active_Planets["MANDALORE"])
	self.GARSithUnits = GARSithUnitsEvent(self.galactic_conquest)
end

function EventManager:update()
    self.CISMandaloreSupport:update()
end

return EventManager
