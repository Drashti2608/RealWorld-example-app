#!/bin/bash
          cd /home/ec2-user
          sudo yum install git nodejs iptables -y
          git clone https://github.com/RHSaliya/conduit-realworld-example-app.git
          cd conduit-realworld-example-app
          sudo echo "## Environment Variables
          PORT=3001
          JWT_KEY=supersecretkey_example

          ## Development Database
          DEV_DB_USERNAME=rahul
          DEV_DB_PASSWORD=rahul123
          DEV_DB_NAME=database_development
          DEV_DB_HOSTNAME=${MyPostgreDatabase.Endpoint.Address}
          DEV_DB_DIALECT=postgres
          DEV_DB_LOGGGIN=true" > ./frontend/.env
          sudo npm i
          sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 3000
          sudo npm run dev