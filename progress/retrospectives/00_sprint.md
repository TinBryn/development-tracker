Sprint "0" retrospective
========================

Overview
--------
The main goal was to explore the basic required technology,
using Nim for web development is quite new and experimental.
I've also not used Heroku before this so working out how to
use that was required. Overall I have a full deployment
pipeline where any changes can be applied. This pipeline is
very simple and there is room to add more for testing purposes,
but that can come later when I have a better understanding of
what I need to test.

Goals for next sprint
---------------------
While the deployment process is functional, the development
process is not, I currently need to manually route the urls
to return the responses. I need to work on an abstraction
to handle each request. This abstraction will need room to
add some middleware, I'm not sure how to do that just yet so
what ever system I come up with is very likely to be replaced.

### Todo
1. Routing

      I'm planning on organising the url namespace in a tree
      so the router should be able to handle this tree.
2. Request Handlers

      These are going to be fairly simple, they start as simple
      procs that take a request and return a response.
3. HTML gen
4. Middleware (may not be implemented, but must be considered)

### Long term goals
1. Data storage
2. Auth
3. Pages to add this style of documentation
4. Setting up projects
5. Convienient navigation
6. Github integration?
