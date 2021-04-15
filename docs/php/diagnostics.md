# Diagnostics reference

The compiler performs several passes of code analysis during the build process. As a result, it may end up with a list of diagnostics each corresponding to a location in the source code. The following list describes the error codes and possible solutions on how to fix them.

!!! tip
    The warning diagnostics can be turned off by setting a build property. See [NoWarn Property](/php/msbuild#nowarn) for more information.

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
PHP4048 | Cannot instantiate specified type. | A type is an interface, abstract class, trait or a static class and cannot be instantiated. Using `new` operator would fail.
PHP4049 | Not a trait. | Only trait types can be used within class's `use` statement.
PHP4052 | Cannot re-assign $this | `$this` variable cannot be modified.
PHP4053 | Cannot declare a return type | The specified function must not have a return type hint. This is not allowed. `__construct`, `__destruct`, `__clone` always return `void`.
PHP4054 | A void function must not return a value. | A function with the `void` return type cannot return a value.
PHP4061 | not in the 'loop' or 'switch' | Use of `break` or `continue` does not make any sense outside of for, foreach, while or switch blocks.

## Warnings

Code | Description | Reason
---- | ----------- | ------
PHP0125 | Mandatory parameter behind optional | A default value of the optional parameter will never be used, because a mandatory parameter follows.
PHP0171 | Magic method must be public and non-static | Non-public or static modifiers are not allowed for the specified method.
PHP0181 | Using `& new` has been deprecated. | This is a common code pattern in PHP 4 applications. The `&` operator before `new` can be safely removed since all the objects are passed by reference anyways since PHP 5. Since PeachPie `1.0.1`, this operator is ignored, having no effect.
PHP5006 | Undefined function | There is no such function declaration in the project or in the referenced libraries.
PHP5008 | Undefined type | There is no such class declaration in the project or in the referenced libraries.
PHP5010 | Ambiguous declaration | The base of the type declaration is ambiguous; this results in the emission of multiple definitions, a significant run time overhead and an unnecessarily larger resulting assembly file.
PHP5011 | Unreachable code | The code is unreachable. This is based on code analysis and dead code elimination analysis.
PHP5014 | Too many arguments | Function expects less arguments than provided. Not used arguments will be evaluated and ignored.
PHP5015 | Missing mandatory arguments | Function expects more arguments than provided. Missing arguments will be filled with a default value.
PHP5016 | Assert always fails | The condition of `assert()` is evaluated to always be `false`, hence `assert()` will always throw an exception.
PHP5018 | The function has been deprecated | Calling a function that has been marked as deprecated; either it is annotated with `[ObsoleteAttribute]` metadata or it is a known deprecation by the compiler.
PHP5019 | The expression is not being read | The expression does not have any effect if it is not assigned to a variable or passed as a parameter.
PHP5020 | Assignment made to same variable | The expression does not have any effect, it is usually a typo in the source code.
PHP5023 | Cloning of non-object | The operand might be a scalar type or a non-cloneable object. This might result in an exception.
PHP5026 | Missing the call of parent::__construct() | Class constructor should call its base constructor.
PHP5029 | Method __toString() must return a string value | Value returned from `__tostring()` method is not a string value. This is a fatal error at run time.
PHP5031 | PCRE pattern parse error | Provided regular expression is invalid and will fail to parse.
PHP5032 | Type is already defined | The type name (class, interface, or trait) is already defined. This definition won't be used, and may cause a fatal error at run time.

## Informational

Code | Description | Reason
---- | ----------- | ------
PHP6001 | Eval discouraged | Use of `eval()` is not recommended; it allows for suspicious and dangerous code injections and causes significant overhead to the .NET runtime.
PHP6003 | Wrong letter case in class name | Specified class name does not match exactly the declared class name.
PHP6005 | Wrong letter case in function override | Overriden function name does not match it's parent name. This causes an unnecessary emitted stub and override in CLI metadata.
