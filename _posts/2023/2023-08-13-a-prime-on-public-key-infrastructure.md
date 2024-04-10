---
layout: post
title: A Prime on Public Key Infrastructure
subtitle: How do we trust each other in the digital era?
tags: security
description: |
  This article delves into symmetric and asymmetric encryption, as the building blocks of Public Key Infrastructure (PKI). It describes how PKI allows safeguarding the authenticity and security of digital communications across the internet. 
keywords:
  - cybersecurity,
  - symmetric encryption,
  - asymmetric encryption,
  - public key infrastructure,
  - java,
  - web of trust
image: ../img/posts/2023/2023-08-13/dark_well-cover.jpg
share-img: ../img/posts/2023/2023-08-13/dark_well-cover.jpg
show-avatar: false
toc: true
mathjax: true
date: 2023/08/13
author: cesarsotovalero
published: true
---

The whole internet is secured by the power of symmetric and asymmetric cryptography.
Each time you visit a website, a **cryptographic handshake** occurs between your browser and a web server located somewhere on Earth.
The authenticity of this connection is verified by a technology known as **P**ublic **K**ey **I**nfrastructure (PKI).
This framework is crucial for ensuring secure electronic information transfer between digital entities.
PKI is integral to most confidential network activities, including e-commerce, internet banking, and email.
It is particularly useful when simple passwords are inadequate for user authentication, necessitating stronger **proof of identity**.
At its core, PKI binds public keys to the identities of entities such as individuals and organizations.
This is done through a process of registration, signing, and issuance of **digital certificates**.
These certificates are provided by a Certificate Authority (CA) responsible for ensuring the trustworthiness of the binding.
In this article, I will delve into the practical aspects of symmetric and asymmetric encryption.
Later I'll focus on the role of PKI, and how it helps to safeguard the authenticity and security of digital transactions and communications across the internet.
Let's dive in!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-13/dark_well.jpg alt: "A dark pool" %}
  <figcaption class="stroke"> 
    &#169; The internet is a chthonic pool. Don't jump in without your keys! Photo of a piece of art in the <a href="https://maps.app.goo.gl/75AGyCg5QpzjQeFR8">Stockholm's Paradox Museum</a>.
  </figcaption>
</figure>

# The Problem of Digital Trust

Since ancient times, the quest for secure communication has been a constant human endeavor.
In general, two fundamental challenges need to be addressed in order to safeguard any kind of communication channel:

1. **Confidentiality:** Ensuring that only the intended recipient can "understand" the message.
2. **Integrity:** Guaranteeing that the message remains unaltered by any third parties during its transmission.

In today's digital era, these challenges are magnified due to the speed and scale at which information is sent and received.
The internet demands not only lightning-fast communication channels but also, often, interactions between parties who have never met and may not inherently trust each other.

This raises a fundamental question:

🤔 _How to build and maintain trustful communication channels on a global scale?_

To answer this question, we need to look at how the internet has been built.
At its core, digital data transfer channels rely on mathematical concepts regarding data encryption.
In particular, the concept of **cryptography** is fundamental to understanding the mechanisms and technologies that are pivotal for scaling digital trust worldwide.

# Cryptography

