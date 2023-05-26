# Bell_API_management

1. Собираем Docker-образы из каталога "docker"
```
cd ./docker/gravitee-apim-management-webui
docker build -t bell/gravitee-apim-management-ui:3.19.7 .

cd ./docker/gravitee-apim-portal-webui
docker build -t bell/gravitee-apim-portal-ui:3.19.7 .

cd ./docker/gravitee-apim-management-api
docker build -t bell/gravitee-apim-management-api:3.19.7 .

cd ./docker/gravitee-apim-gateway
docker build -t bell/gravitee-apim-gateway:3.19.7 .
```

2. Создаем каталоги, в которые будут монтироваться данные из контейнеров
```
cd ./docker-compose
# Запускаем скрипт
./create_directories.sh
```

3. Запускаем докер-контейнеры
```
cd ./docker-compose
docker-compose up -d -f docker-compose-bell.yaml
```
