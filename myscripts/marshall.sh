#!/usr/bin/expect -f

set prompt "#"
# set address [lindex &argv 0]
set address "20:64:DE:ED:27:AC"

spawn bluetoothctl
expect -re $prompt
send "remove $address\r"
sleep 1
expect -re $prompt
send "scan on\r"
send_user "\nSleeping\r"
sleep 5
send_user "\nDone sleeping\r"
send "scan off\r"
expect "Controller"
send "trust $address\r"
sleep 2
send "connect $address\r"
sleep 5
send_user "\nShould be paired now.\r"
send "quit\r"
expect eof
