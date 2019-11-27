import tables, asynchttpserver, asyncdispatch

type
  Handle = proc(req: Request): Future[void]{.gcsafe.}
  RouterObj = object
    routes: Table[string, Handle]
    notFound: Handle
  
  Router* = ref RouterObj

proc initRouter*(notFound: Handle): owned Router =
  result = Router(
    routes: initTable[string, Handle](),
    notFound: notFound)

proc findHandle*(router: Router, path: string): Handle =
  router.routes.getOrDefault(path, router.notFound)

proc addHandle*(router: var Router, path: string, handle: Handle) =
  router.routes[path] = handle
