# Session

Since HTTP is a stateless protocol, web applications provide a mechanism (a session management) where data are persisted for a user on the server. It is usually persisted just for a period of time. Each request then may reload this session state to restore the information from the previous request. In PeachPie/PHP programs, the session state is loaded into and persisted from the `$_SESSION` super-global variable.

PeachPie application provides support for the PHP's `$_SESSION` super-global variable, and related `session_***` functions to manage the session state. Note, the actual functionality depends on the web server and a configuration.

## Default Session Handler

The default implementation of the session handler in PeachPie is taking advantage of the underlying ASP .NET (Core) application. In order to enable the session state management, see https://docs.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-5.0#configure-session-state.

In the result, session state in PeachPie web application running on ASP .NET Core is persisted in-memory using distributed memory cache. The entries of the session array itself are stored into the [`ISession`](https://docs.microsoft.com/en-us/dotnet/api/microsoft.aspnetcore.http.isession) object, using the PHP serializer.

### Example of the setup (ASP .NET Core)

> `Startup.cs`

```c#
public void ConfigureServices(IServiceCollection services)
{
    services.AddDistributedMemoryCache();

    services.AddSession(options =>
    {
        options.IdleTimeout = TimeSpan.FromSeconds(10);
        options.Cookie.HttpOnly = true;
        options.Cookie.IsEssential = true;
    });
}

public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
{
    app.UseSession();
    app.UsePhp();
}
```

> `index.php`

```php
<?php

session_start();
echo $_SESSION['counter'] ++;
session_write_close();
```

## Auto Start

Enabling the `Session.AutoStart` option causes the underlying request handler to start the session upon the request start. To set the option on ASP.NET Core application, alter the `AddPhp(options)` call in the *Startup* class:

```c#
public void ConfigureServices(IServiceCollection services)
{
    services.AddPhp(options =>
    {
        options.Session.AutoStart = true;
    });
}
```

## Related Links

- https://docs.microsoft.com/en-us/aspnet/core/fundamentals/app-state?view=aspnetcore-5.0