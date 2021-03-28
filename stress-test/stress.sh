#!/bin/bash

#Informe o IP externo do MiniKube e porta utilizada para acessar a API
IP=
PORTA=30001

for i in {1..1000}; do
  curl http://$IP:$PORTA/api/products/ 
  sleep 0.1
done