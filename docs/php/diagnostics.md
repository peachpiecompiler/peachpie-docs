# Diagnostics reference

The compiler performs several passes of code analysis during the build process. In result it may endup in a list of diagnostics each corresponding to a location in the source code. Following list describes the error codes and possible solutions on how to fix them.

!!! tip
    The warning diagnostics can be turned off by setting a build property. See [NoWarn Property](msbuild#nowarn) for more information.

## Errors

Code | Description | Reason
---- | ----------- | ------
PHP1015 | Abstract private method declared | Abstract method was declared as private. Such declaration is not allowed since it couldn't be implemented.
PHP1037 | Abstract final method declared | Abstract method was declared as final. Such declaration is not allowed since it couldn't be implemented.
PHP4041 | Too many user strings | .NET assembly limits how much text can be contained. This error might happen when compiling a large PHP project; split the project to work around this issue.
PHP4042 | Not yet implemented | The feature is not yet supported by PeachPie.
PHP4043 | Circular base class dependency | The class or interface inherits itself.
PHP4044 | Type name cannot be resolved | The base type of a class or an interface needs to be known in compile time. Otherwise the module cannot be compiled.
PHP4046 | Call to a member function on a non-object | The expression before `->` operator results in a non-object value. Such a call is not allowed.
PHP4052 | Method __toString() must return a string value | Value returned from __tostring() method is not a string value. This would result in a fatal error in run time.

## Warnings

Code | Description | Reason
---- | ----------- | ------
PHP0125 | Mandatory parameter behind optional | A default value of the optional parameter will never be used because a mandatory parameter follows.
PHP0171 | Magic method must be public and non-static | Non-public or static modifiers are not allowed for the specified method.
PHP5006 | Undefined function | There is no such function declaration in the project or in referenced libraries.
PHP5008 | Undefined type | There is no such class declaration in the project or in referenced libraries.
PHP5010 | Eval discouraged | Use of `eval()` is not recommended; it allows for suspicious and dangerous code injections and causes significant overhead to the .NET runtime.
PHP5011 | Ambiguous declaration | The base of the type declaration is ambiguous; this results in multiple definitions to be emitted, significant run time overhead and unnecessarily bigger resulting assembly file.
PHP5012 | Unreachable code | The code is unreachable. This is based on code analysis and dead code elimination analysis.
PHP5017 | Assert always fails | The condition of assertion is evaluated to be always `false` hence the `assert` will always fail.
PHP5019 | The function has been deprecated | Calling a function that has been marked as deprecated; either it is annotated with a .NET `[ObsoleteAttribute]` metadata or is it a known deprecation by the compiler.
PHP5021 | Assignment made to same variable | The expression does not have any effect, it is usually a typo in source code.

## Informational

Code | Description | Reason
---- | ----------- | ------