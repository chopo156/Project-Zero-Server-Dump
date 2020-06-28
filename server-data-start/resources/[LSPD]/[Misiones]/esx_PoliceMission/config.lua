--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

-- Police Settings:
Config.RequiredPoliceOnline = 1			-- required police online for players to do missions
Config.PoliceDatabaseName = "police"	-- set the exact name from your jobs database for police
Config.PoliceNotfiyEnabled = true		-- police notification upon truck robbery enabled (true) or disabled (false)
Config.PoliceBlipShow = true			-- enable or disable blip on map on police notify
Config.PoliceBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.PoliceBlipRadius = 50.0			-- set radius of the police notify blip
Config.PoliceBlipAlpha = 250			-- set alpha of the blip
Config.PoliceBlipColor = 5				-- set blip color

-- ## MISSION NPC PART ## --

-- Location where get mission from NPC:
Config.MissionNPC = {
	{
		Pos = {x=-1083.26,y=-820.45,z=14.881},		-- set NPC coords here
		Heading = 264.39,							-- set heading of the NPC here
		Ped = 's_m_y_swat_01'						-- set npc model name here
	},
}

-- Set to true/false depending on whether you want blip on the map for npc
Config.EnableGoldJobBlip = true

-- Mission NPC Blip Settings:
Config.EnableMapBlip = true							-- set between true/false
Config.BlipNameOnMap = "Mision LSPD"				-- set name of the blip
Config.BlipSprite = 280								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.3								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/


-- ## GOLD JOB PART ## --

