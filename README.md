# Docker Environment for ARM Assembly Development

Docker Container to cross compile your arm code, debug and test it using C via ssh server.
_I assume you already have openssh installed in your system and Docker_

## Step by step installation

1. **Clone the repo and cd into it**:

   ```bash
   git clone https://github.com/gabsalvo/Arm-Cross-Compiler-Docker.git
   cd Arm-Cross-Compiler-Docker
   ```

2. **Create rsa key to log via ssh**

   ```bash
   ssh-keygen -t rsa -m PEM -f id_rsa
   ```

   _You can choose a passphrase or leave it blank with no password_

3. **Build Docker Image for your compiler**

   ```bash
   sudo docker build -t remote_server .
   ```

4. **Launch the container**

   ```bash
   sudo docker run -d --name remote_server -it -p XXXXX:22 remote_server
   ```

   _You can forward whatever port you want. Example XXXXX = 58897_

5. **Connect to the Docker Image**

   ```bash
   ssh remote_user@localhost -p XXXXX
   ```

   _Type yes_

   **OR you can connect via:**

   ```bash
   ssh -i id_rsa remote_user@localhost -p XXXXX
   ```

6. **Ready to use your Cross Compiler**

   To explore the main functionality of the container you can use:

   ```bash
   cat legend.txt
   ```

7. **Exit**

   To exit the container and stop it run:

   _Docker Console_

   ```bash
   exit
   ```

   _Personal Terminal_

   ```bash
   sudo docker ps
   sudo docker stop <container_id_or_name>
   ```

8. **Riavvia container**

   ```bash
   sudo docker start remote_server
   ```

   you can now connet again like in step 5
