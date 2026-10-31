# ASP.NET Core with WordPress

WpDotNet is a package made primarily to be used as a part of an ASP.NET Core application. Its possible uses are:

- Running WordPress on ASP.NET Core, without PHP, or any source files on the server.
- Adding WordPress as a frontend to an existing ASP.NET Core application.
- Combining WordPress and MVC or Razor views.
- Extending WordPress with plugins in C#.

## Create an ASP.NET Core web application with WordPress

1. Create an empty ASP.NET Core web application that targets **`net6.0`**. `PeachPied.WordPress.AspNetCore` 6.7.1 targets `net6.0`.

    ```shell
    dotnet new web -f net6.0
    ```

    In Visual Studio, use **File | New | Project** and the **ASP.NET Core Empty** template for C#, and select **.NET 6.0** as the target framework.

2. Add a package reference to **PeachPied.WordPress.AspNetCore** version **6.7.1**. This stable package does not need *Include prerelease*.

    ```shell
    dotnet add package PeachPied.WordPress.AspNetCore --version 6.7.1
    ```

    The package was built against PeachPie 1.1.11. Its nuspec asks for `Peachpie.AspNetCore.Web` and `Peachpie.AspNetCore.Mvc` version `1.1.11` or higher. This page does not claim that substituting the 1.1.13 packages was tested.

3. Add WordPress to the request pipeline. In `Program.cs` or `Startup.Configure`, call `UseWordPress()`:

    ```csharp
    app.UseWordPress();
    ```

    `AddWordPress(...)` changes the database connection and other settings, as described in [configuration](configuration).

4. Prepare MySQL. The server can be local or in Docker:

    ```shell
    docker run -e MYSQL_ROOT_PASSWORD=password -e MYSQL_DATABASE=wordpress -p 3306:3306 -d mysql:latest
    ```

    Create a database, or restore an existing WordPress database. Keep the username, password, and server address.

5. Enter the MySQL credentials in `appsettings.json`:

    ```json
    {
      "WordPress": {
        "dbhost": "localhost",
        "dbpassword": "password",
        "dbuser": "root",
        "dbname": "wordpress"
      }
    }
    ```

6. Run the application with `dotnet run` or ++f5++.

7. Publish with `dotnet publish` or the Visual Studio Publish wizard. The app is a normal ASP.NET Core application.

## Sample solution

A complete ASP.NET Core application with WordPress is on GitHub:

- https://github.com/iolevel/peachpie-wordpress

`global.json` in that repository pins `Peachpie.NET.Sdk` to 1.1.11 and `PeachPied.WordPress.Build.Plugin` to 6.7.1. Open it in Visual Studio, VS Code, or Rider and read the project file for the target framework it currently sets.

## Deploy to Azure

[iolevel/azure-wpdotnet](https://github.com/iolevel/azure-wpdotnet) is a deployable sample. Its `app/app.csproj` targets `net8.0` and references `PeachPied.WordPress.AspNetCore` **6.5.4-rc-020**, which is older than 6.7.1. Change the package version before treating that repository as the current release. The button on its README points at [azuredeploy.net](https://azuredeploy.net/).
