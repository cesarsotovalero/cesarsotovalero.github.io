---
layout: post
title: A Prime on Public Key Infrastructure
subtitle: TODO
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

TODO

<figure class="jb_picture">
  {% responsive_image path: img/posts/2023/2023-08-13/dark_well.jpg alt:"TODO" %}
  <figcaption class="stroke"> 
    TODO
  </figcaption>
</figure>

# Why?

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
%%{init: {'theme': 'base', 'themeVariables': { 'fontSize': '18px'}}}%%
flowchart TB;
a(["👩 User"]) --> |Generate Key Pair| b["Key Pair"]
b --> |"🔑 Public Key in CSR"| x["🏠 Certificate Authority"]
b --> |"🔒 Private Key"| a
x --> |"📝 Certificate"| a
a --> |"💾 Signed Data"| c(["👨 Third Party"])
a --> |"📝 Certificate"| c
{% endmermaid %}


- Confidentiality – our interactions are   not read by a third party
- Integrity – our interactions are not   modified by a third party (protection from imposters)
- Availability – our interactions are not   blocked by a third party

# Encryption

## Symmetric Encryption

- The same key is used by sender and receiver
- Fast and (probably) secure
- Confidentiality and integrity
- Availability is a problem, since establishing trust (key distribution) is
  complicated

## Asymmetric Encryption

- Based on mathematical problems that are hard to reverse:
  - Factorization - RSA (Rivest–Shamir–Adleman)
  - Discrete logarithm - DSA (Diffie-Hellman)
  - Elliptic curve - ECDSA (Elliptic Curve Digital Signature Algorithm)

- The sender uses the receiver’s public key, and the receiver (with the private key) is the only one that can read the message.
- Slower and (maybe) less secure than symmetric encryption.

# Signing

Reversing asymmetric encryption.

- What happens if we encrypt with the private key?
• Everyone can decrypt, using the public key
• We know who encrypted the document
• Usually performed on a hash of a message (since the signature is not confidential)
• This is called signing

# Certificates

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

# Footnotes


# Resources

- https://osssc-edu.github.io/supply-chain.github.io/SEC-pki/
- 
- [SSH connections](../blog/2021/configuring-remote-connections-in-unix-based-systems-using-ssh.html)

