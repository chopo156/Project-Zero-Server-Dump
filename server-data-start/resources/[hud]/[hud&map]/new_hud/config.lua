Config = {}

Config.Locale = 'es'

Config.serverLogo = 'https://i.imgur.com/PssKx1b.png'

Config.font = {
	name 	= 'Montserrat',
	url 	= 'https://fonts.googleapis.com/css?family=Montserrat:300,400,700,900&display=swap'
}

Config.date = {
	format	 	= 'default',
	AmPm		= false
}

Config.voice = {

	levels = {
		default = 8.0,
		shout = 12.0,
		whisper = 1.0,
		current = 0
	},
	
	keys = {
		distance 	= {'Z'},
	}
}


Config.vehicle = {
	speedUnit = 'KMH',
	maxSpeed = 300,

	keys = {
		seatbelt 	= 'B',
		cruiser		= 'Y',
		signalLeft	= 'LEFT',
		signalRight	= 'RIGHT',
		signalBoth	= 'DOWN',
	}
}

Config.ui = {
	showServerLogo		= true,

	showJob		 		= true,
	showJobgrade 		= true,


	showWalletMoney 	= true,
	showBankMoney 		= true,
	showBlackMoney 		= true,
	showSocietyMoney	= true,

	showDate 			= false,
	showLocation 		= true,
	showVoice	 		= true,

	showHealth			= true,
	showArmor	 		= true,
	showStamina	 		= true,
	showHunger 			= true,
	showThirst	 		= true,

	showMinimap			= false,

	showWeapons			= true,	
}