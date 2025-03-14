#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' 

echo "Testing Frontend..."
if curl -s --head http://localhost:3000 | grep "200 OK" > /dev/null; then
   echo -e "${GREEN}Frontend is working!${NC}"
else
   echo -e "${RED}Frontend test failed.${NC}"
fi

echo "Testing Backend..."
if curl -s --head http://localhost:5000 | grep "200 OK" > /dev/null; then
   echo -e "${GREEN}Backend is working!${NC}"
else
   echo -e "${RED}Backend test failed.${NC}"
fi

echo "Testing Database Connection..."
if docker exec fullstack-todo-list-mongo-1 mongosh --eval "db.adminCommand('ping')" | grep "ok" > /dev/null; then
   echo -e "${GREEN}MongoDB is running!${NC}"
else
   echo -e "${RED}MongoDB test failed.${NC}"
fi


