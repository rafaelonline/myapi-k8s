# Aplicação CRUD com Node.js + MySQL + Kubernets

## Sobre :star:

Utilizando Node.js foi construido uma API REST simples para realizar o CRUD de produtos armazenados em um banco de dados MySQL.

## Recursos Utilizados :page_facing_up:

* Node.js [lts-alpine3.12](https://hub.docker.com/_/node)
* MySQL [v5.7.33](https://hub.docker.com/_/mysql)
* Minikube [v1.18.1](https://minikube.sigs.k8s.io/docs/start/)

## Requisitos :mag_right:

* minikube instalado e em execução.
* metrics-server do minikube habilitado (necessário para o HPA).
```sh
$ minikube addons enable metrics-server
```
* Conhecer o IP externo do NODE, fornecido pelo minikube.
* Software para realizar o CRUD. Por exemplo [Postman](https://www.getpostman.com/)

## Subindo o ambiente :rocket:

1 - Primeiro devemos subir o banco de dados, execute:
```bash
$ kubectl apply -f ./k8s/database 
```
A aplicação testa a conectividade com o banco antes de subir, caso não seja possível a comunicação a aplicação não sobe.

2 - Valide se o pod do banco de dados subiu com sucesso.
```bash
$ kubectl get pods
```
3 - Agora podemos subir nossa aplicação, execute:
```bash
$ kubectl apply -f ./k8s/api 
```
4 - Valide se o pod da aplicação subiu com sucesso.
```bash
$ kubectl get pods
```
## Executando o CRUD :computer:

Abra o Postman (ou outro recurso) para realizar as ações:

| Método | Verbo HTTP | Endpoint |
|---|---|---|
| Criando um novo Produto | POST | `http://{IP_EXTERNO_NODE}:30001/api/products` |
| Listando todos os Produtos | GET | `http://{IP_EXTERNO_NODE}:30001/api/products` |
| Buscando Produto pelo product_id | GET | `http://{IP_EXTERNO_NODE}:30001/api/products/{id}`|
| Atualizando Produto pelo product_id | PUT | `http://{IP_EXTERNO_NODE}:30001/api/products/{id}`|
| Delanto Produto pelo product_id | DELETE | `http://{IP_EXTERNO_NODE}:30001/api/products/{id}`|

## Executando o teste de Stress :fire:

Acesse o diretório "stress-test", localizado na raiz do repositório;
Altere nas variáveis o IP e porta de acesso a API;
Execute:
```bash
$ ./stress.sh
```
Para visualizar quantas réplicas estão em execução:
```bash
$ kubectl get hpa --watch
```

## Observação e informações relevantes :exclamation:

* O arquivo .env foi comitado propositadamente a fim de facilitar a execução do ambiente.
* Ambiente criado para estudos, de forma alguma utilize algo daqui em produção sem uma validação de segurança e boas práticas.
