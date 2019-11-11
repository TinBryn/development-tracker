import os, strutils, asynchttpserver, asyncdispatch, views/index

const
  portEnv = "PORT"
  defaultPort = 8000

let port =
  if existsEnv(portEnv):
    getEnv(portEnv).parseInt()
  else:
    echo "can't find $PORT"
    defaultPort

proc cb(req: Request) {.async.} =
  if req.reqMethod == HttpGet:
    echo "path: ", req.url.path
    case req.url.path:
    of "/":
      await index(req)
    else:
      await req.respond(Http404, "Not found")

var server = newAsyncHttpServer()

waitFor server.serve(Port(port), cb, "")
