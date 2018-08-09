The .NET languages support enums natively and the compiler provides an easy way of making use of them. However, it is neither possible to define `enum` in PHP code yet nor to perform an `Enum.ToString()` conversion.

## Using `enum` in PHP code

Within the context of PHP code, `enum` looks like a final class with class constats. Its usage from PHP code is thus analogous.

*C# code:*
``` csharp
public enum DayOfWeek {
	Sunday,
	Monday,
	Tuesday,
	Wednesday,
	Thursday,
	Friday,
	Saturday
}
```

*PHP code:*
```php
<?php

echo DayOfWeek::Monday; // prints 1
```

## Defining `enum` in PHP code

*Not supported*
