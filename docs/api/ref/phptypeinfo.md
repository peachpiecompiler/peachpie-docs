# PhpTypeInfo

<small>**assembly:** Peachpie.Runtime.dll</small>

Represents reflection information for types: class types, interface types or trait types.

## Retrieving a PhpTypeInfo object

The type information is populated lazily when it is needed by the runtime. Get or create the instance of **PhpTypeInfo** using one of the following extension methods:

- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo<T>()`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this Type type)`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this RuntimeTypeHandle handle)`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this object instance)`
- `#!c# Context.GetDeclaredTypes()` retrieves a list of all available types declared within [Context](context).

## Properties

Property | Description
---      | ---
IsUserType | Gets the value indicating that the type is declared in the user's code.
IsInterface | Gets the value indicating that the type is an interface.
IsTrait | Gets the value indicating that the type is a trait.
Name | Gets a fully qualified type name using PHP syntax.
RelativePath | For PHP types, gets its original file location relative to the compilation root.
Type | Gets the underlaying `#!c# System.Type`.
BaseType | Gets the reference to the base type.
RuntimeMethods | Gets a table of the type's methods and accessor to magic methods.
DeclaredFields | Gets a table of the type's fields, properties and constants.
RuntimeFieldsHolder | Gets a reference to the type's [special field](../assembly/compiled-class#additional-class-members) holding dynamic class properties. The field is of type [PhpArray](phparray).

## Related links

- [Compiled assembly](../assembly/compiled-assembly)
- [Compiled class](../assembly/compiled-class)
