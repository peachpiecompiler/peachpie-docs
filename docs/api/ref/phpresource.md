# PhpResource

<small>**assembly:** Peachpie.Runtime.dll</small>

The type `PhpResource` represents PHP's `resource` type in general. It serves as a base type for all the resource instances within the PHP program.

## Properties

Property | Description
---      | ---
Id | The resource's unique identifier. Corresponds to PHP's resource ID.
TypeName | The actual resource name according to PHP semantics.
IsValid | Gets the value indicating the resource is valid and not disposed.

## Remarks

The type is well known to the runtime in order to provide the `is_resource()` functionality and to clean up resources safely upon the request's end.

Some library functions require an argument of type `PhpResource` that is further converted to a specific `PhpResource` type.
