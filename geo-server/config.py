# Copyright (c) 2021 aasaam software development group
from mapproxy.wsgiapp import make_wsgi_app
application = make_wsgi_app(r'/geo-server/mapproxy.yaml')
