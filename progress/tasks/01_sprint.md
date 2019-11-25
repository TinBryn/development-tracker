1. Routing
   I have a router that is functional, but it currently has a flat structure
   there is no tree, it's also calculated entirely staticly, and that may need
   to be the case in order to make it GC safe with the current design.

   likely the most important is to make it GC safe at run time, so make it a
   `ref` type?