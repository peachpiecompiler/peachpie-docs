# Decompilation overview

For the purposes of development and optimization, it is useful to check the compiled DLL file. It serves for several purposes;

- **First**, the developer sees the classes and interfaces exposed from the compiled assembly.

- **Second**, decompilation reveals how the compiler treats some PHP constructs and declarations, so it can be used from C# or other .NET languages. It also allows for detecting errors in or improving the compiler.

- **Third**, performance critical pieces of code should be reviewed and, if possible, type information or a better decomposition should be added to the source code to improve the type analysis and thus the compilation result. See [performance](/php/performance) for more information.

## Try PeachPie

The community project [try.peachpie.io](https://try.peachpie.io) allows for an immediate look into the .NET byte code generated from PHP code. This is useful for the decompilation of small PHP snippets. The site internally (and in-memory) compiles the given PHP code and shows the byte code live, with an option to decompile to C# code.

## ILSpy

A handy tool for decompiling entire assemblies. In case there is a large PHP project or a project consisting of more script files in general, ILSpy provides all the functionality needed for both checking the assembly and performance fine-tuning.

The tool gets error messages in case the compiled assembly is not valid (e.g. the compiler missbehavior) and gets nice view of the [compiled assembly structure](/api/assembly/compiled-assembly).

## disasm

*disasm* is a basic tool getting all the metadata and IL stream of a compiled DLL file. Recommended for hardcore IL hunters.
