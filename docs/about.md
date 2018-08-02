PeachPie is a modern PHP compiler based on [Roslyn](https://github.com/dotnet/roslyn) by Microsoft and drawing from our popular [Phalanger](https://github.com/DEVSENSE/Phalanger) project. It allows PHP to be executed within the .NET framework, thereby opening the door for PHP developers into the world of .NET – and vice versa.

## Project purpose
### Migrating PHP applications to a modern platform
We believe it is important to mention what we are trying to achieve with this project. Firstly, we know from experience that there is a plethora of **legacy PHP applications** out there that would benefit from being compiled to .NET. Some of the largest companies in the world still rely heavily on their apps written many years ago. This legacy code is **slowing down their performance** and costing the companies scarce financial resources by using unnecessary CPU power on the cloud.

### Both-way interoperability of C# and PHP 
Secondly, we strive to improve the **collaboration between PHP and .NET developers** within a single project. There is currently a deep cliff between the two camps and the resulting output is difficult to coordinate. Peachpie compiler’s both-way **interoperability** allows PHP and .NET developers to collaborate seamlessly within projects, thereby reducing the unnecessary administrative overhead of gluing the two together at the end.

### Harnessing the value of PHP 
We firmly believe that there is an immense **value in the world of PHP**. It is our conviction that, if given the chance, PHP developers would come up with creative and efficient solutions. Peachpie opens up previously untouched markets for PHP programmers to explore, such as **games**, **cross-platform apps** or **IoT**. We are excited to see what products will spring forth when they will be able to use Peachpie for this purpose.

## Project goals
- **Increased performance**: PeachPie's extensive type analysis and the influence of Microsoft Roslyn should provide an improved performance of PHP applications and components. 

- **Security**: since programs run within the standardized and manageable .NET or .NET Core environment, the code is fully verifiable without any unsafe constructs. 

- **Cross-platform development**: the project compiles legacy PHP code into portable class libraries, enabling developers to build cross-platform apps and libraries for Microsoft platforms.  

- **Full .NET compatibility**: compiled programs run on the reimplemented PeachPie runtime, fully compatibly with the PHP runtime.

- **Both-way interoperability**: the project allows for hybrid applications, where parts are written in C# and others in PHP. The parts will be entirely compatible and can communicate seamlessly, all within the .NET framework.  
