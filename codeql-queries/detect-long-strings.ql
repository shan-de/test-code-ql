import javascript

/**
 * @name Detect Suspicious Long Strings
 * @description Flags long strings in JavaScript files and checks for suspicious patterns, such as obfuscated or encoded content.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
from Literal stringLiteral
where 
  stringLiteral.getStringValue().length() > 100 and
  (
    // Check for base64-like patterns
    stringLiteral.getStringValue().regexpMatch("^[A-Za-z0-9+/=]{50,}$") or
    // Check for hex-like patterns
    stringLiteral.getStringValue().regexpMatch("^[0-9a-fA-F]{50,}$") or
    // Check for repeated characters (common in obfuscation)
    stringLiteral.getStringValue().regexpMatch("(.)\\1{10,}") or
    // Check for suspicious keywords (e.g., eval, Function, obfuscation markers)
    stringLiteral.getStringValue().regexpMatch("eval|Function|obfuscate|decode|escape")
  )
select stringLiteral, "This string is unusually long and contains patterns that may indicate obfuscated or unwanted code."