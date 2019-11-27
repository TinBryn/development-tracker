1. Routing
   I have a router that is functional, but it currently has a flat structure
   there is no tree, it's also calculated entirely staticly, and that may need
   to be the case in order to make it GC safe with the current design.

   likely the most important is to make it GC safe at run time, so make it a
   `ref` type?
  
2. Handlers
   This is kinda already done, currently they are implemented as an alias of
   `proc(req: Request): Future[void]`. I'd prefer if I could remove the Future
   from the signature, I need to learn how to use them with async requests.

3. HTML gen
   I want the next sprint to be front end based so I'm going to push this back
   until then, when I have some HTML I can look into how I want to generate so
   that I can easily make sitewide changes.

4. Middleware considerations
   I should be able to put some middleware handling in the Servy callback field.