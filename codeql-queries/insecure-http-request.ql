import javascript

from CallExpr call
where
  call.getCallee().(Function).getName() = "http" or
  call.getCallee().(Function).getName() = "request"
select call, "Insecure HTTP request detected."