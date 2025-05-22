import javascript

/**
 * @id insecure_http_request
 * @name Insecure HTTP Request Detection
 * @description Detects insecure HTTP requests (http instead of https)
 * @kind problem
 * @problem.severity warning
 * @tags security
 */

select * from CallExpression call
where call.getCallee().getName() = "http" and
      call.getArgument(0).getValue().regexpMatch("^http://.*")