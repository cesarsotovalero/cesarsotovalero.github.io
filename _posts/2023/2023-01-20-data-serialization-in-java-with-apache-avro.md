---
layout: post
title: Data Serialization in Java With Apache Avro
subtitle: TODO
tags: AI
description: TODO
keywords:
  - Apache Avro,
  - data engineering,
  - serialization and deserialization,
  - data formats for big data,
image: ../img/posts/2023/TODO.jpg
share-img: ../img/posts/2023/TODO.jpg
show-avatar: false
toc: true
date: 2023/01/20
author: cesarsotovalero
published: false
---

When working with data processing in Java, choosing the right file format for storing datasets is crucial.
Each format (such as CSV, JSON, or Parquet) has its particular advantages and is designed for specific use cases. 
In this blog post I'll focus on Apache Avro, a powerful data serialization framework widely used for streaming binary files. 
Let's explore explore the benefits of using Avro in our Java applications.

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/subway_in_red.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; TODO. Photo of a painting in <a href="https://goo.gl/maps/cGN5k72vforbXD2T6">ABF Stockholm</a>.
  </figcaption>
</figure>

# Introduction

In data processing, selecting the appropriate file format is essential to ensure efficient storage and processing of datasets. 
Different formats excel in specific use cases, such as Business Intelligence, network communication, web applications, batch processing, or stream processing. 
Understanding their strengths and leveraging their specific features is vital in making an informed decision.


| **Data** |      **Format**      | **Data type** |  **Schema enforcement**  | **Schema evolution** | **Storage type** | **OLAP/OLTP** |      **Splittable**       | **Stream** | **Typed data** |            **Ecosystems**             |
|----------|:--------------------:|:-------------:|:------------------------:|:--------------------:|:----------------:|:-------------:|:-------------------------:|:----------:|:--------------:|:-------------------------------------:|
| CSV      |         text         |      no       | no (minimal with header) |          no          |       row        |     OLTP      | yes in its simpliest form |    yes     |       no       | popular everywhere for its simplicity |
| JSON     |         text         |      yes      | external for validation  |         yes          |       row        |     OLTP      |    yes with JSON lines    |    yes     |       no       |              API and web              |
| XML      |         text         |      no       | external for validation  |         yes          |       row        |     OLTP      |            no             |     no     |       no       |              enterprise               |
| Protobuf |    data in binary    |      yes      |           yes            |          no          |       row        |     OLTP      |            no             |    yes     |      yes       |          RPC and Kubernetes           |
| Parquet  |         text         |      yes      |           yes            |         yes          |      column      |     OLAP      |            yes            |     no     |       no       |            Big Data and BI            |
| ORC      |        binary        |      yes      |           yes            |          no          |      column      |     OLAP      |            yes            |     no     |       no       |            Big Data and BI            |
| **AVRO** | **metadata in JSON** |    **yes**    |         **yes**          |       **yes**        |     **row**      |   **OLTP**    |          **yes**          |  **yes**   |     **no**     |      **Big Data and Streaming**       |


# Why using Apache Avro?

