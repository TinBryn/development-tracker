import os, strutils, asynchttpserver, asyncdispatch, routes/routes

const
  portEnv = "PORT"
  defaultPort = 8000
  router: Router = makeRouter()

let port =
  if existsEnv(portEnv):
    getEnv(portEnv).parseInt()
  else:
    echo "can't find $PORT"
    defaultPort

proc cb(req: Request){.async.} =
  let handle = router.findHandle($req.url.path)
  await handle(req)

let server = newAsyncHttpServer()

waitFor server.serve(Port(port), cb, "")
