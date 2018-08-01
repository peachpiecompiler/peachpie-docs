The runtime is represented with **Peachpie.Runtime.dll** library. It contains essential functionality used by compiled programs. It means that the compiled application depends on the runtime and the runtime has to be distributed together with the compiled program.

## Lifecycle

### Command Line Application

Main { using (var ctx = Context.CreateConsole()) first_file.Main(); }

### ASP.NET Web Application

ASP.NET Integrated Pipeline | Pchp.Core.RequestHandler | using (var ctx = new Context()){ requested_file.Main(); }

### ASP.NET Core Request Delegate

TBD: UsePhp(IApplicationBuilder) | handle request to .php | invoke corresponding Main method

## Pchp.Core.Context

**Context** is a special class representing a single web or CLI request. It holds the current state of the request, so far included scripts, declared types and functions and constant values. The object provides basic API for invoking global functions etc.

Context class is instantiated by runtime and its instance is provided to all PHP functions.

### Request-Static Objects

Context provides mechanism for maintaining information that is bound to current request (context). Such as static local variables, static variables, sometimes constants and class constants.

- IStaticInit

## Type Hierarchy

- PhpValue
  - PhpNumber
    - Int64
    - Double
  - Boolean
  - PhpArray
  - Object
    - Null
    - Delegate
    - PhpResource
    - class T
  - PhpString
    - String
    - byte[]
  - Void
  - PhpAlias
    - &PhpValue

### Conversions

- PHP semantics conversions

### Operators

- PHP semantics operators

## Dynamic

- runtime binders to generate most efficient form of expressions in runtime

## Interfaces

- IPhpEnumerator
- IPhpEnumerable