[Cryptography](https://en.wikipedia.org/wiki/Cryptography) is about building tools and techniques to enable secure communication in the presence of adversarial behaviors.
More specifically, cryptography relies on mathematical proofs to protect aspects of information security.
For example, cryptography allows for achieving confidentiality, integrity, user authentication, and data origin validation.

All of this may sound complicated, but fortunately, we only need to know about two cryptographical techniques: **symmetric** and **asymmetric** encryption.

## Symmetric Encryption

[//]: # (------ What it is ---------------------------------------------------------------------)

<aside class="quote">
    <em>“Encoding is about efficiently modifying the representation of data without bringing any guarantee of privacy or security. I wrote about it <a href="../blog/encoding-encryption-hashing-and-obfuscation-in-java.html#encoding">here</a>.”</em> 
</aside>

Before 1976, the only known way to encrypt messages was using [symmetric encryption](https://en.wikipedia.org/wiki/Symmetric-key_algorithm).
This is a mechanism to encode messages where both the sender and receiver use the **same secret key**.[^2]


> "The fundamental property of symmetric encryption is that the same key is used for both encryption and decryption. In other words, by knowing the key and the encryption method, one can decrypt or decrypt the message."

<aside class="quote">
    <em>“The Caesar cipher method is easy to break because with only 26 different possible shifts it can be solved with simple brute force and letter frequency analysis.”</em> 
</aside>

The most famous example is perhaps the [Caesar cipher algorithm](https://en.wikipedia.org/wiki/Caesar_cipher).
The basic idea is to shift each letter in the plaintext (the original message) by a certain number of places down or up the alphabet.
For example, if the key is "`3`", then the letters of the alphabet are shifted to three positions.
In this case, the letter "`A`" would be encoded as "`D`", "`B`" would be "`E`", and so on.
To decrypt the message, the recipient only needs to shift the letters back by the same number of positions as used for encryption.

[//]: # (------ How it works graphically -------------------------------------------------------------------)

The following figure illustrates how symmetric encryption works:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
U1(["👩 Alice"]) --> |"📒 Plaintext"| E["⚙️ Encryption Process"]
U1["👩 Alice"] --> |"🔑 KEY"| E["⚙️ Encryption Process"]
E --> C["🔒 Ciphertext"]
U2(["👨 Bob"]) --> |"🔒 Ciphertext"| D["⚙️ Decryption Process"]
U2(["👨 Bob"]) --> |"🔑 KEY"| D["⚙️ Decryption Process"]
D --> P["📒 Plaintext"]
{% endmermaid %}

In the figure above, Alice encrypts a message before sending it to Bob.
The `KEY` node represents the symmetric key.
Note that arrows are drawn from this node to both the encryption and decryption processes so that the same key is used in both steps.
It is also important for both Alice and Bob to know exactly how the encryption/decryption process works (i.e., the algorithm used).

[//]: # (------ How it works mathematically -------------------------------------------------------------------)

Symmetric encryption can be formalized mathematically using encryption ($$E$$) and decryption ($$D$$) functions.

Let's denote:

- $$E$$ as the encryption function,
- $$D$$ as the decryption function,
- $$k$$ as the symmetric key,
- $$M$$ as the plaintext message, and
- $$C$$ as the ciphertext (encrypted message).

Then, symmetric encryption and decryption can be represented as follows:

1. **Encryption**: To encrypt a plaintext message $$M$$ using the symmetric key $$k$$, the encryption function $$E$$ is applied to both $$M$$ and $$k$$. Mathematically, this is represented as: $$C = E_k(M)$$

2. **Decryption**: To decrypt the ciphertext $$C$$ using the same symmetric key $$k$$, the decryption function $$D$$ is applied to both $$C$$ and $$k$$. This is represented as: $$M = D_k(C)$$


[//]: # (------ How it works in code -------------------------------------------------------------------)

<aside class="quote">
    <em>“The SSL/TLS protocol is used to secure internet communications, ensuring data privacy and integrity between two communicating computers, like a web browser and a server.”</em> 
</aside>

If you prefer code, here's a simple example of a Java class `SymmetricEncryptionExample` that illustrates symmetric encryption using the [Advanced Encryption Standard](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard) (AES) algorithm.
AES is commonly used to secure data transmitted through the SSL/TLS protocol.
The class relies on the `javax.crypto` package.
It uses `KeyGenerator` to create a secret key.
The key is used to encrypt the `originalText` string, and then decrypt it back.
Note that the `Base64` encoding and decoding method is used to handle the byte array conversion for the encrypted text.

{% highlight java linenos %}
public class SymmetricEncryptionExampleWithAES {
  public static void main(String[] args) throws Exception {
    // Generate a symmetric key
    KeyGenerator keyGenerator = KeyGenerator.getInstance("AES");
    keyGenerator.init(128); // Key size
    SecretKey secretKey = keyGenerator.generateKey();
    String originalText = "Hello, this is a secret message!";
    System.out.println("Original Text: " + originalText);
    // Encrypt the text
    String encryptedText = encrypt(originalText, secretKey);
    System.out.println("Encrypted Text: " + encryptedText);
    // Decrypt the text
    String decryptedText = decrypt(encryptedText, secretKey);
    System.out.println("Decrypted Text: " + decryptedText);
  }

  /**
   * Encrypts the plainText via AES using the secret key.
   */
  public static String encrypt(String plainText, SecretKey secretKey) throws Exception {
    Cipher cipher = Cipher.getInstance("AES");
    cipher.init(Cipher.ENCRYPT_MODE, secretKey);
    byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
    return Base64.getEncoder().encodeToString(encryptedBytes);
  }

  /**
   * Decrypts the encrypted text via AES using the provided secret key.
   */
  public static String decrypt(String encryptedText, SecretKey secretKey) throws Exception {
    Cipher cipher = Cipher.getInstance("AES");
    cipher.init(Cipher.DECRYPT_MODE, secretKey);
    byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
    return new String(decryptedBytes);
  }
}
{% endhighlight %}

 

[//]: # (------ How it works in practice -------------------------------------------------------------------)

The main benefit of symmetric encryption is that it is **fast and efficient**.
By fast I mean, for example, that encrypting a file of one Gigabyte using AES takes less than a second on a personal computer.

However, the speed of symmetric encryption comes with the following drawbacks:

- The same key is used by the sender and receiver.
- Confidentiality and integrity are guaranteed, but only if the key is not compromised.
- Availability is a problem since establishing trust (key distribution) is complicated.

The introduction of **asymmetric encryption** was a significant advance in cryptography, as it allowed solving the key distribution problem.
Thus, establishing a mechanism for securely sharing the secret key.

## Asymmetric Encryption

[//]: # (------ What it is ---------------------------------------------------------------------)

In 1976, Whitfield Diffie and Martin Hellman proposed a revolutionary method to encrypt messages.[^1]
Their system pushed forward the field of cryptography by allowing users to communicate securely without having to agree on a shared secret key.
The system is known as "public-key cryptography" or "asymmetric encryption," and it is the foundation of how the internet is secured today.

> "The most important property of asymmetric encryption is that the decryption key (a.k.a. _private key_) cannot be feasibly derived from the encryption key (a.k.a. _public key_), even though they are mathematically related. This allows the public key to be shared openly, while the owner must keep the private key secret."

[//]: # (------ How it works graphically -------------------------------------------------------------------)

Here's a graphical representation of how asymmetric encryption works:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;

U1(["👩 Alice"]) --> |"📒 Plaintext"| E["⚙️ Encryption Process"]
U1["👩 Alice"] --> |"🔑 Bob's PUBLIC KEY"| E["⚙️ Encryption Process"]
E --> C["🔒 Ciphertext"]

U2(["👨 Bob"]) --> |"🔒 Ciphertext"| D["⚙️ Decryption Process"]
U2(["👨 Bob"]) --> |"🔐 Bob's PRIVATE KEY"| D["⚙️ Decryption Process"]
D --> P["📒 Plaintext"]
{% endmermaid %}

In the diagram above, Alice encrypts a message using Bob's **public key**.
The encrypted message can be then sent to Bob.
Bob decrypts the message using his **private key**.
Note that the public key is available to everyone (including Alice), while the private key is only known to Bob.
So only Bob (with his private key) can decrypt the message.

[//]: # (------ How it works mathematically -------------------------------------------------------------------)

Asymmetric encryption can be formalized mathematically using encryption and decryption functions similar to symmetric encryption, but with the distinction that it uses two different keys.

Let's denote:

- $$ E $$ as the encryption function,
- $$ D $$ as the decryption function,
- $$ k_{pub} $$ as the public key,
- $$ k_{priv} $$ as the private key,
- $$ M $$ as the plaintext message,
- $$ C $$ as the ciphertext (encrypted message).

The process then involves the following steps:

1. **Encryption**: To encrypt a plaintext message $$ M $$ using the public key $$ k_{pub} $$, the encryption function $$ E $$ is applied. Mathematically, this is represented as: $$ C = E_{k_{pub}}(M) $$

2. **Decryption**: To decrypt the ciphertext $$ C $$ using the private key $$ k_{priv} $$, the decryption function $$ D $$ is applied. This is represented as: $$ M = D_{k_{priv}}(C) $$

Asymmetric encryption algorithms are based on the computational complexity of "hard" problems from number theory.
Because of the difficulty of the underlying problems, most asymmetric algorithms involve operations such as modular multiplication and exponentiation, which are much more computationally expensive than the techniques used in most block ciphers, especially with typical key sizes.

The following table shows examples of algorithms based on three mathematical problems that are hard to reverse.

| Problem                    | Algorithm | Description                                                                                                                                                                                                                                                                             |
|----------------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Integer Factorization      | RSA       | RSA ([Rivest–Shamir–Adleman](https://sv.wikipedia.org/wiki/RSA)) is based on the difficulty of [factoring large integers](https://en.wikipedia.org/wiki/Integer_factorization) into prime values.                                                                                       |
| Discrete Logarithm Problem | DSA       | DSA ([Digital Signature Algorithm](https://en.wikipedia.org/wiki/Digital_Signature_Algorithm)) relies on the hardness of [solving discrete logarithms](https://en.wikipedia.org/wiki/Discrete_logarithm) in a finite field.                                                             |
| Elliptic Curve             | ECIES     | ECIES ([Elliptic Curve Integrated Encryption Scheme](https://en.wikipedia.org/wiki/Integrated_Encryption_Scheme#Formal_description_of_ECIES)) is based on the complexity of the [elliptic curve](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) discrete logarithm problem. |


[//]: # (------ How it works in code -------------------------------------------------------------------)

Now, let's see how asymmetric encryption can be implemented in practice by looking at some Java code.
The following example uses the RSA algorithm for encryption and decryption.
Note that the `KeyPairGenerator` class is used to generate a pair of public and private keys.
The `Cipher` class is used to encrypt and decrypt the text, and the `Base64` encoding and decoding method is used to handle the byte array conversion for the encrypted text.

{% highlight java linenos %}
public class AsymmetricEncryptionExampleWithRSA {
  public static void main(String[] args) throws Exception {
    // Generate RSA key pair
    KeyPairGenerator keyGen = KeyPairGenerator.getInstance("RSA");
    keyGen.initialize(2048);
    KeyPair pair = keyGen.generateKeyPair();
    PrivateKey privateKey = pair.getPrivate();
    System.out.println("Private Key: " + Base64.getEncoder().encodeToString(privateKey.getEncoded()));
    PublicKey publicKey = pair.getPublic();
    System.out.println("Public Key: " + Base64.getEncoder().encodeToString(publicKey.getEncoded()));
    String originalText = "Hello, this is a secret message!";
    System.out.println("Original Text: " + originalText);
    // Encrypt the text
    String encryptedText = encrypt(originalText, publicKey);
    System.out.println("Encrypted Text: " + encryptedText);
    // Decrypt the text
    String decryptedText = decrypt(encryptedText, privateKey);
    System.out.println("Decrypted Text: " + decryptedText);
  }

  /**
   * Encrypt text using the public key.
   */
  public static String encrypt(String plainText, PublicKey publicKey) throws Exception {
    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    cipher.init(Cipher.ENCRYPT_MODE, publicKey);
    byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
    return Base64.getEncoder().encodeToString(encryptedBytes);
  }

  /**
   * Decrypt text using the private key.
   */
  public static String decrypt(String encryptedText, PrivateKey privateKey) throws Exception {
    Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
    cipher.init(Cipher.DECRYPT_MODE, privateKey);
    byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
    return new String(decryptedBytes);
  }
}
{% endhighlight %}

[//]: # (------ How it works in practice -------------------------------------------------------------------)

<aside class="quote">
    <em>“Asymmetric encryption is slower and (arguably) less secure than symmetric encryption, but it solves the key distribution problem.”</em> 
</aside>

In real-world scenarios, encrypting large files (like one Gigabyte or so) directly with an asymmetric encryption algorithm like RSA is impractical due to its slow speed.
Instead, these types of algorithms are used to encrypt a small piece of data, such as the "secret key" used in symmetric encryption.
This difference in speed is the principal reason why asymmetric encryption is typically reserved for specific tasks, like safely exchanging keys, not for encrypting lots of data.

As a result, cryptosystems in practice are mostly hybrid.
In such a case, a fast high-quality symmetric key encryption algorithm is used for the message itself, while the relevant symmetric key is sent with the message, but encrypted using an asymmetric algorithm.

So, we often use a mix of both methods, called hybrid cryptosystems.
Here, a fast symmetric encryption algorithm secures the actual message, while the symmetric key, needed to read the message, is sent along with the message, but encrypted with an asymmetric algorithm.

Simply using a pair of keys to encrypt/decrypt some piece of data does not guarantee that the information came from a specific user.
Ultimately, the pair of keys used are not tied to a person or a system.
To solve this problem, an infrastructure is required in order to bind these two aspects together.
This idea paves the way for the concept of **Public Key Infrastructure (PKI)**, which ties symmetric and asymmetric encryption together in a trusted framework for secure and verifiable communications.

# Public Key Infrastructure (PKI)

PKI effectively resolves the issue of authenticating public keys.
It employs a network of trusted entities, each with specific roles, to manage **certificates** and **digital signatures**.
These responsibilities encompass the creation, storage, dissemination, and revocation of certificates.

PKI facilitates the authentication process, allowing an entity to prove its identity to a service.
For instance, a user can submit their public key to a Certificate Authority (CA).
This can be done through a secure process, such as visiting a CA office in person.
The CA then issues a certificate that links the user's identity with their public key.

This system ensures that any public key or certificate disseminated over the internet is reliably associated with a particular individual or entity.
Such a mechanism enhances security, making it difficult for imposters to masquerade as legitimate users, thereby bolstering the trustworthiness and integrity of online communications and transactions.

A user's public key is distributed via a digital certificate, which is a key part of the PKI.
Digital certificates, issued by Certificate Authorities (CAs) within the PKI, bind a public key to an entity (like a person or organization).
They verify the ownership of the public key, ensuring that when you encrypt something with a public key, the intended recipient (and only they) can decrypt it with their private key.
PKI provides a framework of trust for these certificates, establishing the authenticity of public keys for secure communications and transactions.

Here's a diagram that illustrates how PKI works:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
a(["👩 Alice"]) --> b["⚙️Key Generation Process"]
b --> |"🔑 PUBLIC KEY"| x(["🏠 Certificate Authority (CA)"])
b --> |"🔐 PRIVATE KEY"| s["⚙️Signing Process"]
a --> |"📒 Data"| s
s --> |"💾 Signed Data"| c(["👨 Bob"])
x --> |"📝 Certificate"| c
{% endmermaid %}

In the previous diagram, Alice initiates the process by generating a pair of public and private keys.
Then, she sends her public key to the Certificate Authority (CA).
The CA then creates a certificate based on Alice's public key.
This certificate effectively binds Alice’s identity to her public key.
Alice also engages in a signing process, where she uses her private key to sign a piece of data.
This signing process is a way to ensure that the data genuinely comes from Alice and has not been tampered with.
Bob receives two key pieces of information: the signed data from Alice (ensuring the data's authenticity and integrity), and the certificate from the CA, which allows Bob to verify that the public key he uses to interact with Alice's data truly belongs to Alice.

As shown before, PKI has the following advantages for both (sender and receiver) parties:

- **Confidentiality**: Their interactions cannot be read by a third-party (due to symmetric encryption).
- **Integrity**: Their interactions cannot be modified by a third-party (due to asymmetric encryption).
- **Availability**: Their interactions cannot be blocked by a third-party (due to the CA).

## Digital Signatures

<aside class="quote">
    <em>“Digital signatures today guarantee that an email, document, or transaction remains exactly as it was when sent, unmodified and secure.”</em> 
</aside>

Digital signatures are an integral part of PKI.
A digital signature is reminiscent of an ordinary signature.
It provides a way to verify the authenticity and integrity of digital messages.
Asymmetric encryption is used to enable this verification.
A digital signature is created using the signer's private key, and it can be verified by anyone who has access to the signer's public key.

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
A(["👩 Alice"]) --> |"📃 Original Message"| B["⚙️ Hashing Algorithm"]
B --> |"🔑 Unique Hash"| C["⚙️ Encrypt with Private Key"]
A --> |"🔐 PRIVATE KEY"| C
C --> |"✒️ Digital Signature"| D["📨 Message + Signature"]
E(["👨 Bob"]) --> |"📨 Received Message + Signature"| F["⚙️ Decrypt with Public Key"]
A --> |"🔑 PUBLIC KEY"| F
F --> |"🔑 Decrypted Hash"| G["⚙️ Hashing Algorithm"]
E --> |"📃 Received Message"| G
G --> |"🔑 Newly Generated Hash"| H["🔄 Compare Hashes"]
F --> H
H --> |"✅ Match: Signature Verified"| I["🔐 Message Authentic and Unaltered"]
H --> |"❌ No Match: Signature Invalid"| J["⚠️ Message Tampered or Wrong Signer"]
{% endmermaid %}

When a digital signature is created, a cryptographic algorithm generates a unique hash of the message.
This hash is then encrypted with the signer's private key.
The resulting encrypted hash, along with the original message, is what constitutes the digital signature.
This process ensures that the signature is uniquely tied to both the message and the signer.

To verify a digital signature, the recipient uses the signer's public key to decrypt the hash.
The recipient also generates a new hash of the received message.
If this newly generated hash matches the decrypted hash, it confirms that the message has not been altered since it was signed and that the signature is valid.

Digital signatures are central to the operation of PKI and many network security schemes (e.g., SSL/TLS, many VPNs, etc.)
RSA and DSA are two of the most popular signing algorithms.
These signatures are crucial in establishing trust and authenticity in digital communications and transactions.

## Digital Certificates

In PKI, [digital certificates](https://en.wikipedia.org/wiki/Public_key_certificate) are digital documents that verify the ownership of a public key by the named subject of the certificate.
These certificates are issued by a trusted authority known as a Certificate Authority (CA).
The primary role of a certificate is to ensure that a public key belongs to the individual, organization, or device it claims to be from, thus enabling secure communication and transactions over the internet.

A digital certificate contains several key pieces of information: the subject's name, the subject's public key, the expiration date of the certificate, the issuer's (CA's) name, and the digital signature of the issuer.
The CA's signature is crucial as it vouches for the authenticity of the certificate.
When a CA issues a certificate, it uses its private key to sign the certificate, thereby linking it securely to the CA.

A digital certificate typically follows a standard format known as X.509. Below is an example of how an X.509 certificate might look in its PEM (Privacy Enhanced Mail) format, which is a Base64 encoded version of the certificate. This format is commonly used in various applications, such as web servers for HTTPS.

```pem
-----BEGIN CERTIFICATE-----
MIIDdzCCAl+gAwIBAgIJAOlIvvj3YxLlMA0GCSqGSIb3DQEBCwUAMFExCzAJBgNV
BAYTAlVTMQswCQYDVQQIDAJDQTESMBAGA1UEBwwJU2FuIERpZWdvMRQwEgYDVQQK
DAtNeSBDb21wYW55MRIwEAYDVQQDDAlteXNpdGUuY29tMB4XDTE5MDYwMTE2MjMw
NVoXDTIwMDUzMTE2MjMwNVowUTELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAkNBMRIw
EAYDVQQHDAlTYW4gRGllZ28xFDASBgNVBAoMC015IENvbXBhbnkxEjAQBgNVBAMM
CW15c2l0ZS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDc0KgG
KuTw+gOl1QJX5f8Kl/VLkxR+p+eGjvY6gIUK+5awtc2RStScz5Xegp+AbSxa2WDV
WzV/MPR3xjT+miyRugPFcwl8oEPlOeHJDDydUfVQK3C3WlR3RLlTjSgC7WyHx+3u
Scch5aIsSlhYf6vMfhyis5w4a2PAVkwpLLqCslcK9vv+2ZCpCijL6+zF4D9xW1rn
2mUNuVHc7cbZcW2yXWRnhiY+4c5Iy2+AuHdC2LBdQAdAaRMx4qFdc3hX5UgLKBL1
3rHfJAmO5FGkP6LlqPlQs/DYpYqCkDSlr6t0cczqZpKPPf+Ave4c48zCJCI6f/0E
Dx29sv8RZ83eQqRFAgMBAAGjUzBRMB0GA1UdDgQWBBQ8ZyMR+VJfnsFV+3x4E6rP
3DA5jDAfBgNVHSMEGDAWgBQ8ZyMR+VJfnsFV+3x4E6rP3DA5jDAPBgNVHRMBAf8E
BTADAQH/MA8GA1UdEwEB/wQFMAMBAf8wDQYJKoZIhvcNAQELBQADggEBAKtWlLrL
rRt9CXcYGp+Vj3Pq6OTo/BJxwDcJComV5HNZq9hZvHv2HUgULrKQdHYfK/IK4Fov
q+rgZBMdNPEpZ56R0UwYS/HEHQXKGVatnFqIqm1Yf1V6UitCQxV5Tb3ACVG6GHtD
q9iVUXAHyVBq8IYUVl3IWC1QJ/4iBxQsQfB5wCvGbC3x0jPfwt2LVLbXTOJLbYle
ujiP5wMg0y2p5gEr5b9I9iaSyzfsmBhtOuq+klVh/FKWgjyHyC6+okZv2xX6pzpG
XSQILz/JU+PpKZ6q3F8zYpF1g0IuOrbisX4e/4xhyZ+42fjMEAXQjWmWnM2X6QZk
RbqACMiiPruGSh8=
-----END CERTIFICATE-----
```

In practice, when a secure connection is established (like in HTTPS), the server presents its certificate to the client.
The client, in turn, verifies the certificate's validity by checking the CA's digital signature using the CA's public key, which it trusts. 
If the certificate is valid and trusted, the client can confidently use the public key in the certificate to establish a secure communication channel with the server.
This ensures that the data exchanged is encrypted and comes from a verified source.

## Certificate Authorities

[Certificate Authorities](https://en.wikipedia.org/wiki/Certificate_authority) (CAs) play a crucial role in PKI.
These entities are in charge of distributing and managing public keys.
They issue digital certificates, which are typically stored in X.509 format, a standard for public key certificates.
For practical management, a keystore (such as PKCS 12) is often used to securely store a private key along with its corresponding X.509 certificate.
This arrangement ensures that the public key can be publicly disseminated in a verifiable format while keeping the private key secure.

<aside class="quote">
    <em>“The centralization of trust in PKI creates a paradox: while it simplifies verification, it also presents a single point of failure, making the system highly vulnerable to attacks that compromise the centralized authority.”</em> 
</aside>

The infrastructure of PKI is based on the trust established in these CAs.
A certificate can be self-signed or signed by another certificate, but it's the CA-signed certificates that are crucial for establishing trust.
When a CA signs a certificate, it is vouching for the authenticity of that public key and the identity associated with it.
Trusting a CA, therefore, means trusting all the certificates issued by it.
This trust is fundamental to ensuring confidentiality, integrity, and availability in digital communications secured by PKI.

However, PKI systems must also address the scenario of compromised private keys.
In such cases, the associated certificate needs to be invalidated, a process overseen by the CA.
The CA can revoke a certificate, and this revocation information is disseminated through [Certificate Revocation Lists](https://en.wikipedia.org/wiki/Certificate_revocation_list) (CRLs) or the [Online Certificate Status Protocol](https://en.wikipedia.org/wiki/Online_Certificate_Status_Protocol) (OCSP).
CRLs provide a list of revoked certificates and are regularly updated and checked by systems verifying certificates.
OCSP offers real-time verification, checking the status of a certificate each time it is presented.
This mechanism ensures that compromised certificates are quickly recognized as invalid, maintaining the overall security of the PKI system.

## Example: HTTPS

Billions of people use the [Hypertext Transfer Protocol Secure](https://en.wikipedia.org/wiki/HTTPS) (HTTPS) every day.
HTTPS is a protocol that allows secure communication between a client and a server.
I would say, this is the most fundamental building block of the internet.

HTTPS uses encryption to protect the privacy and integrity of the data being transmitted.
It protects against man-in-the-middle attacks, and the bidirectional block cipher encryption of communications between a client and server protects the communications against eavesdropping and tampering.
If the data is hijacked online, all the hijacker gets are binary code.

{% badge ../img/posts/2023/2023-08-13/https_internet_url.jpg 140 https://en.wikipedia.org/wiki/HTTPS %}

HTTPS transmits encrypted data using [Transport Layer Security](https://en.wikipedia.org/wiki/Transport_Layer_Security) (TLS).
The authentication aspect of HTTPS requires a trusted third-party to sign server-side digital certificates.

Here is how the transmitted data is encrypted and decrypted:

1. First, the client (browser) and the server establish a TCP connection.

2. The client sends a “_first client message_” to the server containing a set of encryption algorithms (or cipher suites) which indicates the latest TLS version it can support.

3. The server responds with a “_first server message_” so the browser knows whether it can support the algorithms and TLS version.

4. The server then sends the SSL certificate to the client containing the public key, hostname, expiry dates, etc.

5. After validating the SSL certificate, the client generates a session key and encrypts it using the public key.

6. The server receives the encrypted session key and decrypts it with the private key.

7. Now that both the client and the server hold the same session key (symmetric encryption), the encrypted data is transmitted in a secure bi-directional channel.

There are two main reasons why HTTPS switches to symmetric encryption during data transmission:

1. **Security:** The asymmetric encryption goes only one way. This means that if the server tries to send the encrypted data back to the client, anyone can decrypt the data using the public key.

2. **Server resources:** The asymmetric encryption adds quite a lot of mathematical overhead. It is not suitable for data transmissions in long sessions.

# Web of Trust (WOT)

The [Web of Trust](https://en.wikipedia.org/wiki/Web_of_trust) (WOT) is a decentralized trust model used in public key cryptography, contrasting with the hierarchical model of PKI. In the WOT, trust is established through a network of individual users, rather than relying on a central authority like a Certificate Authority (CA). Users in this system validate each other's identity and vouch for the authenticity of each other's public keys through a process known as "key signing."

In this model, when a user signs another public key, they are essentially asserting that they believe the key belongs to the person who claims to own it. These signatures are then added to the key's metadata and become visible to others within the network. The more signatures a key has, especially from users who themselves have many signatures, the more trusted it becomes. This method allows trust to be built organically within the community.

The following diagram illustrates a WOT network:

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
A(["👤 User A"]) -->|Signs Key of| B(["👤 User B"])
B -->|Signs Key of| C(["👤 User C"])
C -->|Signs Key of| D(["👤 User D"])
B -->|Signs Key of| D
A -->|Signs Key of| E(["👤 User E"])
E -->|Signs Key of| F(["👤 User F"])
F -->|Signs Key of| A
D -->|Signs Key of| F
E -->|Signs Key of| C
{% endmermaid %}

Each node (`User A`, `User B`, etc.) represents an individual participant in the WOT, where one user signs the key of another.
This network of trust relationships indicates that users trust the identity associated with the keys they have signed.
The interconnectedness shows how trust is distributed in a decentralized manner, without a central authority like in PKI systems.

As shown before, the WOT model relies heavily on the discretion and judgment of its users, making it susceptible to issues of trust scaling and network integrity.
It's more commonly used in environments where users can reasonably be expected to have personal interactions or where community-based trust is sufficient, such as in certain open-source communities.
The WOT provides an alternative to the more rigid structure of PKI, offering a more flexible, though less formalized, approach to establishing trust in digital communications.

# Conclusion

In this article, I have introduced the fundamental concepts of Cryptography, including symmetric and asymmetric encryption.
These concepts are the building blocks of Public Key Infrastructure (PKI).
I have explained how PKI is used to establish trust in digital communications and transactions.
I have also discussed the role of certificates and digital signatures in PKI.
Finally, I have introduced the concept of Web of Trust (WOT) as an alternative to decentralizing PKI.

# Footnotes

[^1]: Whitfield Diffie and Martin Hellman, "[New Directions in Cryptography](https://ieeexplore.ieee.org/document/1055638)", _IEEE Transactions on Information Theory_, Vol. 22, No. 6, November 1976, pp. 644–654.

[^2]: In symmetric encryption, sometimes the keys are actually different but still connected in a way that is straightforward to figure out.
