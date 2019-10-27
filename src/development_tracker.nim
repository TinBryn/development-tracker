import asynchttpserver, asyncdispatch, strutils, os, htmlgen

const
  portEnv = "PORT"
  defaultPort = $8080
  port = parseInt(getEnv(portEnv, defaultPort))

var server = newAsyncHttpServer()

proc cb(req: Request) {.async.} =
  await req.respond(Http200, h1("Development Tracker"))

echo "http://localhost:" & $port

waitFor server.serve(Port(port), cb)
