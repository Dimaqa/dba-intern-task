from aiohttp import web
from views import get_mongo, get_rabbit

def setup_routes(app):
    app.router.add_get('/api/v1/get_rabbit', get_rabbit)
    app.router.add_get('/api/v1/get_mongo', get_mongo)

app = web.Application()
setup_routes(app)
web.run_app(app)