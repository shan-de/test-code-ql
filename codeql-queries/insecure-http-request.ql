import javascript

/**
 * @name Insecure HTTP Request
 * @description Finds instances of HTTP requests that do not use HTTPS.
 * @kind path-problem
 * @problem.severity warning
 * @tags security
 */
from CallExpr call
where
  call.getCallee().(Function).getName() = "http" or
  call.getCallee().(Function).getName() = "request"
select call, "Insecure HTTP request detected."