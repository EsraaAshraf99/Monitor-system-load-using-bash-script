# Monitor-system-load-using-bash-script


This shell script :
	Monitor every 1 min the system load.
	if the load increases , it adds the load , and date to a log file /var/log/systemLoad 
	and also writes event to an event file /tmp/events
		Subject: Server <IP> load
		Body:
			Dear, 
				The system (hostname) runs with IP (IP) has a load of 
				1MIN load: <value>
				5MIN load: <value>
				15MIN load: <value>
			Thank you .
