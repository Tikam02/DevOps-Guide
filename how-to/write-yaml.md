

# What is YAML


Originally YAML meant Yet Another Markup Language. However, it was later repurposed for YAML Ain’t Markup Language to emphasize its data-oriented features.
YAML is a data serialization language like XML and JSON. It is used to transfer data between applications and services which have different data structures.
Common use cases include writing configuration files, log files and data sharing.

## Why is it popular

YAML matches the native data structures of agile methodology. It has clear formatting which makes it human-readable.
Example of data representation in YAML, XML and JSON

YAML

```
Employees:
  -  id: 4
     employeename: Ryan                  
     employeetitle: Marketing Manager 
     
```

XML

```
<Employees>
	<id>4</id>
	<employeename>Ryan</employeename>
	<employeetitle>Marketing Manager</employeetitle>
</Employees>
```

JSON

```
{
"Employees": [
  {
    "id":  4,
    "employeename":  "Ryan",
    "employeetitle":  "Marketing Manager"
  }
]
}
```

You can see that YAML does not use any special characters and is easier to read.

## How to write a valid YAML file

- YAML is case sensitive
- YAML file extensions are .yaml , .yml
- Data structures are defined using line separations and whitespace indentations. Tabs are not allowed in YAML.

- Numerals 
Unquoted numerals are considered as integers or floating-point values.

 *Integers* can be decimal, octal, or hexadecimal

```
     id: 4
     octalexample: 012345    
     hexaexample: 0x12d4 
```
   *Floating-point* values can be fixed and exponential.
    

```
     weight: 55.5
     exp: 12.3015e+05
```

- Strings

String data types are usually not included in quotes but you can use double or single quotes.
```
     Example –
	    employeename: “Ryan”
	    employeename: ‘Ryan’
	    employeename: Ryan
```

*Escape sequences* have to be included in double quotes

```
      employeename: “Ryan \n”
```

*Multiline strings*- You can specify multiline strings in two ways:-

 Pipe character (|) is used to preserve line breaks.
         
 ```
        multilineString: |
           this is a multiline string
           this is the second line
           this is the third line
```                          
   
The fold character or greater than sign ( >) folds the text such that it all appears in one line

```
      multilineString: >
         this is a single line string
         but is written in this format
         for clarity 
 ``` 

- Comments 

Comments start with a hash sign (#). 
Multiline comments are not supported. For multiline comments, you have to put # at the start of each line.

- Key-value pairs

The basic building blocks of yaml files are key-value pairs.
These are represented in the form key: value. The colon must be followed by a space.
```
      Employees:
         id: 4
         employeename: Ryan                  
         employeetitle: Marketing Manager
```

This can also be specified inline by using curly braces {} and separating each entry by a comma.
```
Employees: {id: 4, employeename: Ryan, employeetitle: Marketing Manager}
```
- Objects 

 You can group key-value pairs in objects. Leading spaces have to be same for each attribute in an object

This is a valid format
```
     Employees:
        id: 4
        employeename: Ryan                  
        employeetitle: Marketing Manager
```

In the example given below, you can see that the attribute *employeename* is not indented correctly. This is an invalid yaml format.

```
     Employees:
        id: 4
      employeename: Ryan                  
        employeetitle: Marketing Manager
```

-	Lists

List members are specified with a leading hyphen (-). Each entry is on a new line

*List of simple data types*
```
     Employees:
        -Ryan
        -Jack
```

Lists can also be written in square brackets. The entries are comma-separated 

```
     Employees: [Ryan, Jack]
```

*List of objects* -You can also specify lists of objects in yaml

```
     Employees:
       - id: 4
         employeename: Ryan                  
         employeetitle: Marketing Manager
       - id: 5
         employeename: Jack                  
         employeetitle: Product Manager
```


- Boolean

Booleans can have values True, Yes, On for true and False, No, Off for false

```
     Employees:
       - id: 4
         employeename: Ryan                  
         employeetitle: Marketing Manager
         onleave: Yes
       - id: 5
         employeename: Jack                  
         employeetitle: Product Manager
         onleave: No
  ```

- YAML supports multiple documents in a stream.
Three hyphens(---) are used to specify the beginning of a new YAML document. You can optionally use three periods (…) to mark the end of a document.
```
---
     Employees:
       - id: 4
         employeename: Ryan                  
         employeetitle: Marketing Manager 
...
---
     Departments:
      - id: 1
        departmentname: Marketing 
...
```





      


