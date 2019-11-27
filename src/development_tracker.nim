import os, strutils, asynchttpserver, asyncdispatch, routes/routes

const
  portEnv = "PORT"
  defaultPort = 8000

type Servy = ref object
  router: Router
  callback: proc(req: Request): Future[void] {.gcsafe.}

proc newServy(): Servy =
  new result
  let router = makeRouter()
  result.router = router
  result.callback = proc(req: Request) {.async.} =
    let handle = router.findHandle($req.url.path)
    await handle(req)

proc run(servy: Servy, port: Port){.noReturn.} =
  let server = newAsyncHttpServer()
  waitFor server.serve(port, servy.callback, "")

let port =
  if existsEnv(portEnv):
    getEnv(portEnv).parseInt()
  else:
    echo "can't find $PORT"
    defaultPort

let servy = newServy()

servy.run(Port(port))
