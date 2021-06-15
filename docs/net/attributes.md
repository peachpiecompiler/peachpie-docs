It is possible to annotate class or interface declaration or a function declaration with both - CLR attributes and PHP attributes. Use the PHP 8 syntax to specify the attribute type name, its parameters and properties.

## PHP attributes

Attributes can be applied to classes, interfaces, traits, functions, properties, and class constants.

## Attribute syntax

```php
<?php

#[System\ObsoleteAttribute("An attribute parameter")] // attribute annotation refering to a .NET attribute
class X {

    #[Amazon\Lambda\Core\LambdaSerializerAttribute(Amazon\Lambda\Serialization\Json\JsonSerializer::class)]
    function foo() {
        // ...
    }
}

```

The sample above depicts the use of .NET attributes on a PHP type and PHP function. The attribute is enclosed in `#[` and `]` symbols. Follows the type name according to PHP syntax and optional round parenthesis with the attribute parameters.

Following syntaxes are possible:

```php
#[AttributeTypeName]
#[AttributeTypeName()]
#[AttributeTypeName(Value)]
#[AttributeTypeName(Value1, Value2)]
#[AttributeTypeName(Parameter1 = Value1, Parameter2 = Value2)]
```

The `Value` can be a number, string, `TypeName::class` specifying a `System\Type`, a class constant, an enumeration member, a global constant, or a simple expression that is resolvable in compile time.

## Pchp.Core.PhpCustomAttribute

In case the specified attribute does not get resolved as a valid .NET `System.Attribute` type, the compiler treats it as an instance of `Pchp.Core.PhpCustomAttrubite` that encapsulates the attribute information. This is used for further PHP reflection using `ReflectionAttribite` class.

```php
<?php

#[Something]
class X {
}
```

The sample above gets compiled to following CIL metadata:

```
[Pchp.Core.PhpCustomAttribute("Something", new byte[0])]
public class X
```

## @deprecated PHPDoc tag

Classes and functions annotated with `@deprecated` PHPDoc tag are implicitly annotated with .NET `System.ObsoleteAttribute`.

```php
<?php

/**
 * @deprecated This class is old.
 */
class X {
}
```

This is useful for the interoperability with .NET languages, i.e. the C# diagnostics will provide information about the use of deprecated types and methods.
