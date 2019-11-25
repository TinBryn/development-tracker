import tables, asynchttpserver, asyncdispatch

type
  Handle = proc(req: Request): Future[void]
  Router* = object
    routes: Table[string, Handle]
    notFound: Handle

proc initRouter*(notFound: Handle): Router =
  result = Router(
    routes: initTable[string, Handle](),
    notFound: notFound)

proc findHandle*(router: Router, path: string): Handle =
  router.routes.getOrDefault(path, router.notFound)

proc addHandle*(router: var Router, path: string, handle: Handle) =
  router.routes[path] = handle
