service ssh start
cd flags_shop
nohup python3 app.py &
cd ..
tail -f /dev/null
