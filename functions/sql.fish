function sql
    ssh -i ~/.ssh/id_ed25519 -Nf dev@crosales.syd1.fln-dev.net -L 3306:db-master.syd1.fln-dev.net:3306 sleep 5
    mycli -h localhost -u dev -p '!2#4QwErfr33lancer' gaf
    pkill -n -x 'ssh'
end
