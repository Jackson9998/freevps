sudo apt install openssh-server
cd /etc/ssh
rm -r sshd_config
wget https://github.com/Jackson9998/freevps/raw/main/sshd_config
echo 'root:040112' | sudo chpasswd
sudo useradd -m -p $(openssl passwd -1 040112) humberto
wget https://github.com/Jackson9998/freevps/raw/main/loop.sh
chmod 777 loop.sh
service ssh restart
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
ngrok config add-authtoken 25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M
screen -dmS Ngrok_Tecnic ngrok tcp 22
./loop.sh
