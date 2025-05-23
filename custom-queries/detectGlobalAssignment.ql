

/**
 * @id detect_global_assignment
 * @name Detect Global Assignments
 * @description Flags assignments to the global object, which may be used in obfuscated or malicious code.
 * @kind problem
 * @problem.severity warning
 * @tags security, obfuscation
 */
import javascript
from Assignment assign
where assign.getLhs().toString().regexpMatch("^global\\[")
select assign, "Assignment to global object detected."