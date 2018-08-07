# API overview

The PeachPie project introduces set of supporting runtime APIs and specifications. The PHP project is compiled respecting the specifications and APIs which makes it usable and accessible across the .NET platform in a unified way.

!!! info "Peachpie.Runtime"
    The compiled project depends on `Peachpie.Runtime.dll` module. This defines the language core types, the language semantic and APIs; all used by both the compiled project and possibly any other .NET project.

!!! info "Peachpie.Library"
    The compiled project depends on `Peachpie.Library.dll` module. It contains implementation of basic set of PHP functions, constants and types.
