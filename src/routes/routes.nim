import asynchttpserver, asyncdispatch, router
from ../views/index import nil

export Router, findHandle

proc notfound(req: Request){.gcsafe, async.} =
  await req.respond(Http404, "Not found")

proc home(req: Request){.gcsafe, async.} =
  await index.index(req)

const routes = {"/": home}

proc makeRouter*(): Router =
  result = initRouter(notfound)
  for i in routes:
    result.addHandle(i[0], i[1])
  