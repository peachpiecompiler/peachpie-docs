The compiler is built on top of Roslyn - The Open-Source Microsoft Compiler Platform. As a result:

1. Most of the API and public interfaces come from the Roslyn CodeAnalysis project and can be used in the same way.
2. The compiler is able to generate the most recent version of Portable Executable (PE) files and metadata. Portable assemblies are fully compatible with Mono and .NET, ready to be used on a vast array of devices.

## Compilation Steps

1. Parse input arguments, determine CompilationOptions.
2. Parse source files, build array of SyntaxTree.
3. Bind SyntaxTree to Symbol representing the structure of the output assembly.
4. Bind function bodies to IOperation representing the Control Flow Graph (Semantics). IOperation is divided into BoundStatement and BoundExpression. Every type of operation has its class derived from IOperation.
5. Perform subsequent analysis while converging to a fixed point (FlowAnalysis). In this step, type analysis is performed and the corresponding symbols are resolved - Symbols from step 3 are bound to IOperation that references them (ISemanticModel).
6. Method bodies are emitted (CodeGen). Emit of IOperation results in a stream of IL OpCode.
7. The Generated IL OpCode together with hierarchy of Symbol declarations are serialized to the output assembly (PEWriter).