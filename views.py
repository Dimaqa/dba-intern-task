from aiohttp import web
from pymongo import MongoClient

MONGO_PORT = 27017

async def get_rabbit(request):
    with open('install_rabbit.sh') as f:
        body = f.read()
    return web.Response(body=body, status=200)

async def get_mongo(request):
    with open('install_mongo.sh') as f:
        body = f.read()
    return web.Response(body=body, status=200)

async def test_mongo(request):
    try:
        data = request.rel_url.query
        host = data['host']
        port = int(data.get('port')) if data.get('port') else MONGO_PORT
    except:
        body = 'BAD PARAMS'
        code = 400
    else:
        code=200
        client = MongoClient(host=host,port=port, username='root', password='secretpwd')
        try:
            client.server_info()
        except Exception as e:
            body='false, error: %s' % type(e).__name__
        else:
            body='true'
    return web.Response(body=body,status=code)