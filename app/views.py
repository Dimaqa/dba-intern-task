from aiohttp import web
from pymongo import MongoClient

MONGO_PORT = 27017

async def get_rabbit(request):
    with open('install_rabbit.sh') as f:
        body = f.read()
    return web.Response(body=body, status=200)

async def get_mongo(request):
    data = request.rel_url.query
    replica = data.get('replication')
    with open('mongodb.pp') as f:
        body = f.read()
    if replica.lower() == 'true':
        with open('replica.pp') as f:
            body += f.read()
    return web.Response(body=body, status=200)

async def test_mongo(request):
    try:
        data = request.rel_url.query
        host = data['host']
    except:
        body = 'BAD PARAMS'
        code = 400
    else:
        code=200
        port = data.get('port')
        # if port isnt specified, using default one
        port = int(port) if port else MONGO_PORT
        client = MongoClient(host=host,port=port)
        try:
            # and here aiohttp pretty useless,
            # cuz we cant handle 2 test requests at a same time
            client.server_info()
        except Exception as e:
            body='false, error: %s' % type(e).__name__
        else:
            body='true'
    return web.Response(body=body,status=code)