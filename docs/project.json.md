> Deprecated in Peachpie 0.6.0.

.NET Core **1.0.0** projects can be configured to target the PHP language by modifying their `project.json` file. Three settings have to be added/changed in order to use Peachpie compiler instead of the default C# and to target `Peachpie.Runtime` in addition to standard `System.Runtime`.

1. Add Peachpie compiler as the tool package: `"tools": { "Peachpie.Compiler.Tools": "*" }`
2. Specify build options: `"buildOptions": { "compilerName": "php", "compile": "**\\*.php" }`
3. Add Peachpie runtime as a dependency: `"dependencies": { "Peachpie.App": "*" }`

## Sample `project.json`

```javascript
{
  "version": "1.0.0-*",
  "buildOptions": {
    "compilerName": "php",
    "compile": "**\\*.php",
    "emitEntryPoint": true,
    "debugType": "portable"
  },
  "dependencies": { "Peachpie.App": "*" },
  "tools": { "Peachpie.Compiler.Tools": "*" },
  "frameworks": {
    "netcoreapp1.0": {
      "dependencies": {
        "Microsoft.NETCore.App": { "type": "platform", "version": "1.0.0" }
      }
    }
  }
}
```
