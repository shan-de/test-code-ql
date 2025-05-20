import javascript

/**
 * @id insecure_http_request
 * @name Insecure HTTP Request
 * @description Finds instances of HTTP requests that do not use HTTPS.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
predicate insecureHttpRequest(CallExpr call) {
  call.getCallee().(Function).getName() = "http" or
  call.getCallee().(Function).getName() = "request"
}

from CallExpr call
where insecureHttpRequest(call)
select call, "Insecure HTTP request detected."