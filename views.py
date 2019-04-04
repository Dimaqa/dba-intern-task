from aiohttp import web

async def get_rabbit(request):
    return web.Response(text='true',status=200)

async def get_mongo(request):
    return web.Response(text='true', status=200)