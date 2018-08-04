# Diagnostics reference

The compiler performs several passes of code analysis during the build process. In result it may endup in a list of diagnostics each corresponding to a location in the source code. Following list describes the error codes and possible solutions on how to fix them.

!!! tip
    The warning diagnostics can be turned off by setting a build property. See [NoWarn Property](msbuild#nowarn) for more information.

## Errors

Code | Description | Reason
---- | ----------- | ------
PHP2041 | Too many user strings | .NET assembly limits how much text can be contained. This error might happen when compiling a large PHP project; split the project to work around this issue.
PHP2042 | Not yet implemented | The feature is not yet supported by PeachPie.
PHP2043 | Circular base class dependency | The class or interface inherits itself.
PHP2044 | Type name cannot be resolved | The base type of a class or an interface needs to be known in compile time. Otherwise the module cannot be compiled.
PHP2046 | Call to a member function on a non-object | The expression before `->` operator results in a non-object value. Such a call is not allowed.
PHP2052 | Method __toString() must return a string value | Value returned from __tostring() method is not a string value. This would result in a fatal error in run time.

## Warnings

Code | Description | Reason
---- | ----------- | ------
PHP3006 | Undefined function | There is no such function declaration in the project or in referenced libraries.
PHP3008 | Undefined type | There is no such class declaration in the project or in referenced libraries.
PHP3010 | Eval discouraged | Use of `eval()` is not recommended; it allows for suspicious and dangerous code injections and causes significant overhead to the .NET runtime.
PHP3011 | Ambiguous declaration | The base of the type declaration is ambiguous; this results in multiple definitions to be emitted, significant run time overhead and unnecessarily bigger resulting assembly file.
PHP3012 | Unreachable code | The code is unreachable. This is based on code analysis and dead code elimination analysis.
PHP3017 | Assert always fails | The condition of assertion is evaluated to be always `false` hence the `assert` will always fail.
PHP3021 | Assignment made to same variable | The expression does not have any effect, it is usually a typo in source code.
PHPX0125 | Mandatory parameter behind optional | A default value of the optional parameter will never be used because a mandatory parameter follows.

## Informational

Code | Description | Reason
---- | ----------- | ------