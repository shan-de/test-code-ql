import javascript

/**
 * @name Detect Long Strings
 * @description Flags long strings in JavaScript files.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
from Literal stringLiteral
where stringLiteral.getStringValue().length() > 100
select stringLiteral, "This string is unusually long."