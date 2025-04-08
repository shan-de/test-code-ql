import javascript

/**
 * @name Detect Suspicious Variable Names
 * @description Flags excessive use of single-character variable names, which may indicate obfuscated code.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
from Variable v
where
  v.getName().regexpMatch("^[a-zA-Z]$") // Single-character variable names
select v, "Suspicious single-character variable name detected."