# Diagnostics reference

The compiler performs several passes of code analysis during the build process. As a result, it may end up with a list of diagnostics each corresponding to a location in the source code. The following list describes the error codes and possible solutions on how to fix them.

!!! tip
    The warning diagnostics can be turned off by setting a build property. See [NoWarn Property](msbuild#nowarn) for more information.

## Errors

Code | Description | Reason
---- | ----------- | ------
PHP1015 | Abstract private method declared | Abstract method was declared as `private`. Such a declaration is not allowed since it couldn't be implemented.
PHP1037 | Abstract final method declared | Abstract method was declared as `final`. Such a declaration is not allowed since it couldn't be implemented.
PHP4041 | Too many user strings | The .NET assembly limits how much text can be contained. This error might happen when compiling a large PHP project; split the project into parts to work around this issue.
PHP4042 | Not yet implemented | The feature is not yet supported by PeachPie.
PHP4043 | Circular base class dependency | The class or interface inherits itself.
PHP4044 | Type name cannot be resolved | The base type of a class or an interface needs to be known in compile time. Otherwise the module cannot be compiled.
PHP4046 | Call to a member function on a non-object | The expression before the `->` operator results in a non-object value. Such a call is not allowed.
PHP4052 | Method __toString() must return a string value | Value returned from `__tostring()` method is not a string value. This would result in a fatal error in run time.

## Warnings

Code | Description | Reason
---- | ----------- | ------
PHP0125 | Mandatory parameter behind optional | A default value of the optional parameter will never be used, because a mandatory parameter follows.
PHP0171 | Magic method must be public and non-static | Non-public or static modifiers are not allowed for the specified method.
PHP5006 | Undefined function | There is no such function declaration in the project or in the referenced libraries.
PHP5008 | Undefined type | There is no such class declaration in the project or in the referenced libraries.
PHP5010 | Ambiguous declaration | The base of the type declaration is ambiguous; this results in the emission of multiple definitions, a significant run time overhead and an unnecessarily larger resulting assembly file.
PHP5011 | Unreachable code | The code is unreachable. This is based on code analysis and dead code elimination analysis.
PHP5014 | Too many arguments | Function expects less arguments than provided. Not used arguments will be evaluated and ignored.
PHP5015 | Missing mandatory arguments | Function expects more arguments than provided. Missing arguments will be filled with a default value.
PHP5016 | Assert always fails | The condition of `assert()` is evaluated to always be `false`, hence `assert()` will always throw an exception.
PHP5018 | The function has been deprecated | Calling a function that has been marked as deprecated; either it is annotated with `[ObsoleteAttribute]` metadata or it is a known deprecation by the compiler.
PHP5020 | Assignment made to same variable | The expression does not have any effect, it is usually a typo in the source code.

## Informational

Code | Description | Reason
---- | ----------- | ------
PHP6001 | Eval discouraged | Use of `eval()` is not recommended; it allows for suspicious and dangerous code injections and causes significant overhead to the .NET runtime.
