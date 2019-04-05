from aiohttp import web

async def get_rabbit(request):
    with open('install_rabbit.sh') as f:
        body = f.read()
    return web.Response(body=body, status=200)

async def get_mongo(request):
    with open('install_mongo.sh') as f:
        body = f.read()
    return web.Response(body=body, status=200)