Config.MissionPosition = 
{
	{
		--------- Redada lago

		Location = vector3(731.43, 4172.37, 40.53),
		InUse = false,
		Heading = 211.12,
		GoonSpawns = {
			NPC1 = {
				x = 717.12,
				y = 4169.84,
				z = 40.71,
				h = 298.08,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC2 = {
				x = 718.75,
				y = 4170.55,
				z = 40.71,
				h = 117.78,
				ped = 's_m_m_chemsec_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_SMG',
			},
			NPC3 = {
				x = 723.22,
				y = 7157.53,
				z = 38.31,
				h = 181.22,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC4 = {
				x = 695.48,
				y = 7185.1,
				z = 41.32,
				h = 103.6,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC5 = {
				x = 726.2,
				y = 4187.56,
				z = 40.71,
				h = 356.84,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC6 = {
				x = 725.32,
				y = 4188.89,
				z = 40.71,
				h = 252.22,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC7 = {
				x = 726.77,
				y = 4189.34,
				z = 40.71,
				h = 147.62,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC8 = {
				x = 745.08,
				y = 4163.67,
				z = 41.35,
				h = 236.21,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC9 = {
				x = 756.28,
				y = 4172.76,
				z = 40.86,
				h = 316.91,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC10 = {
				x = 749.37,
				y = 4184.33,
				z = 41.09,
				h = 341.36,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC11 = {
				x = 728.28,
				y = 4173.57,
				z = 40.71,
				h = 357.58,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC12 = {
				x = 729.34,
				y = 4175.83,
				z = 40.71,
				h = 17.94,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC13 = {
				x = 775.75,
				y = 4186.42,
				z = 41.78,
				h = 3.06,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC14 = {
				x = 786.84,
				y = 4178.06,
				z = 41.78,
				h = 192.37,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC15 = {
				x = 672.97,
				y = 4182.85,
				z = 39.93,
				h = 206.2,
				ped = 's_m_m_chemsec_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_HEAVYSNIPER',
			}
		}
	},
	{
		------------ Redada Puerto Ballas
		
		Location = vector3(1012.44, -2903.51, 5.9),
		InUse = false,
		Heading = 266.67,
		GoonSpawns = {
			NPC1 = {
				x = 1014.14,
				y = -2898.32,
				z = 11.97,
				h = 166.12,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC2 = {
				x = 1003.41,
				y = -2900.01,
				z = 5.9,
				h = 184.2,
				ped = 'g_f_y_ballas_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_SMG',
			},
			NPC3 = {
				x = 1007.54,
				y = -2901.60,
				z = 5.9,
				h = 176.05,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC4 = {
				x = 1022.12,
				y = -2900.85,
				z = 5.9,
				h = 210.16,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC5 = {
				x = 1002.30,
				y = -2896.42,
				z = 11.26,
				h = 184.16,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC6 = {
				x = 1025.81,
				y = -2896.41,
				z = 11.26,
				h = 164.97,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC7 = {
				x = 1017.67,
				y = -2896.63,
				z = 15.22,
				h = 185.4,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC8 = {
				x = 1002.99,
				y = -2896.25,
				z = 16.43,
				h = 186.12,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC9 = {
				x = 991.05,
				y = -2905.55,
				z = 11.92,
				h = 235.11,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC10 = {
				x = 984.05,
				y = -2912.49,
				z = 43.13,
				h = 259.1,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC11 = {
				x = 988.56,
				y = -2932.63,
				z = 5.9,
				h = 268.58,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC12 = {
				x = 989.35,
				y = -2931.15,
				z = 5.9,
				h = 200.23,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC13 = {
				x = 971.67,
				y = -2908.84,
				z = 5.9,
				h = 211.60,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINIGUN',
			},
			NPC14 = {
				x = 972.93,
				y = -2908.07,
				z = 5.9,
				h = 183.23,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_COMBATMG',
			},
			NPC15 = {
				x = 984.05,
				y = -2912.49,
				z = 43.13,
				h = 259.1,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_HEAVYSNIPER',
			}
		}
	},

	{
		------------ Robo drogas 
		
		Location = vector3(105.0035400391,-1941.5546875,20.42578792572),
		InUse = false,
		Heading = 45.32929992676,
		GoonSpawns = {
			NPC1 = {
				x = 107.4285888672,
				y = -1939.6909179688,
				z = 20.275111198425,
				h = 61.84741973877,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_cop_idles@female@base',
				anim = 'base',
				weapon = 'WEAPON_SMG',
			},
			NPC2 = {
				x = 103.6131591797,
				y = -1945.9331054688,
				z = 20.999475479126,
				h = 40.08628845214,
				ped = 'g_f_y_ballas_01',
				animDict = 'rcmme_amanda1',
				anim = 'stand_loop_cop',
				weapon = 'WEAPON_SMG',
			},
			NPC3 = {
				x = 87.552734375,
				y = -1943.8950195313,
				z = 20.043141365051,
				h = 291.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC4 = {
				x = 90.552734375,
				y = -1951.8950195313,
				z = 20.043141365051,
				h = 317.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC5 = {
				x = 93.552734375,
				y = -1954.8950195313,
				z = 20.043141365051,
				h = 315.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC6 = {
				x = 110.552734375,
				y = -1956.8950195313,
				z = 20.043141365051,
				h = 25.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC7 = {
				x = 118.552734375,
				y = -1946.8950195313,
				z = 20.043141365051,
				h = 65.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC8 = {
				x = 116.552734375,
				y = -1933.8950195313,
				z = 20.043141365051,
				h = 116.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC9 = {
				x = 108.552734375,
				y = -1926.8950195313,
				z = 20.043141365051,
				h = 156.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC10 = {
				x = 97.552734375,
				y = -1917.8950195313,
				z = 20.043141365051,
				h = 151.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC11 = {
				x = 78.552734375,
				y = -1934.8950195313,
				z = 20.043141365051,
				h = 312.92164611816,
				ped = 'g_m_y_ballasout_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC12 = {
				x = 91.552734375,
				y = -1914.8950195313,
				z = 20.043141365051,
				h = 148.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_ASSAULTRIFLE',
			},
			NPC13 = {
				x = 88.552734375,
				y = -1926.8950195313,
				z = 20.043141365051,
				h = 49.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_MINIGUN',
			},
			NPC14 = {
				x = 98.552734375,
				y = -1934.8950195313,
				z = 20.043141365051,
				h = 48.92164611816,
				ped = 'g_f_y_ballas_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_COMBATMG',
			},
			NPC15 = {
				x = 100.552734375,
				y = -1915.8950195313,
				z = 21.843141365051,
				h = 131.92164611816,
				ped = 'g_m_y_ballaorig_01',
				animDict = 'amb@world_human_leaning@male@wall@back@legs_crossed@base',
				anim = 'base',
				weapon = 'WEAPON_HEAVYSNIPER',
			}
		}
	}
}

-- Gold Job Delivery Locations:
Config.DeliveryPoints = {
	vector3(3333.92,5161.19,18.31),
}

-- Gold Job Delivery Marker Setting:
Config.DeliveryDrawDistance  = 50.0
Config.DeliveryMarkerType  = 27
Config.DeliveryMarkerScale  = { x = 3.0, y = 3.0, z = 1.0 }
Config.DeliveryMarkerColor  = { r = 255, g = 255, b = 0, a = 100 }

-- Enable GTA style "mission complete/fail" notifications:
Config.EnableCustomNotification = true

-- Use BlackMoney or Cash for mission cost?
Config.UseBlackMoneyAsMissionCost = false

-- Set amount of money that mission should cost.
Config.MissionCost = 500

-- Set cooldown for doing gold jobs in minutes:
Config.JobCooldownTime = 3

-- Reward Settings:
Config.ItemName1 = ""				-- exact name of your item1
Config.ItemMinAmount1 = 1					-- set minimum reward amount of item1 (this value is multiplied with x100)
Config.ItemMaxAmount1 = 5					-- set maximum reward amount of item1 (this value is multiplied with x100)
Config.RandomChance = 2						-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.
