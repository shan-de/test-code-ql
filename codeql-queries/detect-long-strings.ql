import javascript

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