[Apache Avro](https://avro.apache.org/) is a data serialization system that provides rich data structures in a compact, fast, binary data format. It is used in Apache Spark, Apache Kafka, Apache Hadoop, and many other big data tools.
Avro is a row-based format that is suitable for evolving data schemas. It is schema-based and allows you to define a schema for your data using JSON. The schema is then compiled into Java classes that you can use to read and write Avro data.

Here are some advantages of using Apache Avro instead of other data file formats:
 
- **Schema Enforcement:** Avro provides robust schema enforcement capabilities, ensuring data validity and facilitating seamless data integration and processing. Schemas can be associated with the data or provided separately, guaranteeing that the dataset adheres to the specified schema and giving additional information about its structure, types, and formats. Avro's schema enforcement plays a vital role in binary file formats by enabling encryption and decryption of content, enhancing data security and integrity during storage and transmission. With Apache Avro, developers can confidently work with data, knowing that it aligns with the defined schema and can be accurately interpreted by consumers, thereby improving data reliability, interoperability, and processing efficiency.

- **Schema Evolution:** Avro supports schema evolution, which allows you to evolve your data schemas over time while maintaining backward compatibility. You can add, remove, or modify fields in your schema without requiring all consumers or producers to be updated simultaneously. This flexibility is especially useful in scenarios where different components of a system are developed and deployed independently.

- **Compact Binary Format:** Avro uses a compact binary encoding, which results in smaller file sizes compared to other formats like JSON or XML. This makes Avro an efficient choice for data storage and transmission, reducing storage costs and improving performance.

- **Fast Serialization and Deserialization:** Avro's binary encoding is designed for efficient serialization and deserialization. It has a smaller memory footprint and faster processing speed compared to text-based formats. This makes it suitable for high-throughput data processing and streaming applications.

- **Language Independence:** Avro provides support for multiple programming languages, allowing you to work with Avro data in different languages seamlessly. Avro schemas can be defined using JSON, and Avro provides code generation utilities to generate language-specific classes from the schema. This makes it easy to integrate Avro into existing systems regardless of the programming language being used.

- **Data Compression:** Avro supports built-in compression for its data files, which can further reduce the file sizes. You can choose from different compression codecs such as Snappy, Deflate, or Bzip2, depending on your specific requirements. This feature is particularly beneficial when working with large datasets or when network bandwidth is limited.

- **Rich Data Types:** Avro supports a wide range of data types, including primitive types, complex types (arrays, maps, records), and even user-defined types. This flexibility allows you to represent complex data structures accurately, making Avro suitable for modeling diverse datasets.

- **Interoperability:** Avro is designed for interoperability, enabling data exchange between different systems and platforms. Avro data files can be easily read and processed by systems implemented in different languages, making it a versatile choice for distributed architectures and data integration scenarios.

Overall, Apache Avro provides a combination of schema evolution, compactness, performance, language independence, and interoperability, making it a powerful data serialization and storage solution for a wide range of use cases.

# Creating the Avro schema 

Here's an example of an Avro schema file with various data types:

```json
{
  "type": "record",
  "name": "Person",
  "fields": [
    { "name": "id", "type": "int" },
    { "name": "name", "type": "string" },
    { "name": "age", "type": "int" },
    { "name": "height", "type": "float" },
    { "name": "isEmployed", "type": "boolean" },
    { "name": "address", "type": "string" },
    { "name": "phoneNumbers", "type": {
      "type": "array",
      "items": "string"
    }},
    { "name": "salary", "type": ["null", "float"], "default": null },
    { "name": "birthDate", "type": {
      "type": "record",
      "name": "Date",
      "fields": [
        { "name": "year", "type": "int" },
        { "name": "month", "type": "int" },
        { "name": "day", "type": "int" }
      ]
    }},
    { "name": "skills", "type": {
      "type": "map",
      "values": "string"
    }}
  ]
}
```

In this example, the Avro schema represents a `Person` record with the following fields:

- `id` (integer): Represents the unique identifier for a person.
- `name` (string): Represents the person's name.
- `age` (integer): Represents the person's age.
- `height` (float): Represents the person's height.
- `isEmployed` (boolean): Represents whether the person is currently employed or not.
- `address` (string): Represents the person's address.
- `phoneNumbers` (array of strings): Represents the person's phone numbers.
- `salary` (nullable float): Represents the person's salary, which can be null.
- `birthDate` (nested record): Represents the person's birth date, consisting of year, month, and day fields.
- `skills` (map of strings): Represents the person's skills, where the keys are skill names and the values are skill levels.

This example covers various Avro data types, including primitive types (`int`, `float`, `string`, `boolean`), complex types (`array`, `record`, `map`), and nullable types using the union type (`["null", "float"]`).

# Using the schema to generate Java classes

Add the following dependency in the `pom.xml` file:

```xml
<dependency>
  <groupId>org.apache.avro</groupId>
  <artifactId>avro</artifactId>
  <version>1.11.1</version>
</dependency>
```

As well as the Avro Maven plugin (for performing code generation):

```xml
<plugin>
  <groupId>org.apache.avro</groupId>
  <artifactId>avro-maven-plugin</artifactId>
  <version>1.11.1</version>
  <executions>
    <execution>
      <phase>generate-sources</phase>
      <goals>
        <goal>schema</goal>
      </goals>
      <configuration>
        <sourceDirectory>${project.basedir}/src/main/avro/</sourceDirectory>
        <outputDirectory>${project.basedir}/src/main/java/</outputDirectory>
      </configuration>
    </execution>
  </executions>
</plugin>
```

After running the plugin, the following Java classes will be generated: `Person.java` and `Date.java`.

The following figure shows the class diagram for the `Person` class:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-01-20/Person.png alt:"TODO" %}
  <figcaption class="stroke"> 
    TODO
  </figcaption>
</figure>

The `Person` class contains the following auto-generated class members:

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-01-20/Person-Builder.png alt:"TODO" %}
  <figcaption class="stroke"> 
    TODO
  </figcaption>
</figure>


# Serializing and deserializing objects based on the schema

Here's what we need to do to serialize and deserialize a list of `Person` objects using Avro:

