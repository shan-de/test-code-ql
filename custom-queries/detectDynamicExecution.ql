import javascript

/**
 * @id detect_dynamic_execution
 * @name Detect Dynamic Code Execution
 * @description Flags the use of eval, Function, or similar constructs, which may indicate obfuscated or malicious code.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
predicate isDynamicExecution(CallExpr call) {
  call.getCallee().(Function).getName() = "eval" or
  call.getCallee().(Function).getName() = "Function"
}

from CallExpr call
where isDynamicExecution(call)
select call, "Dynamic code execution detected. This may indicate obfuscated or malicious code."