# Context

<small>assembly: Peachpie.Runtime.dll</small>

`Context` maintains the PHP application' state. It is usually associated with a single web request, a thread or a console application. In short, the context remembers declared types and functions, global variables, 'static' locals and properties and included scripts. The context also provides information about the environment, services and local configuration.

It is important to note, the context instance is required by compiled PHP routines and by class constructors. Additionally library functions may require the context instance in order to work properly.

## Construction

A new instance of the object is created in two ways:

- **Implicitly by the framework:** The appropriate context is created for a web application during its request handling routine. Its instance is then passed to PHP routines and to handlers during the request life cycle implicitly.
- **Explicitly by instantiating it:** It is possible to create an instance of a default context and use it in order to drive a custom PHP application' state. A new instance of the default context can be created by the static method below:
    * `#!c# Context.CreateEmpty()`

## Methods

Method | Summary
---    | ---
AddScriptReference(Assembly) (static) | 
DeclareFunction(name, Delegate) | 
DeclareType<T> | 
DeclareScript(relpath, MainDelegate) (static) | 
DefineConstant(name, value) | 
TryGetConstant(name, out value) : bool | 
GetDeclaredType(name) : PhpTypeInfo | 
GetDeclaredTypes() : IEnumerable<PhpTypeInfo> | 
GetDeclaredFunctions() : IEnumerable<RoutineInfo> | 
GetLoadedExtensions() : ICollection<string> | 
GetIncludedScripts() : IEnumerable<ScriptInfo> | 
Call(functionname, PhpValue[] args) : PhpValue | 
Create(classname, PhpValue[] args) : object | 
Dispose() | 

## Helper methods

In case of an ASP.NET Core application, the instance can be obtained using a helper method: `#!c# GetOrCreateContext(this HttpContext) : Context`

## Properties

Property | Summary
---      | ---
RootPath : string | 
StringEncoding : Encoding | 
HttpPhpContext : IHttpPhpContext | 
Output : TextWriter | 
Globals : PhpArray | 
Server : PhpArray | 
Session : PhpArray | 
Cookie : PhpArray | 
Post : PhpArray | 

## Notes

## Samples

## Related links