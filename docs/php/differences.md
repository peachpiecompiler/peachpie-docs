# Well-Known Differentces

## PEACHPIE_VERSION

In order to detect whether the code runs under the standard `php` or under .NET (PeachPie), PeachPie introduces  global constant `PEACHPIE_VERSION`.

```php
<?php
if ( defined('PEACHPIE_VERSION') ) {
    // code runs under .NET
}
```

The constant has a string value with the full PeachPie version including the prerelease suffix. When the code above is compiled by PeachPie, the entire condition is eliminated thus allowing for the code to be further optimized.

## Garbage Collection

It is important to remember, the .NET runtime has its own Garbage Collection mechanism. It destructs objects in a different order than standard PHP does. Behavior of destructors is not defined yet. Any destructors defined in the compiled code produces a compile-time warning.
