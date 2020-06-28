Config = {}


Config.Peds = {

----------------------------------------------------------------------------
---------------------------- VESPUCCI LSPD ---------------------------------
----------------------------------------------------------------------------

------------------------ Sala de identificacion ----------------------------
  ['malandro1'] = {
    location = { x = -1099.39, y = -826.39, z = 3.89, heading = 126.69 },
    modelname = 's_m_y_dealer_01',
    static = true,
    animated = false
  },

  ['malandro2'] = {
    location = { x = -1097.57, y = -828.77, z = 3.89, heading = 126.69 },
    modelname = 'a_m_m_eastsa_02',
    static = true,
    animated = false
  },

  ['guardia1'] = {
    location = { x = -1095.69, y = -833.33, z = 3.89, heading = 44.56 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },
------------------------- Pasillo de las celdas -----------------------------
  ['guardia2'] = {
    location = { x = -1070.87, y = -823.86, z = 5.08, heading = 131.78 },
    modelname = 's_m_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' ---- Sentado en silla
  },
------------------------- Sala interrogatorios ------------------------------

  ['guardia3'] = {
    location = { x = -1086.81, y = -818.02, z = 4.49, heading = 257.56 },
    modelname = 's_m_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },

  ['guardia4'] = {
    location = { x = -1075.92, y = -809.55, z = 4.49, heading = 171.97 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },

  ----------------------- Sala de fotografias -------------------------------
  
  ['guardia5'] = {
    location = { x = -1089.21, y = -810.33, z = 4.95, heading = 216.6 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --- sentado en silla
  },

  ----------------------- Celdas de prision ---------------------------------

  ['guardia6'] = {
    location = { x = -1096.37, y = -817.22, z = 4.49, heading = 216.18 },
    modelname = 's_m_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },

  ------------------------ Entrada 1 (Montando guardia) ----------------------

  ['guardia7'] = {
    location = { x = -1063.8, y = -831.13, z = 18.36, heading = 352.93 },
    modelname = 's_m_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },

  ----------------------- Recepcion -----------------------------------------

  ['guardia8'] = {
    location = { x = -1097.47, y = -817.77, z = 18.52, heading = 308.49 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' ---------- Sentado en silla
  },

  ------------------------ Entrada 2 Exterior (montando guardia) -------------------

  ['guardia9'] = {
    location = { x = -1089.88, y = -807.41, z = 18.26, heading = 57.61 },
    modelname = 's_m_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a'
  },

  ----------------------- Hall -----------------------------------------------------

  ['guardia10'] = {
    location = { x = -1085.11, y = -807.19, z = 18.05, heading = 248.28 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ['guardia11'] = {
    location = { x = -1084.41, y = -808.53, z = 18.05, heading = 357.27 },
    modelname = 's_f_y_cop_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ---------------------- Autoescuela ------------------------

  ['school1'] = {
    location = { x = -915.95, y = -2039.47, z = 9.4, heading = 269.44 },
    modelname = 'u_m_m_bankman',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Fumando
  },

  ['school2'] = {
    location = { x = -927.56,   y = -2035.27, z = 9.84, heading = 255.76 },
    modelname = 'u_m_m_bankman',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ['school3'] = {
    location = { x = -936.75, y = -2036.55, z = 12.83, heading = 303.9 },
    modelname = 'a_m_y_business_01',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ['school4'] = {
    location = { x = -909.93,   y = -2024.22, z = 12.83, heading = 40.71 },
    modelname = 'a_m_y_business_02',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ['school5'] = {
    location = { x = -924.92, y = -2024.8, z = 16.05, heading = 291.28 },
    modelname = 'a_m_y_business_03',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

  ['school6'] = {
    location = { x = -911.3,   y = -2024.08, z = 16.05, heading = 221.06 },
    modelname = 'a_f_y_business_04',
    static = true,
    animated = true,
    anim = 'amb@code_human_wander_idles_cop@male@idle_a' --------- Hablando con otros cop
  },

}