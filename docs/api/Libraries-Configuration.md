A library can provide its configuration options to be managed by the runtime. The configuration usually consists of two parts:

* **.NET container** providing type safe access to option values.
* **Standard PHP options** identified by string name with additional access flags.

### Step 1. Registering .NET container

The first step is to provide a class instance implementing `IPhpConfiguration` containing the default option values. The instance is registered once (e.g. in a static constructor) by calling `Context.RegisterConfiguration<MyConfiguration>(myConfiguration)`. This tells the runtime that there is a `MyConfiguration` container.

The runtime (*Context*) then manages the configuration `MyConfiguration`, clones its instance for every new instance of *Context* to maintain different values in the context of different web requests and provides this instance through *Context.Configuration* service.

### Step 2. Associating configuration with standard PHP options

In order to provide an implementation of the standard PHP functions `ini_get`, `ini_set`, `ini_restore`, `ini_get_all` etc., PHP options by their PHP name should be registered separately. The registration is called once per option (e.g. in a static constructor) by calling `StandardPhpOptions.Register("option.name", IniFlags, GetSetDelegate)`.

This creates the option descriptor providing additional flags and a delegate handling option value setter and getter. The delegate gets an instance of `IPhpConfigurationService` providing instances of the registered configurations from step 1.
