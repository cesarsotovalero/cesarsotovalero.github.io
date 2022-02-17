---
layout: post
title: Encoding, Encryption, Hashing, and Obfuscation in Java
subtitle: From concepts to code
tags: programming
description: The concepts of encoding, encryption, hashing, and obfuscation are often mistakenly confused or taken as similar (which is even worse). Let's clarify this matter and see some Java code examples of practical applications.
keywords: java,data confidentiality,data integrity,data authenticity,cybersecurity
image: ../img/posts/2021/paint_on_wall_cover.jpg
share-img: ../img/posts/2021/paint_on_wall_cover.jpg
show-avatar: false
date: 2021/12/19
author: cesarsotovalero
published: true
---

The concepts of encoding, encryption, hashing, and obfuscation are at the core of many critical software technologies.
For example, encryption and hashing are the backbones of the blockchain technology that fuels cryptocurrencies, whereas encoding and obfuscation unify and secure the web, respectively.
Unfortunately, these concepts are often mistakenly confused or taken as similar (which is even worse).
I believe that a good software developer today should know not only how they work but also how to use them as tools in practical applications.
In this post, I'll explain the key differences and provide you with hands-on Java code examples that illustrate how to use encoding, encryption, hashing, and obfuscation in practice.

<figure class="jb_picture">
{% responsive_image path: img/posts/2021/paint_on_wall.jpg alt:"It's all about transformations." %}
  <figcaption class="stroke"> 
&#169; It's all about data transformations. Photo taken at <a href="https://goo.gl/maps/vzMt6ScMnddqbowc8">Östermalmstorg metro station</a>.
</figcaption>
</figure>

# Encoding

