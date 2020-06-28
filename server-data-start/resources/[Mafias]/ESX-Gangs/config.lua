Config = {
    Gangs = {
        ["thelost"] = {-- gang_name in MySQL->gangs table
            Markers = {
                Management = {
                    Location = {x = 944.576, y = 1238.753, z = 365.12},
                    Color = {r = 255, g = 255, b = 0},
                },
            },
        },
        ["federation"] = {-- gang_name in MySQL->gangs table
            Markers = {
                Management = {
                    Location = {x = 1079.446, y = -1980.434, z = 30.471},
                    Color = {r = 255, g = 255, b = 0},
                },
            },
        },
        ["midnightclub"] = {-- gang_name in MySQL->gangs table
            Markers = {
                Management = {
                    Location = {x = -226.68, y = -1328.83, z = 29.89},
                    Color = {r = 0, g = 0, b = 0},
                },
            },
        },
        ["countryfolk"] = {-- gang_name in MySQL->gangs table
            Markers = {
                Management = {
                    Location = {x = -1580.284, y = 2050.705, z = 94.722},
                    Color = {r = 255, g = 255, b = 0},
                },
            },
        },        
    },
    Zones = {
        ["wepsale"] = {
            Location = {x = 3631.884, y = 3769.624, z = 27.516},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Weapon Sales",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["shipment_weapon_pistol"] = 10, 
                    ["shipment_weapon_pumpshotgun"] = 10,
                    ["shipment_weapon_smg"] = 10,
                    ["shipment_weapon_carbinerifle"] = 10,
                    ["shipment_weapon_gusenberg"] = 10,
                    ["shipment_weapon_sniperrifle"] = 10,
                    ["shipment_weapon_molotov"] = 10,
                }
            },
        },

        ["weptriggers"] = {
            Location = {x = 2485.411, y = 3434.848, z = 49.025},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Weapon Triggers",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["shipment_weapon_carbinerifle"] = 10,
                    ["shipment_weapon_assaultshotgun"] = 10,
                    ["shipment_weapon_assaultsmg"] = 10,
                    ["shipment_weapon_carbinerifle"] = 10,
                    ["weapon_trigger"] = 2500,

                }
            },
        },

        ["wepbody"] = {
            Location = {x = 431.441, y = 6466.085, z = 27.764},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Weapon Bodies",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["shipment_weapon_combatpdw"] = 10,
                    ["shipment_weapon_compactrifle"] = 10,
                    ["shipment_weapon_marksmanrifle_mk2"] = 10,
                    ["weapon_body"] = 2500,
                    
                }
            },
        },
        ["wepassem"] = {
            Location = {x = 2583.079, y = 292.918, z = 107.457},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Weapons Assembly",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["shipment_weapon_pumpshotgun_mk2"] = 10,
                    ["shipment_weapon_snspistol_mk2"] = 10,
                    ["shipment_weapon_specialcarbine_mk2"] = 10,
                    ["shipment_weapon_knuckle"] = 50,                    
                    ["weapon_body"] = 1750,
                    ["weapon_trigger"] = 1750,
                    
                }
            },
        },
        ["weedfarm"] = {
            Location = {x = 308.47, y = 4326.28, z = 47.33},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Weed Farming",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["weed_pooch"] = 500,
                }
            },
        },
        ["methfarm"] = {
            Location = {x = 62.18, y = 3697.59, z = 38.76},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Meth Farming",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["meth_pooch"] = 500,
                }
            },
        },
        ["cokefarm"] = {
            Location = {x = 1019.64, y = -2894.51, z = 10.26},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Coke Farming",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["coke_pooch"] = 500,
                }
            },
        },
        ["moonshinefarm"] = {
            Location = {x = -619.89, y = 2723.63, z = 30.28},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Moonshine Farming",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["moonshine_pooch"] = 500,
                }
            },
        },
        ["opiumfarm"] = {
            Location = {x = -650.22, y = 1404.02, z = 303.75},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Opium Farming",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                    ["opium_pooch"] = 500,
                }
            },
        },
        ["moneywash"] = {
            Location = {x = 642.99, y = 2778.399, z = 40.943},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Moneywash",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 10000,
                ["items"] = {
                    
                }
            },
        },
        ["chopshop"] = {
            Location = {x = -520.74, y = -1708.37, z = 18.29},
            Blip = {id = 84, color = 1},
            Color = {r = 255, g = 255, b = 255},
            Label = "Chop Shop",
            Rewards = {
                ["cash"] = 0,
                ["dcash"] = 5000,
                ["items"] = {
                ["highradio"] = 3,
                ["lowradio"] = 5,
                ["stockrim"] = 5,
                ["highrim"] = 3,
                ["battery"] = 3,
                ["airbag"] = 4,

                }
            },
        },
    },  
    AdministrativeGroups = {
        "admin",
        "superadmin",
    },
    CaptureTimer = 1, -- seconds 
    CaptureCooldown = 10, -- seconds
    WaitPeriod = 10,
    VehicleSpawnTimer = 180,
    ContestedColor = {r = 255, g = 0, b = 0},
}