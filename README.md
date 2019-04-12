# Intern task

Сервер на python3, возвращающий в body sh скрипт для установки RabbitMQ
и puppet manifest для установки MongoDB.
Также может выполнять тестирование MongoDb сервера.
Работает по следующему API:

```bash
GET /api/v1/get_rabbit
GET /api/v1/get_mongo?replication={true,false}
GET /api/v1/test_mongo?host=arg1&port=arg2
```