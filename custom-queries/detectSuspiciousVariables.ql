import javascript

/**
 * @id detect_suspicious_variables
 * @name Detect Suspicious Variable Names
 * @description Flags excessive use of single-character variable names, which may indicate obfuscated code.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
predicate isSuspiciousVariable(Variable v) {
  v.getName().regexpMatch("^[a-zA-Z]$") // Single-character variable names
}

from Variable v
where isSuspiciousVariable(v)
select v, "Suspicious single-character variable name detected."