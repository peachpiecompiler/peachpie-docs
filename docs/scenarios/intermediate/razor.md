This tutorial explains how to work with Razor partials together with PHP, in both directions. To understand this process better, please refer to [this sample](https://github.com/iolevel/peachpie-samples/tree/master/mvc).

## Rendering Razor partial views in PHP

In order to handle requests to .php files compiled into a project (e.g. php-library in this case) in your C# MVC app, you must first configure the ASP.NET Core pipeline in `Startup.cs` as follows:

```c#
app.UsePhp(new PhpRequestOptions(scriptAssemblyName: "php-library"));
```

Now start the project and a request to ‘index.php’ will be served. The sample C# MVC app already contains a shared partial view called “_User.cshtml”. In our sample, you can see the php-library project, where a Razor partial view is being rendered within the `index.php` file:

```php
<?php
use Peachpie\AspNetCore\Mvc\HttpContextExtension as Html;
class User
{
    var $Name = "John";
    var $Address = "Partial Street 123";
}
?>
<?= Html::Partial("_User", new User) ?>
```

`Peachpie\AspNetCore\Mvc\HttpContextExtension::Partial(string $viewName, object $model)` is a helper function that finds the partial view “_User”, renders it and retrieves its output. It is then “echoed” using PHP’s <?= syntax.

Add a reference to your php-library project file, which implements the helper function above:

```xml
<PackageReference Include="Peachpie.AspNetCore.Mvc" Version="1.0.6" />
```

## Rendering a PHP script in Razor

Start by compiling your PHP project into a `DLL` file.

!!! note
    ` OutputType`  must be library and ` TargetFramework`  is netstandard2.0, because we are building a library that will be referenced by your C# MVC app.

Next, add a reference to the MVC project:

```xml
<PackageReference Include="Peachpie.AspNetCore.Mvc" Version="1.0.6" />
<ProjectReference Include="../myPhpApp/myPhpApp.msbuildproj" />
```

And finally, provide the PHP scripts to the runtime. This must be done once when the application is running, and can be achieved by inserting the code into the Startup object, specifically into the `ConfigureServices` method in the ASP.NET Core configuration:

```csharp
Context.AddScriptReference( Assembly.Load("myPhpApp") );
```

Now you can display the output of your PHP script inside a Razor or Partial View (.cshtml), e.g.:

```html
@using Peachpie.AspNetCore.Mvc;
 
<h1>Razor View</h1>
 
@Html.Php("test.php")
```

## MVC Model objects

If you want to pass data to your PHP script, you can do so by specifying the second parameter of the `Php("test.php", model)` method. You can pass the current .NET Model or any other object. To use it, simply refer to `$this` variable in the PHP code. If you are not comfortable with using `$this`, you can take advantage of the PeachPie API and pass any C# variable into a global PHP variable by calling something like:
```csharp
HttpContext.GetOrCreateContext().Globals["mydata"] = "Hi from C#!";
```
This code will create a PHP global variable `$mydata`. `GetOrCreateContext()` is an extension method that gets you the PHP Context out of the ASP.NET Core HttpContext.

## Additional resources

* [Sample code](https://github.com/iolevel/peachpie-samples/tree/master/mvc/render-php-within-razor)
* [Razor pages docs](https://docs.microsoft.com/en-us/aspnet/core/razor-pages/?view=aspnetcore-2.2&tabs=visual-studio)
* [Article on rendering PHP in Razor](https://www.peachpie.io/2018/07/render-php-file-in-razor-view.html)
* [Article on rendering Razor in PHP](https://www.peachpie.io/2018/08/razor-partial-view-on-php-page.html)
