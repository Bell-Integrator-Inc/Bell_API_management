# Хранение БД PostgreSQL
mkdir ~/gravitee/postgresql-apim
mkdir ~/gravitee/postgresql-apim/data

# Хранение БД Elasticsearch
mkdir ~/gravitee/elasticsearch
mkdir ~/gravitee/elasticsearch/data

# Хранение БД Redis
mkdir ~/gravitee/redis

# Хранение данных компонента API Gateway
mkdir ~/gravitee/apim-gateway
mkdir ~/gravitee/apim-gateway/plugins
mkdir ~/gravitee/apim-gateway/logs

# Хранение данных компонента Management API
mkdir ~/gravitee/apim-management-api
mkdir ~/gravitee/apim-management-api/plugins
mkdir ~/gravitee/apim-management-api/logs

# Хранение данных компонента Management UI
mkdir ~/gravitee/apim-management-ui
mkdir ~/gravitee/apim-management-ui/logs

# Хранение данных компонента Portal UI
mkdir ~/gravitee/apim-portal-ui
mkdir ~/gravitee/apim-portal-ui/logs


# Запустить приложение в Docker
sudo docker-compose -f docker-compose.yaml up -d

# Остановить приложение в Docker
sudo docker-compose -f docker-compose.yaml down

# Просмотр логов запуска приложения
sudo docker-compose logs

# Список запущенных компонентов
sudo docker ps -a

# Просмотр логов конкретного компонента
sudo docker logs gravitee-apim-gateway -f


