from aiohttp import web

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
        data = 'BAD PARAMS'
        code = 400
    else:
        data = host
    return web.Response(body=data,status=code)