_Encoding is the process of modifying the representation of data, so it can be more efficiently transmitted or consumed by a different system than the one that created it._
The purpose of encoding is to facilitate the consumption and transmission of data across distinct platforms so that they can reach a consensus for mutual understanding.
For example, [emojis](https://en.wikipedia.org/wiki/Emoji) are encoded as [Unicode](https://en.wikipedia.org/wiki/Unicode) characters so that they can be read and displayed on different devices no matter the operating system.
Note that keeping the security and privacy of the information is not a goal of encoding algorithms.

When encoding, data is transformed using a mechanism that is publicly available.
The process is intended to be reversible so that the same algorithm used for encoding can also be used for decoding.
For example, the [UTF-8](https://sv.wikipedia.org/wiki/UTF-8) character encoding is the standard encoding algorithm for web content today, i.e., it is supported by most browsers. The HTML5 specification encourages authors to use UTF-8. Conformance checkers may advise authors against using legacy encodings, so most text editors and IDEs choose UTF-8 by default for newly-created documents.

## Encoding a String in Java Using Base64

The standard JDK provides the `Base64` class located in the package `java.util`.
`Base64` provide methods for encoding any string to a set of characters in `/A-Za-z0-9+/` regex. 
So, the decoder rejects any characters outside this set.
`Base64` also offers methods to encode and decode URLs safely.

> [Base64](https://en.wikipedia.org/wiki/Base64) encoding schemes are commonly used when there is a need to encode binary data, especially when that data needs to be stored and transferred over media that are designed to deal with text. This encoding helps to ensure that the data remains intact without modification during transport. Base64 is used commonly in a number of applications including email via MIME, as well as storing complex data in XML or JSON.


The following methods allows encoding and decoding a String message to Base64:

{% highlight java linenos %}
public static String encodeToBase64(String message) {
  return Base64.getEncoder().encodeToString(message.getBytes());
}

public static String decodeFromBase64(String encodedMessage) {
  byte[] decodedBytes = Base64.getDecoder().decode(encodedMessage);
  String decodedString = new String(decodedBytes);
  return decodedString;
}
{% endhighlight %}

Here is a corresponding unit test:

{% highlight java linenos %}
@Test
void testBase64EncodingAndDecoding() {
  Assertions.assertEquals("SGVsbG8sIHdvcmxkIQ==", encodeToBase64("Hello, world!"));
  Assertions.assertEquals("Hello, world!", decodeFromBase64("SGVsbG8sIHdvcmxkIQ=="));
}
{% endhighlight %}

Notice that in Base64 encoding, the number of characters in an output-encoded String [must be a multiple of 4](https://stackoverflow.com/questions/4080988/why-does-base64-encoding-require-padding-if-the-input-length-is-not-divisible-by/18518605#18518605).
The encoder adds one or two padding characters (`=`) at the end of the output as needed in order to meet this requirement. It is worth mentioning that `Base64` can also generate [MIME](https://en.wikipedia.org/wiki/MIME) friendly encoding from strings.

# Encrypting

_Encrypting is the process of transforming data into a representation that cannot be understood without a particular key._
The focus of encryption is safeguarding confidentiality and authenticity by ensuring that the data cannot be consumed by anyone other than the intended recipient.
Encrypting algorithms rely on mathematical principles and cryptography to ensure security.
Encryption algorithms are everywhere.
For example, we use some encryption algorithm every time we send a password over the internet.

Typical encryption algorithms, such as [RSA](https://en.wikipedia.org/wiki/RSA_(cryptosystem)), are based on a public key and a private key (i.e., two different, mathematically linked keys).
These are known as asymmetric cryptography algorithms.
The original message is encrypted by the algorithm using a public key, and then the encrypted message can only be decrypted using the private key.
The public key is shared publicly, while a private key is secret and must not be shared with anyone.

## Encrypting a String in Java Using RSA

The `java.security` package provide a strong API to [several algorithms](https://docs.oracle.com/javase/9/docs/specs/security/standard-names.html) for basic encrypting tasks. 
The first step to use RSA for encryption is generating a key pair.
We can easily do it by using the `KeyPairGenerator` class.

The following code generates public and private key with a size of 2048 bits and stores them in the file system:

{% highlight java linenos %}
public static void createRSAKeys(File publicKeyFile, File privateKeyFile) throws Exception {
  KeyPairGenerator generator = KeyPairGenerator.getInstance("RSA");
  generator.initialize(2048);
  KeyPair pair = generator.generateKeyPair();
  try (FileOutputStream fos = new FileOutputStream(publicKeyFile)) {
    fos.write(pair.getPublic().getEncoded());
  }
  try (FileOutputStream fos = new FileOutputStream(privateKeyFile)) {
    fos.write(pair.getPrivate().getEncoded());
  }
}
{% endhighlight %}

To read each key from a file, we'll first need to load the content as a byte array and then use a `KeyFactory` to recreate the actual instances:

{% highlight java linenos %}
private static PublicKey readRSAPublicKey(File keyFile) throws Exception {
  byte[] publicKeyBytes = Files.readAllBytes(keyFile.toPath());
  KeyFactory keyFactory = KeyFactory.getInstance("RSA");
  EncodedKeySpec publicKeySpec = new X509EncodedKeySpec(publicKeyBytes);
  return keyFactory.generatePublic(publicKeySpec);
}

private static PrivateKey readRSAPrivateKey(File keyFile) throws Exception {
  byte[] privateKeyBytes = Files.readAllBytes(keyFile.toPath());
  KeyFactory keyFactory = KeyFactory.getInstance("RSA");
  EncodedKeySpec privateKeySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
  return keyFactory.generatePrivate(privateKeySpec);
} 
{% endhighlight %}

To encrypt a string message, we'll need a `Cipher` object initialized for encryption with the public key that we generated previously. Invoking the `doFinal` method encrypts our message. Note that it accepts only byte array arguments, so we need to encode our string to Base64, which facilitates its further storage in a database or the exposition of the secured message via REST API:

{% highlight java linenos %}
public static String encryptMessage(String secretMessage, File publicKeyFile) throws Exception {
  Cipher encryptCipher = Cipher.getInstance("RSA");
  encryptCipher.init(Cipher.ENCRYPT_MODE, readRSAPublicKey(publicKeyFile));
  byte[] secretMessageBytes = secretMessage.getBytes(StandardCharsets.UTF_8);
  byte[] encryptedMessageBytes = encryptCipher.doFinal(secretMessageBytes);
  return Base64.getEncoder().encodeToString(encryptedMessageBytes);
}
{% endhighlight %}

Now, let's see how we can decrypt the message to its original form. 
For this, we initialize a Cipher object with a decryption mode and the previously generated private key:

{% highlight java linenos %}
public static String decryptMessage(String encryptedMessage, File privateKeyFile) throws Exception {
  Cipher decryptCipher = Cipher.getInstance("RSA");
  decryptCipher.init(Cipher.DECRYPT_MODE, readRSAPrivateKey(privateKeyFile));
  byte[] decryptedMessageBytes = decryptCipher.doFinal(Base64.getDecoder().decode(encryptedMessage));
  return new String(decryptedMessageBytes, StandardCharsets.UTF_8);
}
{% endhighlight %}

Here is a unit test that verifies if a string message has changed after encryption and then is back to its original after decryption:

{% highlight java linenos %}
@Test
void testRSAEncryptionAndDecryption() throws Exception {
  String message = "The Answer to the Ultimate Question of Life, the Universe, and Everything is 42";
  File publicKeyFile = new File("public.pub");
  File privateKeyFile = new File("private.key");
  createRSAKeys(publicKeyFile, privateKeyFile);
  String encryptedMessage = encryptMessage(message, publicKeyFile);
  String decryptedMessage = decryptMessage(encryptedMessage, privateKeyFile);
  Assertions.assertNotEquals(message, encryptedMessage);
  Assertions.assertEquals(message, decryptedMessage);
} 
{% endhighlight %}


# Hashing

_Hashing is a technique used to validate the integrity of the data by detecting if it has been modified via changes to the hash output._
Thus, hashing serves the purpose of verifying data integrity, i.e. making it so that if something is changed you can know that it was changed.
Different from encryption, a hash is a “one-way” cryptographic function, so hashed data cannot be decrypted back to the original text.

Hashing algorithms map data of any size to a fixed length.
For example, the [SHA-256](https://en.wikipedia.org/wiki/SHA-2) algorithm produces a hash value that is 256 bits, usually represented by a 64 character hexadecimal string.
The premise of a hashing algorithm is simple: given arbitrary input, output a specific number of bytes unique to that input so that will give no indication of what the input was.
The hash function works in a manner that no two hashes for two distinct messages are identical.

In other words:

-  One cannot determine the original data given only the output of a hashing algorithm.
-  Given some arbitrary data along with the output of a hashing algorithm, one can verify whether this data matches the original input data without needing to see the original data.

Hashing is combined with authentication to provide unambiguous proof that a text has not been tampered.
This is achieved by hashing the input and verifying it with the sender's private key.
When the receiver receives the text, it checks the signature of the hash against the sender's public key, then hashes the text itself and matches it against the sender's hash.
If they match, this confirms the authenticity of the user.

## Hashing a String in Java Using SHA3-256

The Java JDK provides the `MessageDigest` class for hashing.
The following method hashes a string message using the `SHA3-256` algorithm. 
Note that the output is an array of bytes, which you need to convert to hexadecimal:

{% highlight java linenos %}
public String hashMessage(String message) throws NoSuchAlgorithmException {
  final MessageDigest digest = MessageDigest.getInstance("SHA3-256");
  final byte[] hashBytes = digest.digest(message.getBytes(StandardCharsets.UTF_8));
  return bytesToHex(hashBytes);
}

private static String bytesToHex(byte[] hash) {
  StringBuilder hexString = new StringBuilder(2 * hash.length);
  for (byte b : hash) {
    String hex = Integer.toHexString(0xff & b);
    if (hex.length() == 1) {
      hexString.append('0');
    }
    hexString.append(hex);
  }
  return hexString.toString();
}
{% endhighlight %}

Here's a unit test:

{% highlight java linenos %}
@Test
void testHashingSHA3_256() throws NoSuchAlgorithmException {
  Assertions.assertEquals("f345a219da005ebe9c1a1eaad97bbf38a10c8473e41d0af7fb617caa0c6aa722", hashMessage("Hello, world!"));
}
{% endhighlight %}

# Obfuscation

_Obfuscation is the process of transforming human-readable data into a form of data with the same properties that is nearly impossible to comprehend._
The most common purpose of obfuscation is to make text harder to understand, usually to make it more difficult to attack or to copy.
Obfuscation is also used for data compression purposes.

Similar to encoding, obfuscation does not provide any security guarantee.
Although not suitable to guarantee confidentiality, obfuscation has some valid use cases.
For example, it is used heavily to prevent from data tampering and protect intellectual property.
One common use is obfuscation of source code so that it’s harder to copy certain software functionalities, making the resulting code non-human friendly.
Obfuscation of source code is a common use case since it makes reverse engineering of a product more difficult.
However, obfuscation only makes it difficult for someone to read the obfuscated code, not impossible.
Many tools exist that assist in de-obfuscating application code.

It’s important to note that obfuscation is not a robust control mechanism (like properly employed encryption) but rather an obstacle.
The obfuscated text, like encoding, can often be reversed by using the same technique that obfuscated it.
Other times it is simply a manual process that takes time to work through.
Another key thing to realize about obfuscation is that there is a limitation to how obscure the code can become, depending on the content being obfuscated.
If you are obscuring computer code, for example, the limitation is that the result must still be executable by the computer, or else the application will cease to function.

## Obfuscation in Java Using Proguard

Since obfuscation is problem dependent, there is not out-of-the-box Java tool for obfuscating a text.
However, there are many open-source tools for obfuscating code.
We are going to use Proguard to obfuscate the following Java class:

{% highlight java linenos %}
import java.util.*;

public class Example {
  public static void main(String... args) {
    Example ex = new Example();
    ex.go();
  }

  public void go() {
    String[] strings = { "abc", "def", "ijk" };
    for (String s : strings) {
      System.out.println(s);
    }
  }
} 
{% endhighlight %}

Once the class is compiled, we can create a [Proguard](https://github.com/Guardsquare/proguard?__hstc=&__hssc=) configuration file as follows:

{% highlight bash linenos %}
-injars Example.jar
-outjars ExampleOut.jar
-libraryjars <java.home>/lib/rt.jar

-keep public class Example {
    public static void main(java.lang.String[]);
}
{% endhighlight %}

Then, created an `example.jar` file and copy the  `proguard.jar` from the ProGuard lib directory, and ran this command:

```bash
java -jar proguard.jar @myconfig.pro
```

This produces an `ExampleOut.jar` file which contains the same functionality and is obfuscated.

# Summary

Here's what you need to remember:

- Encoding is the process of modifying the representation of data, so it can be more efficiently transmitted or consumed by a different system than the one that created it.
- Encrypting is the process of transforming data into a representation that cannot be understood without a particular key.
- Hashing is a technique used to validate the integrity of the data by detecting if it has been modified via changes to the hash output.
- Obfuscation is the process of transforming human-readable data into a form of data with the same properties that is nearly impossible to comprehend.

# References

- [Hashing vs. Encryption vs. Encoding vs. Obfuscation](https://danielmiessler.com/study/encoding-encryption-hashing-obfuscation)
- [Encoding vs. Encryption vs. Hashing vs. Obfuscation](https://www.linkedin.com/pulse/encoding-vs-encryption-hashing-obfuscation-liban-mohamud)
- [What is Obfuscation?](https://auth0.com/blog/how-secure-are-encryption-hashing-encoding-and-obfuscation/#What-is-Obfuscation)

