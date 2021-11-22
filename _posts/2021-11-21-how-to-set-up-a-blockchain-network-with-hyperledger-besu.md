---
layout: post
title: How to Set Up A Blockchain Network With Hyperledger Besu
subtitle: Look mom, I'm running my own blockchain!
tags: tutorials
description: If you are a Java developer interested in cryptocurrencies and blockchain-related technologies, you should probably have heard about Hyperledger Besu, the official Java client of the Ethereum blockchain. In this post, we're going to set up a production-ready Ethereum client using Besu.
keywords:
  - blockchain,
  - ethereum,
  - decentralized applications,
  - tutorial,
  - hyperledger besu,
image: https://www.cesarsotovalero.net/img/posts/floor_art_cover.jpg
share-img: https://www.cesarsotovalero.net/img/posts/floor_art_cover.jpg
show-avatar: false
date: 2021/11/21
author: cesarsotovalero
published: true
---

If you are a Java developer interested in cryptocurrencies and blockchain-related technologies, you should probably have heard about [Hyperledger Besu](https://www.hyperledger.org/use/besu).
Besu is the [official Java client](https://ethereum.org/en/developers/docs/nodes-and-clients/) of the Ethereum blockchain.
As an enterprise-grade client for public and private networks, Besu is able to connect to the blockchain and verify all the transactions and blocks against consensus rules by itself.
It runs all of the Ethereum Mainnet features, from tracing to GraphQL.
It has extensive monitoring capabilities and is actively developed by [ConsenSys](https://consensys.net/) (the company behind successful products such as MetaMask, Quorum, and Truffle).
Besu is also actively supported both in open community channels and through commercial SLAs for enterprises.
In this post, we're going to set up a production-ready Ethereum client using Besu, step-by-step.

<figure class="jb_picture">
{% responsive_image path: img/posts/floor_art.jpg alt:"Software configurations is, like art, a sense of beautiful abstractions." %}
  <figcaption class="stroke">
&#169; Software configurations is, like art, a sense of beauty and abstractions. Photo taken at <a href="https://goo.gl/maps/ZjSrUbNDX9EutcES7">Tekniska högskolan metro station</a>.
</figcaption>
</figure>

# Hyperledger Besu

Hyperledger Besu is the leading Ethereum client for Java enterprise applications.
It can be used to connect to the existing public Ethereum network (a.k.a Mainnet).
Besu can be configured to perform as a full node that syncs to the blockchain, to an archive node, which contains the data of the blockchain but does not participate in adding new blocks.
It can also  be used to create a private blockchain network, compatible to the Ethereum Virtual Machine (EVM), for customized blockchain applications.

> “An Ethereum client is a software application that implements the Ethereum specification and communicates over the peer-to-peer network with other Ethereum clients. Different Ethereum clients interoperate if they comply with the reference specification and the standardized communications protocols. While these different clients are implemented by different teams and in different programming languages, they all "speak" the same protocol and follow the same rules. As such, they can all be used to operate and interact with the same Ethereum network.” -- [kauri.io](https://kauri.io/#collections/Ethereum%20101/ethereum-101-part-2-understanding-nodes/)

# Requirements

On Linux, you need to:

- Download Besu
- Ensure you have Java 11+ installed

Also, you need:

- At least 750GB+ of disk space available
- Between 3 and 5 days of waiting time to fast sync with the nodes

# Install Besu

To install Java, run the following commands in the terminal:

{% highlight bash %}
sudo apt install openjdk-jre-headless
java --version
{% endhighlight %}

To install Besu, clone the [Hyperledger/besu](https://github.com/hyperledger/besu) GitHub repository to your home directory:

{% highlight bash %}
git clone --recursive https://github.com/hyperledger/besu.git
{% endhighlight %}

Once it finishes, build Besu with the Gradle wrapper `gradlew`, omitting tests as follows:

{% highlight bash %}
./gradlew build -x test
{% endhighlight %}

Go to the distribution directory:

{% highlight bash %}
cd build/distributions/
{% endhighlight %}

Expand the distribution archive:

{% highlight bash %}
tar -xzf besu-<version>.tar.gz
{% endhighlight %}

Move to the expanded folder and display the Besu help to confirm that the installation is correct:

{% highlight bash %}
cd besu-<version>/bin
./besu --help
{% endhighlight %}

# Configure Besu

You can use flags and subcommands to configure specific options for Besu.
These flags and subcommands can also be stored in a [configuration file](https://besu.hyperledger.org/en/stable/HowTo/Configure/Using-Configuration-File/), which sets the initial parameters for Besu.
Using a configuration file is useful because it can be saved and reused later.
Besu uses the `TOML` format for this configuration file.  
The following is a ~~short~~ working example:

{% highlight toml linenos %}
# Valid TOML config file
data-path="~/besudata"
# This is the datapath where the blockchain data will be stored

# Network
bootnodes=["enode://001@123:4567", "enode://002@123:4567", "enode://003@123:4567"]
# In a private network, an enode URL is the identifier for a node and
# allows for the bootnodes to discover each other as they start up. In
# this example, there are three bootnodes stipulated for this network

p2p-host="1.2.3.4"
# Stipulates the advertised host that can be used to access the node
# from outside the network in Peer to Peer communication
p2p-port=1234

max-peers=42
# The maximum number of peer to peer connections this network can
# establish

rpc-http-host="5.6.7.8"
# Specifies the host on which HTTP JSON-RPC listens
rpc-http-port=5678
# The HTTP JSON-RPC listening port (TCP)

rpc-ws-host="9.10.11.12"
# The host for Websocket WS-RPC to listen on
rpc-ws-port=9101
# The Websockets JSON-RPC listening port (TCP)

genesis-file="~/genesis.json"
# Path to the custom genesis file. The next lesson will explain how to
# create a genesis file and what is contained in the genesis file

miner-enabled=true
# This option enables mining when the node is started. The type of
# consensus mechanism will be stipulated in the genesis file

miner-coinbase="0xfe3b557e8fb62b89f4916b721be55ceb828dbd73"
# miner-coinbase provides the account to which mining rewards will be
# paid for this blockchain
{% endhighlight %}

Other things to be noticed:
- The configuration file should be named as `config.toml`.
- Within the file, each option will not have the leading dashes that would be present if these options or subcommands were called directly from the command line.
- The comments are optional but can help understand how the config file is set up, which is especially useful if you are trying to remember the configuration for a specific network.

# Run Besu

To start a network using the config file, open a terminal and run Besu as follows:

{% highlight bash %}
besu --config-file=/home/me/me_node/config.toml
{% endhighlight %}

If you are interested in seeing all the options available for the configuration file, or via the command line interface, see the [Hyperledger Besu Command Line](https://besu.hyperledger.org/en/stable/Reference/CLI/CLI-Syntax/) official documentation.

# Creating a Private Network

Perhaps the main advantage of Besu is that it can be used to create private blockchain networks.
An example of a private network's usefulness is that you want to create a unified loyalty rewards program across multiple brands.
Each retailer would run their own node in this example, submitting transactions to the private blockchain when customers make purchases.
The rewarded points would accrue to a customer address, allowing the customer to accrue and use points across brands or vendors.

Another use case would be to create a private EVM compatible blockchain for organizations looking to host blockchain infrastructure, allowing nodes to join the network provided they agree to certain conditions.
For example, to comply with specific regulations or standards that may not be present on the Ethereum Mainnet.
The [LACChain](https://www.lacchain.net/home) project is an example of such a blockchain network.
The project was specifically created to encourage the use of distributed ledger technology in Latin America and the Caribbean.
As of May 2021, it has 50 organizations participating in the network, running 82 nodes.
This blockchain is a general-purpose blockchain, similar to Ethereum Mainnet, but has compliance with the standards set for by the International Standards Organization’s Technical Committee 307 (ISO / TC 307).
For a look into the infrastructure, smart contracts, and features of LACChain, see its [GitHub repository](https://github.com/lacchain).

# The Genesis Block 

The first block in a blockchain is called the genesis block. 
Ethereum Mainnet’s genesis block  (block 0) was mined on July 30, 2015. 
In order to join or create any network, the data for the genesis block must be provided. 
The [genesis file](https://besu.hyperledger.org/en/stable/Reference/Config-Items/) defines the data that is in the first block of a blockchain, as well as rules for the blockchain itself. 
If a new node or validator attempts to join the blockchain, it will use the genesis file as the starting point when recreating the history of the chain in order to synchronize with the existing network.

The genesis file for Ethereum Mainnet, along with the supported testnets, is included in Besu. 
When creating a private network, a new genesis file must be created. 
The genesis file is a `JSON` formatted file. 
It looks like the below:

{% highlight json linenos %}
{
  "config": {
    "chainId": 2018,
    "muirglacierblock": 0,
    "ibft2": {
      "blockperiodseconds": 2,
      "epochlength": 30000,
      "requesttimeoutseconds": 4
    }
  },
  "nonce": "0x0",
  "timestamp": "0x58ee40ba",
  "extraData": "0xf83ea00000000000000000000000000000000000000000000000000000000000000000d5949811ebc35d7b06b3fa8dc5809a1f9c52751e1deb808400000000c0",
  "gasLimit": "0x1fffffffffffff",
  "difficulty": "0x1",
  "mixHash": "0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "alloc": {
    "9811ebc35d7b06b3fa8dc5809a1f9c52751e1deb": {
      "balance": "0xad78ebc5ac6200000"
    } 
  }
}
{% endhighlight %}

In this specific example, the genesis file is for an [IBFT 2.0 (PoA)](https://besu.hyperledger.org/en/stable/Tutorials/Private-Network/Create-IBFT-Network/) private network.

{% highlight json linenos %}
{
  "config": {
  "chainId": 2018,
  "muirglacierblock": 0,
  "ibft2": {
  "blockperiodseconds": 2,
  "epochlength": 30000,
  "requesttimeoutseconds": 4
}
{% endhighlight %}

The config key section contains the following information about the blockchain:

- `"chainId": 2018` The chain ID controls the transaction signature process, providing a unique identifier to allow for the hashing of signed transactions to only work on the network associated with the corresponding chain ID. [Ethereum Improvement Proposal 155 (EIP-155)](https://eips.ethereum.org/EIPS/eip-155) provides more information on the rationale behind the chain ID. Most chain IDs match the network ID of the network. In this case, `2018` refers to the chain ID associated with a development chain. For a description of the network and chain IDs, you can read in the [Hyperledger Besu Documentation](https://besu.hyperledger.org/en/stable/Concepts/NetworkID-And-ChainID/).
- `"muirglacierblock": 0` This field is called a “milestone block.” Muir Glacier refers to a specific network upgrade that occurred at block 9,200,000 on Ethereum Mainnet. For private networks, like the one that is being created in this example, the name of the latest milestone block can be listed, and set to be the genesis block. Here you can see a continuously updated list of network upgrades and the associated blocks for Ethereum.
- `"ibft2":` This specifies that the consensus protocol for the blockchain is IBFT 2.0. An overview of the proof-of-authority (PoA) consensus protocols available [here](https://besu.hyperledger.org/en/stable/Concepts/Consensus-Protocols/Comparing-PoA/).

Within the IBFT 2.0 (PoA) specification, the following three fields are provided:

- `"blockperiodseconds": 2` The minimum block time, in seconds. In this case, after two seconds, a new block will be proposed by the network.
- `"epochlength": 30000` The number of blocks at which to reset all votes. The votes refer to validators voting to add or remove validators to the network. In this case, after 30,000 blocks are created, this IBFT 2.0 network will discard all pending votes collected from received blocks. Existing proposals remain in effect and validators re-add their vote the next time they create a block.
- `"requesttimeoutseconds": 4` The time by which a new block must be proposed or else a new validator will be assigned by the network. If a validator goes down, the request time out ensures that proposal of a new block passes on to another validator. The request time out seconds should be set to be double the minimum block time (`blockperiodseconds`), hence why it is 4.


The second section contains information about the genesis block:

- `"nonce": "0x0"` The number used nonce (i.e. a part of the blockheader for the first block). Set to `0x0`.
- `"timestamp": "0x58ee40ba"` The creation date and time of the block. Often it can be set to `0x0`, but as long as it is any value in the past, it will work. In this case `0x58ee40ba` is a hexadecimal which converts to `1`492009146` and represents Wed Apr 12 2017 14:59:06 GMT+0000.
- `"extraData": "0xf83ea00000000000000000000000000000000000000000000000000000000000000
000d5949811ebc35d7b06b3fa8dc5809a1f9c52751e1deb808400000000c0"`Extra data is a recursive length prefix (RLP) encoded string (which is space efficient) containing the validator address of the IBFT 2.0 private network. Instructions on how to create an RLP using Besu can be found in the Besu Documentation [here](https://besu.hyperledger.org/en/stable/HowTo/Configure/Consensus-Protocols/QBFT/#extra-data).
- `"gasLimit": "0x1fffffffffffff"` The block gas limit, which is the total gas limit for all transactions included in a block. It defines how large the block size can be for the block, and is represented by an hexadecimal string. For this network, the gas limit is the maximum size, and is therefore a “free gas network”.
- `"difficulty": "0x1"` The difficulty of creating a new block. Represented as a hexadecimal string, the difficulty is set to `1`, effectively the lowest difficulty.
- `"mixHash": "0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365"` The unique identifier for the genesis block.
- `"coinbase": "0x0000000000000000000000000000000000000000"` The Coinbase account, which is where all block rewards for this network will be paid. 
- `"alloc": {"9811ebc35d7b06b3fa8dc5809a1f9c52751e1deb": {"balance": "0xad78ebc5ac6200000"}}` This field creates an address on our network, which is sometimes also referred to as an externally owned account, as it is an account not associated with a smart contract (referred to as a contract account). The number starting with “98” is the public key of the address. The balance can be passed in as a decimal OR a hexadecimal (like it has in this case and corresponds to 200 ETH, or 2*10^20 Wei). The balance is always in Wei, or 10^-18 Ether.

Once you have created your genesis file, you need to save it within the directory where your blockchain networks files will be kept.
Do not save it within any node or data folders, but rather at the top level.
To start up your network using the genesis file, run the following command:

{% highlight bash %}
besu --genesis-file=../genesis.json
{% endhighlight %}

# Conclusion

In this post, we have installed, configured, and run Hyperledger Besu, a Java client for the Ethereum blockchain.
Besu is an easy-to-use client because it provides detailed documentation to help users get started immediately.
On the other hand, Besu also provides additional metrics and logging for improved functionality and usability.
Let me know in the comments if you want me to cover these advanced features.

# Further Reading

- [Why Java for Blockchain](https://media.consensys.net/why-java-for-blockchain-73f1b444c2d)
- [De-Mystifying Besu: Understanding an Ethereum Codebase](https://www.youtube.com/watch?v=OJfib9kTK7U&feature=youtu.be)
- [Getting Started with Besu](https://www.youtube.com/watch?v=OKWBr94J9rY&t=1s)
- [How Poste Italiane brings value to loyalty with Hyperledger Besu](https://www.hyperledger.org/learn/publications/posteitaliane-case-study)
- [Why We Rebuilt Ethereum from Scratch](https://media.consensys.net/why-we-rebuilt-ethereum-from-scratch-9e38b6ebd4a2)
- [Privacy in Besu: How PegaSys Redefined Blockchain for Enterprises](https://www.youtube.com/watch?v=8l7SSZLyFL8)