# API overview

The PeachPie project introduces a set of supporting runtime APIs and specifications. The PHP project is compiled respecting the specifications and APIs, which makes it usable and accessible across the .NET platform in a unified way.

!!! info "Peachpie.Runtime"
    The compiled project depends on the `Peachpie.Runtime.dll` module. This defines the language core types, the language semantic and APIs; all used by both the compiled project and possibly any other .NET project.

!!! info "Peachpie.Library"
    The compiled project depends on the `Peachpie.Library.dll` module. It contains an implementation of the basic set of PHP functions, constants and types.