```java
public static void main(String[] args) throws IOException {

  List<Person> personList = List.of(
    new Person(1, "John", 25, 175.5f, true, "123 Main St", List.of("555-1111", "555-2222"), null, new Date(1998, 6, 15), Map.of("programming", "Java", "design", "Photoshop")),
    new Person(2, "Alice", 30, 160.0f, false, "456 Elm St", List.of("555-3333"), 5000.0f, new Date(1993, 9, 21), Map.of("writing", "Copywriting", "marketing", "SEO")),
    new Person(3, "Bob", 40, 185.3f, true, "789 Oak St", List.of("555-4444", "555-5555", "555-6666"), 8000.0f, new Date(1983, 3, 8), Map.of("programming", "Python", "data analysis", "SQL"))
  );

  // Serialize persons to disk
  File personsListSerializedFile = new File("persons.avro");
  serializePersons(personList, personsListSerializedFile);

  // Deserialize persons from disk
  deserializePersons(personsListSerializedFile).stream().map(Person::toString).forEach(System.out::println);
}
```

Here's the method for serializing:

```java
/**
 * Serialize a list of Persons to disk using Avro and write to the specified file (.avro).
 * @param personList                 List of Persons
 * @param personListSerializedFile   File to write to
 * @throws IOException              If there is an error writing to the file
 */
private static void serializePersons(List<Person> personList, File personListSerializedFile) throws IOException {
  // We create a DatumWriter, which converts Java objects into an in-memory serialized format.
  // The SpecificDatumWriter class is used with generated classes and extracts the schema from the specified generated type.
  DatumWriter<Person> datumWriter = new SpecificDatumWriter<>(Person.class);
  // Next we create a DataFileWriter, which writes the serialized records, as well as the schema, to the file specified in the dataFileWriter.create call.
  // We write our persons to the file via calls to the dataFileWriter.append method. When we are done writing, we close the data file.
  DataFileWriter<Person> dataFileWriter = new DataFileWriter<>(datumWriter);
  dataFileWriter.create(personList.get(0).getSchema(), personListSerializedFile);
  personList.forEach(person -> {
    try {
      dataFileWriter.append(person);
    } catch (IOException e) {
      System.err.println("Error writing person with id: " + person.getId());
    }
  });
  dataFileWriter.close();
}

```
Here's the method for deserializing:

```java
/**
 * Deserialize a list of Person objects from disk using Avro.
 * @param personListSerializedFile   File to read from (.avro)
 * @return                          List of Person
 * @throws IOException              If there is an error reading from the file
 */
private static List<Person> deserializePersons(File personListSerializedFile) throws IOException {
  DatumReader<Person> personDatumReader = new SpecificDatumReader<>(Person.class);
  DataFileReader<Person> dataFileReader = new DataFileReader<>(personListSerializedFile, personDatumReader);
  
  Person person = null;
  List<Person> persons = new ArrayList<>();
  
  while (dataFileReader.hasNext()) {
    // Reuse person object by passing it to next(). This saves us from allocating and garbage collecting many objects
    // for files with many items.
    person = dataFileReader.next(person);
    persons.add(person);
  }
  
  dataFileReader.close();
  return persons;
}
```

# Conclusion

When it comes to data serialization in Java, Apache Avro offers compelling advantages.
Its support for schema evolution, compact binary format, fast serialization/deserialization, language independence, and interoperability make it a valuable tool for storing and processing data efficiently. By leveraging the benefits of Apache Avro, developers can streamline their data processing workflows and improve overall system performance.


# Resources

- <i class="fab fa-github"></i> [Avro examples](https://github.com/apache/avro/tree/master/doc/examples)
- [:earth_americas: Apache Avro official documentation](https://avro.apache.org/docs/)
- [:earth_americas: Guide to Apache Avro](https://www.baeldung.com/java-apache-avro)
- [:earth_americas: Guide to Spring Cloud Stream with Kafka, Apache Avro and Confluent Schema Registry](https://www.baeldung.com/spring-cloud-stream-kafka-avro-confluent)
- 

# Further Reading

- [CSV vs Parquet vs Avro: Choosing the Right Tool for the Right Job](https://medium.com/ssense-tech/csv-vs-parquet-vs-avro-choosing-the-right-tool-for-the-right-job-79c9f56914a8)
- [Big Data File Formats](https://blog.clairvoyantsoft.com/big-data-file-formats-3fb659903271)
- [Comparaison of different file formats in Big Data](https://www.adaltas.com/en/2020/07/23/benchmark-study-of-different-file-format/)

# Footnotes
