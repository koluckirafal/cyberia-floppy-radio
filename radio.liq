#!/usr/bin/liquidsoap -v

# LOGGING #
set("log.stdout", true)
set("log.file", false)

# ENABLE, IF USING IRC BOT FOR REQUESTING SONGS FOR AUTOPILOT #
#set("server.telnet", true)

r_name="Cyberia Floppy Radio"
r_url="http://zlomformatyk.junkcc.net/cyberiafloppyradio/"
r_useragent="Tachibana Streaming Server/1.9.9.8 (Copland OS Enterprise)"
r_slogan="Cyberia Café & Club, Shibuya, Tokyo"
%include "config.liq"

%include "dec_xmp.liq"

# INPUT #
#emergency = input.harbor("emergency", password=r_passwd_emergency, port=r_inputport)
#live = input.harbor("/", password=r_passwd, port=r_inputport, icy=true)
#autopilot = request.equeue(id="q") # TODO: request queue
autopilot = playlist("./playlist.m3u", reload_mode="watch")
failover = single("./lain_viva.mod")

# PIPELINE #
radio = fallback(track_sensitive=false, [autopilot, failover])

# OUTPUT #
output.icecast(
  %vorbis(quality=0.5, samplerate=48000), 
  host=r_host, port=r_outputport, password=r_passwd, 
  headers=[("User-Agent",r_useragent)], 
  name=r_name, url=r_url, description=r_slogan, 
  mount="stream.ogg", icy_metadata="true", radio)
output.icecast(
  %mp3(bitrate=160, samplerate=48000), 
  host=r_host, port=r_outputport, password=r_passwd, 
  headers=[("User-Agent",r_useragent)], 
  name=r_name, url=r_url, description=r_slogan, 
  mount="stream.mp3", icy_metadata="true", radio)
#output.icecast(
#  %opus(bitrate="auto", samplerate=48000, signal="music"), 
#  host=r_host, port=r_outputport, password=r_passwd, 
#  headers=[("User-Agent", r_useragent)], 
#  name=r_name, url=r_url, description=r_slogan, 
#  mount="stream.opus", icy_metadata="true", radio)
