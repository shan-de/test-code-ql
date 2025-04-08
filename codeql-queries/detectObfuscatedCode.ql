import javascript

/**
 * @name Detect Obfuscated Code
 * @description Flags JavaScript files with long lines of code, which may indicate obfuscation or minification.
 * @kind problem
 * @problem.severity warning
 * @tags security
 */
from SourceFile file, string line
where
  file.getText().split("\n", line) and
  line.length() > 500 // Adjust the threshold for "long lines"
select file, "This file contains a line of code longer than 500 characters, which may indicate obfuscation or minification."