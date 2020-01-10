# Unicode

A `string` in PeachPie is an object representing either a text or a sequence of bytes. Text natively consists of Unicode characters, and is based on .NET's [`System.String`](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/strings/) data type.

Native support for Unicode is built in the type system, in the compiler, and in library functions. By default, all the textual operations respect the Unicode semantic allowing for safe and clean text manipulation.

The string value, however, can be both - UTF-16 character sequence and/or a single-byte sequence.

String values are not zero-terminated, hence they can contain `\0` characters without breaking `strlen`, `echo` and other string operations.

## Source Files

String literals contained in the source code are parsed with respect to the [CodePage](/php/msbuild#codepage) property and transformed into UTF-16 textual values. The encoding used to decode source files is `UTF-8` by default.

```php
<?php
// outputs the Unicode string
// the text is safely encoded using current output encoding
echo "Ahoj světe!";

// assigns the Unicode textual value into a variable `$value`
// Internally the value is stored safely as UTF-16
$value = "Привет мир!";
```

It is recommended to save the source files using UTF-8 encoding, eventually including the UTF Signature (BOM). The BOM is automatically ignored from the source files. If a file are saved using a different encoding, specify the encoding using the [CodePage](/php/msbuild#codepage) property in order to decode the textual values correctly. An incorrect encoding may result in compile-time error (Invalid source file, or [Source file not found](https://github.com/peachpiecompiler/peachpie/issues/601)).

In this way, string values within the source files are always valid Unicode strings independent on the web server configuration.

In case the string literal contains a byte sequence (denoted with `\x[0-9A-Fa-f]{1,2}` or `\[0-7]{1,3}`), the string value is represented with byte array.

```php
<?php
// assigns a string represented as a sequence of bytes
// [48 65 6c 6c 6f 20 0F]
$binaryvalue = "Hello \017";
```

## String Operations

Operations respect the Unicode semantic. All the library functions and operators are Unicode-safe by default so they don't break a Unicode string. Operations working with bytes of the given string (e.g. `base64_encode`) will convert given Unicode string to a byte sequence implicitly, using the current [StringEncoding](#stringencoding).

### Concatenation

Operator for the string concatenation (`.`) concatenates given string values. It doesn't change their internal representation nor performs any implicit conversion. If one of the operands is a Unicode string and the other is a byte sequence, it is concatenated as it is resulting in a string value consisting of both - Unicode text followed with a single byte sequence.

### String length

String length is counted as a number of elements within the string. The element can be either a UTF-16 character or a byte.

### Array operator `[]`

Single elements within the string value can be accessed with the array operator (`[]`). Elements can be either changed or read.

If element at given position is a UTF-16 character, the result of the operation is Unicode string with a single character. If the element is a single-byte, the result of the operation is a string with a single byte.

### Output

The string value can be outputted using standard functions (e.g. `echo`, `print_r`, etc.).

Unicode characters are encoded using current [output encoding](#output-encoding). Single-byte elements are outputted as they are.

### Regular expressions

PCRE functions always convert input string values to Unicode string value if they are a single-byte sequence.

### Database

Database drivers are Unicode-safe as well. Any text value passed into or read from the database is a Unicode string. BLOB values remain as byte sequences.

Note, when reading string values from database, ensure the CHARSET is set correctly according to the database configuration. The database driver is responsible for converting the values stored in database to string values.

On the other side, passing text values to the database is handled by PeachPie; Unicode values remain the same, byte-sequences are encoded to Unicode string values using [StringEncoding](#stringencoding) configuration.

### Conversions

Any implicit conversions between Unicode value and byte sequence value respect current [StringEncoding](#stringencoding).

To perform conversion from Unicode to byte-sequence explicitly, use `(binary)` cast operator.

## Configuration

In short, all the encodings are UTF-8 by default. UTF-8 is a recommended encoding to be used for source files, content-encoding, HTML charset and database setup.

### CodePage

Property [CodePage](/php/msbuild#codepage) tells the compiler how to decode source files.

### Output Encoding

Web applications have an output encoding; it is responsible for encoding Unicode text to underlaying HTTP response stream. This option is set in run time by the web server.

Console applications are outputting the text using `UTF-8` always.

### StringEncoding

Internal encoding used for implicit conversion between Unicode characters and byte sequences. It is identical to [Output Encoding](#output-encoding). See [Context](/api/ref/context) for more details.

## Limitations

Since a string element can be both - a UTF-16 character or a byte - the string length (`strlen`) might get unpredictable.
