import javascript

/**
 * @id insecure_http_request
 * @name Insecure HTTP Request Detection
 * @description Detects insecure HTTP requests (http instead of https)
 * @kind problem
 * @problem.severity warning
 * @tags security
 */

from MethodCallExpr call, StringLiteral url
where
  (call.getMethodName() = "get" or call.getMethodName() = "request") and
  url = call.getArgument(0) and
  url.getValue().indexOf("http://") = 0
select call, "Insecure HTTP request detected."