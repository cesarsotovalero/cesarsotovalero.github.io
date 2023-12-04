---
layout: post
title: A Prime on Public Key Infrastructure
subtitle: How do we trust each other in the digital era?
tags: security
description: |
  TODO
keywords:
  - security,
  - encryption,
  - public key infrastructure,
  - java,
  - infrastructure as code
image: ../img/posts/2023/2023-08-13/dark_well-cover.jpg
share-img: ../img/posts/2023/2023-08-13/dark_well-cover.jpg
show-avatar: false
toc: true
date: 2023/08/13
author: cesarsotovalero
published: false
---

The whole internet is secured by the power of symmetric and asymmetric cryptography. 
Each time you visit a website, a **cryptographic handshake** occurs between your browser and a web server located somewhere on Earth.
This process occurs thanks to something known as Public Key Infrastructure (PKI).
This technology is crucial for ensuring secure electronic information transfer between digital entities.
PKI is integral to most confidential network activities, including e-commerce, internet banking, and email communications.
It is particularly useful when simple passwords are inadequate for user authentication, necessitating a stronger **proof of identity**.
At its core, PKI binds public keys to the identities of entities such as individuals and organizations. 
This is done through a process of registration and the issuance of **digital certificates**. 
These certificates are provided by a Certificate Authority (CA). 
The CA is responsible for digitally signing and publishing the public keys to ensure the trustworthiness of the binding.
In this article, I will delve into the cryptographic backbone of the internet as we know it. 
I'll focus on the role of PKI, and how it helps to safeguard the authenticity and security of digital transactions and communications across the internet. Let's dive in!

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-13/dark_well.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    &#169; The internet is a chthonic pool. Don't jump in without your keys! Photo of a piece of art in the <a href="https://maps.app.goo.gl/75AGyCg5QpzjQeFR8">Stockholm's Paradox Museum</a>.
  </figcaption>
</figure>

# The Problem of Digital Trust

Since ancient times, the quest for secure communication has been a constant human endeavor. 
In general, there are two fundamental challenges that need to be addressed in order to safeguard any kind of communication:
 
1. **Confidentiality:** Ensuring that only the intended recipient can understand the message.
2. **Integrity:** Guaranteeing that the message remains unaltered by any third parties during its transmission.

In today's digital era, these challenges are magnified due to the speed and scale at which information is send and received.
The internet demands not only lightning-fast communication channels but also, often, interactions between parties who have never met and may not inherently trust each other.

This raises a fundamental question: 

🤔 _How to build and maintain trustful communication channels on a global scale?_

To answer this question, we need to look at how the internet have been built. 
At its core, digital data transfer channels rely on mathematical concepts regarding data encryption. 
In particular, the concept of **cryptography** is fundamental to understand the mechanisms and technologies that are pivotal for scaling digital trust worldwide.

# Cryptography

