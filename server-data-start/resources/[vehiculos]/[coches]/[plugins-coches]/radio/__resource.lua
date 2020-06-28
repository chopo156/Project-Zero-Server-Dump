resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

-- Example custom radios
supersede_radio "RADIO_02_POP" { url = "http://stream.radioreklama.bg/nrj_low.ogg", volume = 0.2, name = "[POP&ROCK FM]" }
supersede_radio "RADIO_03_HIPHOP_NEW" { url = "http://stream.radioreklama.bg/nrj.ogg", volume = 0.2, name = "[test2]" }
supersede_radio "RADIO_01_CLASS_ROCK" { url = "https://revolutionradio.ru:8443/live.ogg ", volume = 0.2, name = "[ROCK'80 FM]" }
supersede_radio "RADIO_05_TALK_01" { url = "http://media-ice.musicradio.com/ClassicFM", volume = 0.2, name = "[CLASSICA FM]" }
supersede_radio "RADIO_04_PUNK" { url = "http://stream.radioreklama.bg/radio1rock.ogg", volume = 0.2, name = "[METAL FM]" }

files {
	"index.html"
}

ui_page "index.html"

client_scripts {
	"data.js",
	"client.js"
}


