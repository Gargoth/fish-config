function cleargaflog
    yes y | fli remote execute "sudo truncate -s 0 /mnt/logs/gaf.json; sudo truncate -s 0 /mnt/logs/gaf.json.1"
end
