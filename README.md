# Bell_API_management

## 1. Собираем Docker-образы из каталога "docker"
```
# Console UI Image
cd ./docker/gravitee-apim-management-webui
docker build -t bell/gravitee-apim-management-ui:3.19.7 .

# Portal UI Image
cd ./docker/gravitee-apim-portal-webui
docker build -t bell/gravitee-apim-portal-ui:3.19.7 .

# Management Api Image
cd ./docker/gravitee-apim-management-api
docker build -t bell/gravitee-apim-management-api:3.19.7 .

# Gateway Image
cd ./docker/gravitee-apim-gateway
docker build -t bell/gravitee-apim-gateway:3.19.7 .
```

> [!NOTE]
> Для локальной разработки со свежим бекендом для Gateway и Management API: 
> 1. Берем архив билда c сервера 10.201.255.31 /opt/BUILD/artifacts
> 2. Распаковываем в папку docker/gravitee-apim-{`gateway` или `management-api`}/local/distribution/gravitee-apim-{`gateway` или `rest-api`}
> 3. Собирем по инструкции выше из каталога local добавляя тег для image


## 2. Создаем каталоги, в которые будут монтироваться данные из контейнеров
```
# Создаем папку gravitee вручную в /Users/{USER_NAME}/gravitee
# Либо скриптом
cd ./docker-compose
# Запускаем скрипт
./create_directories.sh
```

## 3. Запускаем докер-контейнеры
```
// Для linux
cd ./docker-compose
docker-compose up -d -f docker-compose-bell.yaml

// Для windows
cd ./docker-compose
вносим правки в файл docker-compose-bell-win.yaml, меняем абсолютные пути к каталогам, все места где /Users/Roman - меняем на /Users/{Свой пользователь win}
docker-compose -f docker-compose-bell-win.yaml up -d

# Заменить теги в docker-compose, если при сборке теги образов заменялись
```

> [!NOTE]
> Для разработки через стендовый keycloak необходимо в контейнер Management API установить keycloak сертификат:
> 1. Через докер декстоп копируем файл сертификата `keycloak.psb.ru.crt` в контейнер gravitee-apim-management-api
> 2. Подключаемся под root пользователем к докер контейнеру gravitee-apim-management-api: `docker exec -it --user=root gravitee-apim-management-api /bin/sh`
> 3. Найти путь к java c помощью команды `which java`
> 4. Добавляем сертификат в keystore(пароль `changeit`): 
`keytool -import -alias keycloak -file ${path_to_file} -keystore /opt/java/openjdk/lib/security/cacerts`(поменять нас свой путь к cacerts)
> 5. В гравити настроить IDP на стендовый keycloak 
