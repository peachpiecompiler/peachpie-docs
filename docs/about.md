PeachPie is a modern PHP compiler based on [Roslyn](https://github.com/dotnet/roslyn) by Microsoft and drawing from our popular [Phalanger](https://github.com/DEVSENSE/Phalanger) project. It allows PHP to be executed within the .NET framework, thereby opening the door for PHP developers into the world of .NET – and vice versa.

!!! note ""
    There can still be inconsistencies or incompatibilities with standard PHP code when running apps on PeachPie. Refer to our [roadmap]     (roadmap) to find out what libraries, constructs and functions are supported.
    
## Project purpose

### Migrating PHP applications to a modern platform
There is a plethora of **legacy PHP applications** out there that would benefit from being compiled to .NET. Some of the largest companies in the world still rely heavily on their apps written many years ago. This legacy code is **slowing down their performance** and costing the companies scarce financial resources by using unnecessary CPU power on the cloud.

!!! Tip
    PeachPie allows large codebases to be migrated in parts rather than all at once.

### Both-way interoperability of C# and PHP 
We strive to improve the **collaboration between PHP and .NET developers** within a single project. There is currently a deep cliff between the two worlds and the work can be difficult to coordinate. PeachPie compiler’s both-way **interoperability** allows PHP and .NET developers to collaborate seamlessly within projects, thereby reducing the unnecessary administrative overhead of gluing the two together at the end.

### Harnessing the value of PHP 
We firmly believe that there is an immense **value in the world of PHP**. PeachPie opens up previously untouched markets for PHP programmers to explore, such as **games**, **cross-platform apps** or **IoT** and with the vast array of existing libraries and technologies, we are convinced PHP developers can come up with valuable use cases.

## Project goals
- **Increased performance**: PeachPie's extensive type analysis and the influence of Microsoft Roslyn should provide an improved performance of PHP applications and components. 

- **Security**: since programs run within the standardized and manageable .NET or .NET Core environment, the code is fully verifiable without any unsafe constructs. 

- **Cross-platform development**: the project compiles legacy PHP code into portable class libraries, enabling developers to build cross-platform apps and libraries for Microsoft platforms.  

- **Full .NET compatibility**: compiled programs run on the reimplemented PeachPie runtime, fully compatibly with the PHP runtime.

- **Both-way interoperability**: the project allows for hybrid applications, where parts are written in C# and others in PHP. The parts will be entirely compatible and can communicate seamlessly, all within the .NET framework.  
