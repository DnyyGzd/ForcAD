service ssh start
nohup python3 flags_shop/app.py &
tail -f /dev/null
