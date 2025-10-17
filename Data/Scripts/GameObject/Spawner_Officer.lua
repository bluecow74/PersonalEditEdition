--******************************************************************************
--     _______ __
--    |_     _|  |--.----.---.-.--.--.--.-----.-----.
--      |   | |     |   _|  _  |  |  |  |     |__ --|
--      |___| |__|__|__| |___._|________|__|__|_____|
--     ______
--    |   __ \.-----.--.--.-----.-----.-----.-----.
--    |      <|  -__|  |  |  -__|     |  _  |  -__|
--    |___|__||_____|\___/|_____|__|__|___  |_____|
--                                    |_____|
--*   @Author:              [TR]Pox
--*   @Date:                2018-03-20T01:27:01+01:00
--*   @Project:             Imperial Civil War
--*   @Filename:            Spawner_Officer.lua
--*   @Last modified by:    [TR]Pox
--*   @Last modified time:  2018-03-26T09:58:14+02:00
--*   @License:             This source code may only be used with explicit permission from the developers
--*   @Copyright:           © TR: Imperial Civil War Development Team
--******************************************************************************

require("MinorHeroSpawner")

function Definitions()
    DebugMessage("%s -- In Definitions", tostring(Script))

    Define_State("State_Init", State_Init);
end

function State_Init(message)
    if message == OnEnter then
        local space_IV_list
        local space_III_list
        local space_II_list
        local space_I_list
        local land_IV_list
        local land_III_list
        local land_II_list
        local land_I_list

        if Object.Get_Planet_Location() == FindPlanet("Kamino") and GlobalValue.Get("CURRENT_ERA") > 1 then
            land_IV_list = {
                {"Commander_Tier_IV_Republic_74Z_Speeder_Bike_Company", "Republic_BARC_Company", false},
                {"Commander_Tier_IV_Republic_BARC_Speeder_Company", "Republic_BARC_Company"},
                "Commander_Tier_IV_Republic_AT_RT_Walker"
            }
            land_III_list = {
                "Commander_Tier_III_Clone_Special_Ops_Company",
                "Commander_Tier_III_Clone_Airborne_Trooper_Company"
            }
            land_II_list = {
                "Commander_Tier_II_Clone_Galactic_Marine_Company",
                "Commander_Tier_II_Clone_Scout_Trooper_Company"
            }
            land_I_list = {
                {"Commander_Tier_I_Clone_Phase_One_Company", "Clonetrooper_Phase_Two_Company", false},
                {"Commander_Tier_I_Clone_Phase_Two_Company", "Clonetrooper_Phase_Two_Company"},
                {"Commander_Tier_I_ARC_Phase_One_Company", "ARC_Phase_Two_Company", false},
                {"Commander_Tier_I_ARC_Phase_Two_Company", "ARC_Phase_Two_Company"}
            }
        else
            land_IV_list = {
                "Commander_Tier_IV_AT_TE_Walker_Company",
                "Commander_Tier_IV_RX200_Falchion_Company"
            }
            land_III_list = {
                "Commander_Tier_III_Republic_ULAV_Company",
                "Commander_Tier_III_AT_XT_Walker_Company",
                {"Commander_Tier_III_TX130S_Company", "Republic_TX130T_Company", false},
                {"Commander_Tier_III_TX130T_Company", "Republic_TX130T_Company"}
            }
            land_II_list = {
                "Commander_Tier_II_Special_Tactics_Trooper_Company",
                "Commander_Tier_II_Senate_Commando_Company"
            }
            land_I_list = {
                "Commander_Tier_I_Republic_Navy_Trooper_Company",
                "Commander_Tier_I_Republic_Heavy_Trooper_Company"
            }
        end
        space_IV_list = {
            "Commander_Tier_IV_Invincible_Cruiser",
            "Commander_Tier_IV_Procurator_Battlecruiser",
            {"Commander_Tier_IV_Imperator_Star_Destroyer", "Imperator_Star_Destroyer"}
        }
        space_III_list = {
            "Commander_Tier_III_Acclamator_I_Assault",
            {"Commander_Tier_III_Venator_Star_Destroyer", "Venator_Star_Destroyer"},
            {"Commander_Tier_III_Victory_I_Star_Destroyer", "Victory_I_Star_Destroyer"},
            {"Commander_Tier_III_Victory_I_Fleet_Star_Destroyer", "Victory_I_Star_Destroyer"}
        }
        space_II_list = {
            {"Commander_Tier_II_Neutron_Star", "Neutron_Star"},
            "Commander_Tier_II_Acclamator_I_Carrier",
            "Commander_Tier_II_Acclamator_I_Supercruiser"
        }
        space_I_list = {
            "Commander_Tier_I_Arquitens",
            "Commander_Tier_I_PDF_DHC",
            "Commander_Tier_I_Rep_DHC"
        }
		elseif faction == Find_Player("Hutt_Cartels") then
			space_IV_list = {
				"Commander_Tier_IV_Voracious_Carrier",
				"Commander_Tier_IV_Vontor_Destroyer"
			}
			space_III_list = {
				"Commander_Tier_III_Szajin_Cruiser",
				"Commander_Tier_III_Karagga_Destroyer",
				"Commander_Tier_III_Space_ARC_Cruiser",
				"Commander_Tier_III_Refit_Venator_Star_Destroyer"
			}
			space_II_list = {
				"Commander_Tier_II_Ubrikkian_Cruiser_CW",
				"Commander_Tier_II_Kossak_Frigate",
				"Commander_Tier_II_Tempest_Cruiser",
				"Commander_Tier_II_Neutron_Star_Mercenary"
			}
			space_I_list = {
				"Commander_Tier_I_Kaloth_Battlecruiser",
				"Commander_Tier_I_Juvard_Frigate",
				"Commander_Tier_I_Barabbula_Frigate",
				"Commander_Tier_I_DHC_Gunboat"
			}
			land_IV_list = {
				"Commander_Tier_IV_WLO5_Tank_Company",
				"Commander_Tier_IV_Luxury_Barge_Company",
				"Commander_Tier_IV_A5_Juggernaut_Company"
			}
			land_III_list = {
				"Commander_Tier_III_Hutt_Bantha_II_Skiff_Company",
				"Commander_Tier_III_SuperHaul_II_Skiff_Company",
				"Commander_Tier_III_JX30_Company"
			}
			land_II_list = {
				"Commander_Tier_II_GuardianCorps_Company",
				"Commander_Tier_II_Armored_Hutt_Company",
				"Commander_Tier_II_Hutt_Airhook_Company"
			}
			land_I_list = {
				"Commander_Tier_I_Hutt_Guard_Company",
				"Commander_Tier_I_Gamorrean_Guard_Company",
				"Commander_Tier_I_Mandalorian_Soldier_Company"
			}
        Register_Timer(CadetLoop, 0, {
            Object, true,
            space_I_list, space_II_list, space_III_list, space_IV_list,
            land_I_list, land_II_list, land_III_list, land_IV_list
        })
    end
end
