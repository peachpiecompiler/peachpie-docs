The library is represented by a common .NET class library (.dll file). Once the library is referenced within the compilation process, containing symbols (types, functions and constants) become accessible to the compiled program. Once the library is referenced, it has to be distributed together with the compiled program. There are two types of libraries:

1. **Standard .NET class library** - its public types become available to the runtime and can be used as PHP classes.
2. **Extension library** is a .NET class library containing an assembly attribute `[assembly: Pchp.Core.PhpExtension]`. This tells the compiler to treat containing declarations differently.

### Extension Library

* Assembly attribute that tells the compiler to treat the assembly as an extension library.
```CSharp
[assembly: Pchp.Core.PhpExtension] 
```

* `internal` and `private` symbols won't be visible to the compiled script.

* `public class` or `public interface` with `[PhpType]` attribute become available to the compiled script as a compatible PHP class or interface even within the same namespace.
```CSharp
// Example:
[PhpType]
public class ArrayIterator : IEnumerable, ArrayAccess, Countable  {
    // declaration of a PHP method in C#
    public virtual void foo(PhpArray array = null){ ... }

    // declaration of a class constant in C#
    public const int A_CLASS_CONSTANT = 123;

    // declaration of application-wide static field
    public static int StaticField;

    // declaration of a container containing context-static fields and constants
    // instance of such fields is created for every request separately and is thread-safe
    public class _statics {
        public readonly int ContextConstant = 789;
        public string ContextStaticField = "abc";
    }
}
```

```PHP
// Example usage in PHP:
(new ArrayIterator())->foo([]);
echo ArrayIterator::$StaticField;
echo ArrayIterator::$ContextStaticField;
echo ArrayIterator::A_CLASS_CONSTANT;
echo ArrayIterator::ContextConstant;
```

* `public static class` represents a container containing declaration of global PHP functions and constants
```CSharp
// Example:
public static class MyFunctions {
    // declaration of a global PHP function 'mystrlen()'
    public static int mystrlen(string str) { return (str != null) ? str.Length : -1; }

    // declaration of a global PHP function 'myecho()' that requires a reference to current Pchp.Core.Context representing PHP runtime.
    public static void myecho(Context ctx, int value) { ctx.Echo(value); }

    // declaration of a global PHP constant 'MYCONST'
    public const int MYCONST = 456;

    // declaration of a global constant that is initialized in run time
    public static readonly int MYCONST2 = Environment.OS.Version.Major;

    // declaration of a global constant as a C# property, evaluated every time the constant gets used
    public static object MYCONST3 => new stdClass();
}
```

```PHP
// Example usage in PHP:
mystrlen("");
myecho(123);
echo MYCONST;
echo MYCONST2;
```

### Special Parameters

In order to access special Peachpie objects like current `Context`, follow the rules below:

#### Accessing current Context

Add `Context ctx` as the first parameter of the method. The runtime will implicitly fill this parameter with instance of current `Pchp.Core.Context` object.
```CSharp
public static void myecho(Context ctx){ ctx.Echo("Hello from library!"); }
```

#### Accessing array of local variables

Add `[ImportLocals] PhpArray locals` parameter before regular parameters. The runtime will implicitly pass current local variables to this parameter.
```CSharp
public static void getlocals([ImportLocals] PhpArray locals){ /* locals contain set of caller routine local variables*/ }
```