[Cryptography](https://en.wikipedia.org/wiki/Cryptography) is about building tools and techniques to enable secure communication in the presence of adversarial behaviors.
More specifically, cryptography relies on mathematical proofs to protect aspects of information security.
For example, cryptography allows achieving confidentiality, integrity, entity authentication, and data origin authentication.
Fortunately, we only need to know about two cryptographical techniques: **symmetric** and **asymmetric** encryption.

## Symmetric Encryption

[//]: # (------ What it is ---------------------------------------------------------------------)

<aside class="quote">
    <em>“Encoding is about efficiently modifying the representation of data without bringing any guarantee of privacy or security. I wrote about it <a href="../blog/encoding-encryption-hashing-and-obfuscation-in-java.html#encoding">here</a>.”</em> 
</aside>

Before 1976, the only known way to encrypt messages was using [symmetric encryption](https://en.wikipedia.org/wiki/Symmetric-key_algorithm).
This is a mechanism to encode messages where both the sender and receiver use the same **secret key**. 
Sometimes, their keys are different but still connected in a way that is easy to figure out.

<aside class="quote">
    <em>“The Caesar cipher method is easy to break because with only 26 different possible shifts it can be solved with simple brute force and letter frequency analysis.”</em> 
</aside>

The most famous example is perhaps the [Caesar cipher algorithm](https://en.wikipedia.org/wiki/Caesar_cipher).
The basic idea is to shift each letter in the plaintext (the original message) by a certain number of places down or up the alphabet
For example, if the key is "`3`", then the letter of the alphabet are shifted three positions.
In this case, the letter "`A`" would be encoded as "`D`", "`B`" would be "`E`", and so on.
To decrypt the message, the recipient only needs to shift the letters back by the same number of positions as used for encryption.

[//]: # (------ How it works mathematically -------------------------------------------------------------------)

Symmetric encryption can be formalized mathematically using the concepts of encryption and decryption functions. 

Let's denote:

- $$E$$ as the encryption function,
- $$D$$ as the decryption function,
- $$k$$ as the symmetric key,
- $$M$$ as the plaintext message, and
- $$C$$ as the ciphertext (encrypted message).

Then, symmetric encryption and decryption can be represented as follows:

1. **Encryption**: To encrypt a plaintext message $$M$$ using the symmetric key $$k$$, the encryption function $$E$$ is applied to both $$M$$ and $$k$$. Mathematically, this is represented as: $$C = E_k(M)$$

2. **Decryption**: To decrypt the ciphertext $$C$$ using the same symmetric key $$k$$, the decryption function $$D$$ is applied to both $$C$$ and $$k$$. This is represented as: $$M = D_k(C)$$

> "The fundamental property of symmetric encryption is that the same key $$k$$ is used for both encryption and decryption. In other words, by knowing $$k$$ and the encryption method $$E$$ one can decrypt or decrypt the message."
 
[//]: # (------ How it works graphically -------------------------------------------------------------------)

For more visual learners, here's a helpful figure:

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

In the figure above, the `KEY` node represents the symmetric key.
Note that arrows are drawn from this node to both the encryption and decryption processes so that the same key is used in both steps.
It is also important for both Alice and Bob to know exactly how the encryption/decryption process works.

[//]: # (------ How it works in code -------------------------------------------------------------------)

<aside class="quote">
    <em>“The SSL/TLS protocol is used to secure internet communications, ensuring data privacy and integrity between two communicating computer systems, like a web browser and a server.”</em> 
</aside>

If you prefer code, here's a simple example of a Java class `SymmetricEncryptionExample` that illustrates symmetric encryption using the [AES (Advanced Encryption Standard) algorithm](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard).
AES is commonly used to secure data transmitted through the SSL/TLS protocol.
The class relies on the `javax.crypto` package.
It uses `KeyGenerator` to create a secret key.
The key is used to encrypt a string `originalText`, and then decrypts it back. 
Note that the `Base64` encoding and decoding method is used to handle the byte array conversion for the encrypted text.

```java
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class SymmetricEncryptionExample {

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

    public static String encrypt(String plainText, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, secretKey);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    public static String decrypt(String encryptedText, SecretKey secretKey) throws Exception {
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, secretKey);
        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
        return new String(decryptedBytes);
    }
}
```

[//]: # (------ How it works in practice -------------------------------------------------------------------)

The main benefit of symmetric encryption is that it is **fast and efficient**.
By fast I mean, for example, that encrypting a file of 1GB using AES takes less than a second on a personal computer. 
However, this benefits comes with the following drawbacks:

1. The exact same key is used by the sender and receiver.
2. Confidentiality and integrity is guaranteed, but only if the key is kept secret.
3. Availability is a problem, since establishing trust (key distribution) is complicated.

The introduction of **asymmetric encryption** changed the game by solving the key distribution problem.

## Asymmetric Encryption

[//]: # (------ What it is ---------------------------------------------------------------------)

In 1976, Whitfield Diffie and Martin Hellman proposed a revolutionary method to encrypt messages.[^1]
Their system pushed forward cryptography by allowing users to communicate securely without having to agree on a shared secret key.
The system is is known as public-key cryptography or asymmetric encryption, and it is the foundation of how the internet works today.

These algorithms are based on the computational complexity of "hard" problems from number theory.
Because of the difficulty of the underlying problems, most public-key algorithms involve operations such as modular multiplication and exponentiation, which are much more computationally expensive than the techniques used in most block ciphers, especially with typical key sizes.
The following table shows example of algorithms based on three mathematical problems that are hard to reverse.

| Problem                                                                                                                                                                                                                                                         | Algorithm                                                                                                                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Integer Factorization](https://en.wikipedia.org/wiki/Integer_factorization) <br><br> [Discrete Logarithm Problem](https://en.wikipedia.org/wiki/Discrete_logarithm) <br><br> [Elliptic Curve ](https://en.wikipedia.org/wiki/Elliptic-curve_cryptography) <br> | [RSA](https://sv.wikipedia.org/wiki/RSA) <br><br> [DSA](https://en.wikipedia.org/wiki/Digital_Signature_Algorithm) <br><br> [ECIES](https://en.wikipedia.org/wiki/Integrated_Encryption_Scheme#Formal_description_of_ECIES) <br> |


[//]: # (------ How it works mathematically -------------------------------------------------------------------)

Asymmetric encryption can be formalized mathematically using encryption and decryption functions similar to symmetric encryption, but with the distinction that it uses two different keys: **public** and **private** keys. 

Let's denote:

- $$ E $$ as the encryption function,
- $$ D $$ as the decryption function,
- $$ k_{pub} $$ as the public key,
- $$ k_{priv} $$ as the private key,
- $$ M $$ as the plaintext message,
- $$ C $$ as the ciphertext (encrypted message).

The process then involves the following steps:

1. **Encryption**: To encrypt a plaintext message $$ M $$ using the public key $$ k_{pub} $$, the encryption function $$ E $$ is applied. Mathematically, this is represented as:  $$ C = E_{k_{pub}}(M) $$
  
2. **Decryption**: To decrypt the ciphertext $$ C $$ using the private key $$ k_{priv} $$, the decryption function $$ D $$ is applied. This is represented as: $$ M = D_{k_{priv}}(C) $$

> "The most important property of asymmetric encryption is that the decryption key $$ k_{priv} $$ cannot be feasibly derived from the encryption key $$ k_{pub} $$, even though they are mathematically related. This allows the public key to be shared openly, while the private key must be kept secret by the owner."

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

In the diagram above, Alice encrypts a message using Bob's public key.
The encrypted message can be then sent to Bob.
Bob decrypts the message using his private key.
Note that the public key is available to everyone (including Alice), while the private key is only known to Bob.
So only Bob (with the private key) can decrypt the message.

[//]: # (------ How it works in code -------------------------------------------------------------------)
Now, let's see how asymmetric encryption can be implemented in practice using Java code.
The following example uses the ECIES algorithm for encryption and decryption.
ECIES offers similar levels of security to RSA but with smaller key sizes, which often translates to faster computations and lower power consumption. 
The Java implementation combines the ECC algorithm with a symmetric cipher for effective encryption.

```java
import javax.crypto.Cipher;
import java.security.*;
import java.security.spec.ECGenParameterSpec;
import java.util.Base64;

public class ECCAsymmetricEncryptionExample {

    public static void main(String[] args) throws Exception {
        // Generate an ECC key pair
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("EC");
        keyPairGenerator.initialize(new ECGenParameterSpec("secp256r1")); // Specifies the curve standard
        KeyPair keyPair = keyPairGenerator.generateKeyPair();
        PublicKey publicKey = keyPair.getPublic();
        PrivateKey privateKey = keyPair.getPrivate();

        String originalText = "Hello, this is a secret message!";
        System.out.println("Original Text: " + originalText);

        // Encrypt the text
        String encryptedText = encrypt(originalText, publicKey);
        System.out.println("Encrypted Text: " + encryptedText);

        // Decrypt the text
        String decryptedText = decrypt(encryptedText, privateKey);
        System.out.println("Decrypted Text: " + decryptedText);
    }

    public static String encrypt(String plainText, PublicKey publicKey) throws Exception {
        Cipher cipher = Cipher.getInstance("ECIES");
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] encryptedBytes = cipher.doFinal(plainText.getBytes());
        return Base64.getEncoder().encodeToString(encryptedBytes);
    }

    public static String decrypt(String encryptedText, PrivateKey privateKey) throws Exception {
        Cipher cipher = Cipher.getInstance("ECIES");
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        byte[] decryptedBytes = cipher.doFinal(Base64.getDecoder().decode(encryptedText));
        return new String(decryptedBytes);
    }
}
```

[//]: # (------ How it works in practice -------------------------------------------------------------------)

Public-key cryptography is also used for implementing digital signature schemes. 
A digital signature is reminiscent of an ordinary signature.
They both have the characteristic of being easy for a user to produce, but difficult for anyone else to forge.
Digital signatures can also be permanently tied to the content of the message being signed.
They cannot then be moved from one document to another, for any attempt will be detectable.
In digital signature schemes, there are two algorithms: one for signing, in which a secret key is used to process the message (or a hash of the message, or both), and one for verification, in which the matching public key is used with the message to check the validity of the signature. 
RSA and DSA are two of the most popular digital signature schemes. 
Digital signatures are central to the operation of public key infrastructures and many network security schemes (e.g., SSL/TLS, many VPNs, etc.)

<aside class="quote">
    <em>“Asymmetric encryption is slower and (arguably) less secure than symmetric encryption, but it solves the key distribution problem.”</em> 
</aside>
 
In a real-world scenario, encrypting a large file (like 1 GB) directly with asymmetric encryption like RSA is impractical due to its slow speed.
Instead, this type of algorithms are used to encrypt a small piece of data, such as the "KEY" used for symmetric encryption.
This difference in speed is a key reason why asymmetric encryption is typically reserved for specific tasks like secure key exchange, rather than bulk data encryption.

As a result, public-key cryptosystems are commonly hybrid cryptosystems, in which a fast high-quality symmetric-key encryption algorithm is used for the message itself, while the relevant symmetric key is sent with the message, but encrypted using a public-key algorithm.
Similarly, hybrid signature schemes are often used, in which a cryptographic hash function is computed, and only the resulting hash is digitally signed.


# Public Key Infrastructure

## Signing

Reversing asymmetric encryption.

- What happens if we encrypt with the private key?
• Everyone can decrypt, using the public key
• We know who encrypted the document
• Usually performed on a hash of a message (since the signature is not confidential)
• This is called signing

## Certificates

Simply using a pair of keys to encrypt/decrypt and sign/verify some piece of data does not guarantee that the information came from a specific user.

Ultimately, a pair of keys is not tied to a person or a system.
To solve this problem, an infrastructure is required in order to bind these two aspects together.

**Public Key Infrastructure (PKI)** is a set of entities, with distinct roles, responsible for managing _digital certificates_.
This includes their _generation_, _storage_, _distribution_, and _revocation_.
These certificates can then be used to authenticate a user, or a machine, to a service.
Simply, a user can provide his public key to a **Certificate Authority (CA)** to prove his identity to that authority, e.g., by physically going to an office, which will then create a certificate containing the identity of the user and the public key.
This, guarantees that the public key (or certificate) distributed to the web is bound to a specific person or system.

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
a(["👩 User"]) --> |Generate Key Pair| b["Key Pair"]
b --> |"🔑 Public Key in CSR"| x["🏠 Certificate Authority"]
b --> |"🔒 Private Key"| a
x --> |"📝 Certificate"| a
a --> |"💾 Signed Data"| c(["👨 Third Party"])
a --> |"📝 Certificate"| c
{% endmermaid %}

- Confidentiality – our interactions are not read by a third party
- Integrity – our interactions are not modified by a third party (protection from imposters)
- Availability – our interactions are not blocked by a third party

https://en.wikipedia.org/wiki/Public_key_certificate

How do we distribute public keys?

- A certificate is a signed public key (with some additional information).
- Certificates are stored with their signing certificates in X.509 files.
- A keystore (such as Public Key Cryptography Standard 12 - PKCS 12) is commonly used to bundle a private key together with an X.509 certificate.

So where is the infrastructure?
 
- A certificate is signed (self-signed or by another certificate)
- A certificate with the purpose of signing is called a certificate authority (CA)
- Trusting the CA will allow you to trust the certificates issued by it
- Confidentiality, integrity and availability!

What happens if my private key is compromised?

- The certificate authority can revoke a certificate
- But how do I know that a certificate has been revoked?
- The certificate tells the verifier where to look!
- Certificate revokation lists (CRLs) are fetched and cached for some time
- Online certificate status protocol (OCSP) queries every time a certificate is verified

## Web of Trust

In the "web of trust" scheme, where individuals vouch for each other's keys.

## Descentralized PKI

Additionally, decentralized PKI (DPKI) eliminates reliance on centralized authorities by allowing each entity to serve as its own root authority.

## Example: HTTPS

Billions of people use the [Hypertext Transfer Protocol Secure (HTTPS)](https://en.wikipedia.org/wiki/HTTPS) every day.
HTTPS is a protocol that allows secure communication between a client and a server.
I would say, this is the most fundamental building block of the internet.

HTTPS uses encryption to protect the privacy and integrity of the data being transmitted.
It protects against man-in-the-middle attacks, and the bidirectional block cipher encryption of communications between a client and server protects the communications against eavesdropping and tampering.
If the data is hijacked online, all the hijacker gets is binary code.

{% badge ../img/posts/2023/2023-08-13/https_internet_url.jpg 140 https://en.wikipedia.org/wiki/HTTPS %}

## How does HTTPS work?

HTTPS transmits encrypted data using [Transport Layer Security (TLS)](https://en.wikipedia.org/wiki/Transport_Layer_Security).
The authentication aspect of HTTPS requires a trusted third-party to sign server-side digital certificates.

Here is how the transmitted data is encrypted and decrypted:

1. First, the client (browser) and the server establish a TCP connection.

2. The client sends a “_first client message_” to the server containing a set of  encryption algorithms (or cipher suites) which indicates the latest TLS version it can support.
 
3. The server responds with a “_first server message_” so the browser knows whether it can support the algorithms and TLS version.

4. The server then sends the SSL certificate to the client containing the public key, host name, expiry dates, etc. 

5. After validating the SSL certificate, the client generates a session key and encrypts it using the public key.

6. The server receives the encrypted session key and decrypts it with the private key.

7. Now that both the client and the server hold the same session key (symmetric encryption), the encrypted data is transmitted in a secure bi-directional channel.

There are two main reasons of why HTTPS switches to symmetric encryption during data transmission:

1. **Security:** The asymmetric encryption goes only one way. This means that if the server tries to send the encrypted data back to the client, anyone can decrypt the data using the public key.

2. **Server resources:** The asymmetric encryption adds quite a lot of mathematical overhead. It is not suitable for data transmissions in long sessions.

# Footnotes

[^1]: Whitfield Diffie and Martin Hellman, "New Directions in Cryptography", IEEE Transactions on Information Theory, Vol. 22, No. 6, November 1976, pp. 644-654.


# Resources

- https://osssc-edu.github.io/supply-chain.github.io/SEC-pki/
- https://youtu.be/Jefr7wFLu3M?si=u6fRNlgPpfoHKdR0
- https://youtu.be/s22eJ1eVLTU?si=q3dR8GevAAGDS4BP
- [SSH connections](../blog/2021/configuring-remote-connections-in-unix-based-systems-using-ssh.html)
 

[//]: # (Enable Latex support, see https://zjuwhw.github.io/2017/06/04/MathJax.html)
<script type="text/x-mathjax-config">
MathJax.Hub.Config({
  tex2jax: {
    inlineMath: [['$','$'], ['\\(','\\)']],
    processEscapes: true
  }
});
</script>
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

