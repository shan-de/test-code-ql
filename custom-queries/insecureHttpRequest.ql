 /**
 * This is an automatically generated file
 * @name Insecure HTTP Request Detection
 * @kind problem
 * @problem.severity critical
 * @id jcustom-queries-insecure-http-request
 */

import javascript

from MethodCallExpr call, StringLiteral url
where
  (call.getMethodName() = "get" or call.getMethodName() = "request") and
  url = call.getArgument(0) and
  url.getValue().indexOf("http://") = 0
select call, "Insecure HTTP request detected."