---
layout: post
title: A Prime on Public Key Infrastructure
subtitle: Business security and trust in the digital age
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

The internet is driven by the power of cryptography. Each time you visit a website, a cryptographic handshake occurs between your browser and a web server located somewhere on Earth. This is where Public Key Infrastructure (PKI) comes into play, a technology crucial for ensuring secure electronic information transfer between the two entities. PKI is integral to various network activities, including e-commerce, internet banking, and confidential email communications.

PKI becomes particularly vital when simple passwords are inadequate for authentication, necessitating a stronger proof of identity for secure communication. At its core, PKI binds public keys to the identities of entities such as individuals and organizations. This is done through a process of registration and the issuance of digital certificates. These certificates are provided by a Certificate Authority (CA), which is responsible for digitally signing and publishing the public keys to ensure the trustworthiness of this binding.

In this article, I will delve into the cryptographic backbone of the internet as we know it. My focus is on the pivotal role of PKI in safeguarding the authenticity and security of digital transactions and communications across the internet. Let's dive in!
<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-13/dark_well.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    Do not jump into the dark well without your keys! Photo of a piece of art in the <a href="https://maps.app.goo.gl/75AGyCg5QpzjQeFR8">Stockholm's Paradox Museum</a>.
  </figcaption>
</figure>

# The Problem of Digital Trust

Since ancient times, the quest for secure communication has been a constant human endeavor. 
In essence, there are two fundamental challenges that need to be addressed to ensure communication security:
 
- **Confidentiality:** Ensuring that only the intended recipient can understand the message.
- **Integrity:** Guaranteeing that the message remains unaltered by any third parties during transmission.

In today's digital era, these challenges are magnified. 
The internet demands not only lightning-fast communication channels but also, often, interactions between parties who have never met and may not inherently trust each other.

This raises a critical question: 

_**Q:** How to build and maintain trust on a global scale?_

As we delve deeper into this topic, we explore the mechanisms and technologies that are pivotal in scaling digital trust worldwide.

# Cryptography

https://en.wikipedia.org/wiki/Cryptography

## Symmetric Encryption

An example is the AES (Advanced Encryption Standard) used in the SSL/TLS protocol.

[//]: # (see https://mermaid-js.github.io)
{% mermaid %}
%%{init: {'theme':'base'}}%%
flowchart TB;
U(["👩 User"]) --> |"📒 Plaintext"| C["Encryption Process"]
KEY["🔑 Symmetric Key"]
KEY --> C
C --> K["🔒 Ciphertext"]
K --> F["Decryption Process"]
KEY --> F
F --> G["📒 Plaintext"]
{% endmermaid %}

The `KEY` node represents the symmetric key, and arrows are drawn from this node to both the encryption and decryption processes to emphasize that the same key is used in both steps. This illustrates that the encryption and decryption keys are identical in symmetric encryption.

- The same key is used by sender and receiver
- Fast and (probably) secure
- Confidentiality and integrity
- Availability is a problem, since establishing trust (key distribution) is
  complicated


Here's a simple example of a Java class that illustrates symmetric encryption using the Advanced Encryption Standard (AES). This class includes methods for both encryption and decryption. Java's `javax.crypto` package should suffice for basic needs.
This class demonstrates the basic process of symmetric encryption and decryption using AES. It generates a secret key, uses it to encrypt a string, and then decrypts it back to the original text. The `Base64` encoding and decoding are used to handle the byte array conversion for the encrypted text.


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


## Asymmetric Encryption

Public-key cryptography is also used for implementing digital signature schemes. A digital signature is reminiscent of an ordinary signature; they both have the characteristic of being easy for a user to produce, but difficult for anyone else to forge. Digital signatures can also be permanently tied to the content of the message being signed; they cannot then be 'moved' from one document to another, for any attempt will be detectable. In digital signature schemes, there are two algorithms: one for signing, in which a secret key is used to process the message (or a hash of the message, or both), and one for verification, in which the matching public key is used with the message to check the validity of the signature. RSA and DSA are two of the most popular digital signature schemes. Digital signatures are central to the operation of public key infrastructures and many network security schemes (e.g., SSL/TLS, many VPNs, etc.)

Public-key algorithms are most often based on the computational complexity of "hard" problems, often from number theory. For example, the hardness of RSA is related to the integer factorization problem, while Diffie–Hellman and DSA are related to the discrete logarithm problem. The security of elliptic curve cryptography is based on number theoretic problems involving elliptic curves. Because of the difficulty of the underlying problems, most public-key algorithms involve operations such as modular multiplication and exponentiation, which are much more computationally expensive than the techniques used in most block ciphers, especially with typical key sizes. As a result, public-key cryptosystems are commonly hybrid cryptosystems, in which a fast high-quality symmetric-key encryption algorithm is used for the message itself, while the relevant symmetric key is sent with the message, but encrypted using a public-key algorithm. Similarly, hybrid signature schemes are often used, in which a cryptographic hash function is computed, and only the resulting hash is digitally signed.

- Based on mathematical problems that are hard to reverse:
  - Factorization - RSA (Rivest–Shamir–Adleman)
  - Discrete logarithm - DSA (Diffie-Hellman)
  - Elliptic curve - ECDSA (Elliptic Curve Digital Signature Algorithm)

- The sender uses the receiver’s public key, and the receiver (with the private key) is the only one that can read the message.
- Slower and (maybe) less secure than symmetric encryption.


In this example, "ECIES" (Elliptic Curve Integrated Encryption Scheme) is used for encryption and decryption. ECC offers similar levels of security to RSA but with smaller key sizes, which often translates to faster computations and lower power consumption. It combines the ECC algorithm with a symmetric cipher for effective encryption.

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

# Signing

Reversing asymmetric encryption.

- What happens if we encrypt with the private key?
• Everyone can decrypt, using the public key
• We know who encrypted the document
• Usually performed on a hash of a message (since the signature is not confidential)
• This is called signing

# Certificates

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

# Web of Trust

In the "web of trust" scheme, where individuals vouch for each other's keys.

# Descentralized PKI

Additionally, decentralized PKI (DPKI) eliminates reliance on centralized authorities by allowing each entity to serve as its own root authority.

# Example: HTTPS

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


# Resources

- https://osssc-edu.github.io/supply-chain.github.io/SEC-pki/
- https://youtu.be/Jefr7wFLu3M?si=u6fRNlgPpfoHKdR0
- https://youtu.be/s22eJ1eVLTU?si=q3dR8GevAAGDS4BP
- [SSH connections](../blog/2021/configuring-remote-connections-in-unix-based-systems-using-ssh.html)

