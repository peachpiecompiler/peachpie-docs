# PhpTypeInfo

<small>**assembly:** Peachpie.Runtime.dll</small>

Represents reflection information for types: class types, interface types or trait types.

## Obtaining PhpTypeInfo

The type information is populated lazily when it is needed by the runtime. Get or create the instance of **PhpTypeInfo** using one of the following extension methods:

- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo<T>()`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this Type type)`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this RuntimeTypeHandle handle)`
- `#!c# PhpTypeInfoExtension.GetPhpTypeInfo(this object instance)`


## Properties

Property | Description
---      | ---
IsUserType | Gets value indicating the type is declared in user's code.
IsInterface | Gets value indicating the type is an interface.
IsTrait | Gets value indicating the type is a trait.
Name | Gets fully qualified type name using PHP syntax.
RelativePath | For PHP types, gets its original file location relative to the compilation root.
Type | Gets the underlaying `#!c# System.Type`.
BaseType | Gets reference to the base type.
RuntimeMethods | Gets table of type's methods and accessor to magic methods.
DeclaredFields | Gets table of type's fields, properties and constants.
RuntimeFieldsHolder | Gets reference to type's [special field](../assembly/compiled-class#additional-class-members) holding dynamic class properties. The field is of type `PhpArray`.
