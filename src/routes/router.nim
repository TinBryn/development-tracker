import tables, asynchttpserver, asyncdispatch

type
  Router* = object
    routes: Table[string, proc(req: Request): Future[void]]
