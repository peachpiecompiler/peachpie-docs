It is possible to annotate class or interface declaration or a function declaration with the CLR attribute. Use the extended syntax to specify the attribute type name, its parameters and properties.

```php

[System\Obsolete("An attribute parameter")]
class X {

    [Amazon\Lambda\Core\LambdaSerializerAttribute(typeof(Amazon\Lambda\Serialization\Json\JsonSerializer))]
    function foo() {
        // ...
    }
}

```

The sample above depicts the use of attributes on a PHP type and PHP function. The attribute is enclosed in `[` and `]` characters. Follows the type name according to PHP syntax and optional round parenthesis with the attribute parameters.

Following syntaxes are possible:

```
[AttributeTypeName]
[AttributeTypeName()]
[AttributeTypeName(Value)]
[AttributeTypeName(Value1, Value2)]
[AttributeTypeName(Parameter1 = Value1, Parameter2 = Value2)]
```
The `Value` can be a number, string, `typeof(TypeName)` specifying a `System\Type`, a class constant, an enumeration member, or a global constant that is resolvable in compile time.
