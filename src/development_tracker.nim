import jester, htmlgen, macros

expandMacros:
  routes:
    get "/":
      resp h1("Development Tracker")
    get "/@name":
      resp h1("Development Tracker for - " & @"name")
