# API overview

The PeachPie project introduces set of supporting runtime APIs and specifications. The compiled PHP project respects the specifications and APIs which makes it usable and accessible across the .NET platform.

!!! info "Peachpie.Runtime"
    The compiled project depends on `Peachpie.Runtime.dll` module. This defines the language core types, semantic and API; all used by both the compiled project and any other .NET project.

!!! info "Peachpie.Library"
    By default, any compiled project depends on `Peachpie.Library.dll` module. It contains a basic set of PHP functions, constants and types implemented in .NET.