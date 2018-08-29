## Structure of the generated interface

PHP interfaces are compiled into corresponding CLR types. The sample below depicts a PHP interface and resulting CLR type decompiled into C# language.

```php
<?php
interface I {
  // ...
}
```

```c#
[PhpType("I", "index.php")]
public interface I {
  // ...
}
```

## Attributes

The type is annotated with `#!c# [PhpTypeAttribute]`. The attribute contains fully qualified PHP interface name and relative file path where it was declared.
