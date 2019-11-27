import asynchttpserver, asyncdispatch, router
from ../views/index import nil

export Router, findHandle

proc notfound(req: Request){.async.} =
  await req.respond(Http404, "Not found")

proc home(req: Request){.async.} =
  await index.index(req)

proc hello(req: Request){.async.} =
  await req.respond(Http200, "<H3>Hello</H3>")

const routes = {
  "/": home,
  "/hello": hello
}

proc makeRouter*(): Router =
  result = initRouter(notfound)
  for i in routes:
    result.addHandle(i[0], i[1])
  