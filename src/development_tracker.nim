import htmlgen, os, strutils, asynchttpserver, asyncdispatch

const
  portEnv = "PORT"

var port: int
if existsEnv(portEnv):
  port = getEnv(portEnv).parseInt()
else:
  quit("can't find $" & portEnv)

proc cb(req: Request) {.async.} =
  case req.url.path:
  of "/":
    await req.respond(Http200, h1("No Framework"))
  else:
    await req.respond(Http404, "Not found")

var server = newAsyncHttpServer()

waitFor server.serve(Port(port), cb, "")
