import htmlgen, os, strutils, asynchttpserver, asyncdispatch

const
  portEnv = "PORT"
  defaultPort = $8080
  port = parseInt(getEnv(portEnv, defaultPort))

proc cb(req: Request) {.async.} =
  case req.url.path:
  of "/":
    await req.respond(Http200, h1("No Framework"))
  else:
    await req.respond(Http404, "Not found")

var server = newAsyncHttpServer()

waitFor server.serve(Port(port), cb, "")
