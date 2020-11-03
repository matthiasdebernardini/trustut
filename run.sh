#!/bin/sh
cargo b --release
doas setcap cap_net_admin=eip /home/m/gits/trustut/target/release/trustut
/home/m/gits/trustut/target/release/trustut &
pid=$!
doas ip addr add 192.168.0.1/24 dev tun0
doas ip link set up dev tun0
wait $pid

