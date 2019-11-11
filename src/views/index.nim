import asynchttpserver, asyncdispatch, ../templates/index

proc index*(req: Request) {.async.} =
  await req.respond(Http200, index_temp)
