## Peachpie Components

* **[[The compiler|compiler-architecture]]** - processes source code, performs analysis steps and generates .NET assemblies (.dll or .exe).
* **[[The runtime|runtime-architecture]]** is supporting class library providing functionality needed for running generated assemblies and providing runtime context.
* **[[Libraries|libraries-architecture]]** contain definitions of functions, constants and classes available to runtime.

### Structure of generated assembly

The compiler outputs portable class libraries or executables compatible with .NET 4.5, Mono and .NET Core.

* ![](https://github.com/iolevel/peachpie/wiki/img/icon_ns.png) *namespace* -
  * ![](https://github.com/iolevel/peachpie/wiki/img/icon_class.png) *class* &lt;Script&gt;
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) Main(string[] *args*) : int
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) EnumerateConstants(Action&lt;string, PhpValue, bool&gt; *callback*)
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) EnumerateReferencedFunctions(Action&lt;string, RuntimeMethodHandle&gt; *callback*)
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) EnumerateReferencedTypes(Action&lt;string, RuntimeTypeHandle&gt; *callback*)
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) EnumerateScripts(Action&lt;string, RuntimeMethodHandle&gt; *callback*)
* ![](https://github.com/iolevel/peachpie/wiki/img/icon_ns.png) *namespace* **NS1**
  * ![](https://github.com/iolevel/peachpie/wiki/img/icon_class.png) *class* **Class1**
* ![](https://github.com/iolevel/peachpie/wiki/img/icon_ns.png) *namespace* &lt;Root&gt;
  * ![](https://github.com/iolevel/peachpie/wiki/img/icon_class.png) `[Script("file1.php")]` static *class* **file1_php**
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) &lt;Main&gt;(Context *&lt;ctx&gt;*, PhpArray *&lt;locals&gt;*, object *this*, RuntimeTypeHandle *self*) : T
    * ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) **function1**(Context *&lt;ctx&gt;*, ...) : T

> Declarations are compiled into the assembly as depicted above.
> - Script files (**file1.php**) are represented by respective class in namespace &lt;Root&gt;. The script body is represented by static method &lt;Main&gt;.
> - Global functions (**function1**) are compiled as static methods in its script file class. Conditionally declared functions contains a suffix.
> - Classes and interfaces (**class1**) are compiled into the same structure as defined.

### Structure of compiled class

PHP classes are compiled as CLR classes, compatible with C# syntax and semantic.

The class constructors are separated into three methods as follows:

![](https://github.com/iolevel/peachpie/wiki/img/icon_class.png) `[PhpType("X")]` class X {
* ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) `[PhpFieldsOnlyCtor]` protected .ctor(`Context` ctx)
* ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) .ctor(`Context` ctx [, ... ctorparams])
* ![](https://github.com/iolevel/peachpie/wiki/img/icon_method.png) __construct([ctorparams])

}

> - `[PhpFieldsOnlyCtor].ctor()` is minimal constructor that initializes the instance without invoking PHP constructor. This is used when PHP class inherits another PHP class; in such case base PHP constructor must not be called.
> - `.ctor()` is used by C# programs and for purposes of constructing a new instance of the object. .ctor() internally constructs the object, initializes fields and calls proper PHP constructor if any.
> - `__construct()` is an optional PHP constructor that might be called explicitly or as a part of `.ctor`.

In addition, compiled PHP class contains `.cctor()` (static constructor) that initializes internal runtime descriptors and call sites.

The class also contains following fields used by compiler and runtime.
* internal PhpArray &lt;runtimeFields>; // holds additional fields that might be set during runtime.
* IPhpCallable.Invoke(Context, PhpValue[]); // implementation of IPhpCallable interface in case the class has the magic `__invoke` function.
* class __statics { ... } // nested container for actual instances of PHP static fields. This is used by runtime to manage different values of static fields for each Context (typically an HTTP Request).
