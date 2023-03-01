############################load average calculation with time ###########################

#This script calculates the ratio between the load avergae every 1 minutes with the preceeding minute avaerafe  and if the ratio is increasing it sends warning to logs



now=$(tail -n 1 /load.txt)
last=$(tail -n 2 /load.txt | sed -n "1p")





var1=$(echo ${now} | cut -f 1 -d,)

var2=$(echo ${last} | cut -f 1 -d,)



if (( $(echo "$var1 > $var2" | bc -l) ))
        then
        echo "increasing" >> /test.txt
        echo "for $(date) the load is ${var1}" >> /var/log/systemLoad
        echo "Subject: Server $(ip a | grep "enp0s3$" | cut -f 6 -d' ') load
                Body:
                        Dear,
                                The system $(hostname) runs with IP $(ip a | grep "enp0s3$" | cut -f 6 -d' ') has a load of
                                1MIN load: $(echo ${now} | cut -f 1 -d,)
                                5MIN load: $(echo ${now} | cut -f 2 -d,)
                                15MIN load:$(echo ${now} | cut -f 3 -d,)
                        Thank you . " >> /tmp/events
        fi
