---
layout: post
title: Building DApps with Solidity and Web3j
subtitle: Part 1
tags: research
description: TODO
keywords:
  - blockchain,
  - ethereum,
  - decentralized applications,
  - tutorial,
  - ganache,
image: https://www.cesarsotovalero.net/img/posts/rabbit_cover.jpg
share-img: https://www.cesarsotovalero.net/img/posts/rabbit_cover.jpg
show-avatar: false
date: 2021/11/07
author: cesarsotovalero
published: false
---
TODO

<figure class="jb_picture">
  {% responsive_image path: img/posts/rabbit.jpg alt: "Be cautious as a rabbit, jump into it only if you have good reasons to do so." %}
  <figcaption class="stroke">
    &#169; Be cautious as a rabbit, jump into it only if you have good reasons to do so. Photo taken at <a href="https://goo.gl/maps/mTGw7xjKpzvVeCk7A">Tessinparken</a>.
    </figcaption>
</figure>


# Use cases
Hyperledger Besu can be used to connect to the existing public Ethereum network, referred to as mainnet, and can be used to create the Ethereum Virtual Machine (EVM) compatible private blockchain network. Hyperledger Besu can be used to run a node on Ethereum mainnet, from a full node that helps sync Ethereum mainnet, to an archive node, which contains the data of the blockchain but does not participate in adding new blocks.

An example of using Hyperledger Besu to create a private network would be to create a unified loyalty rewards program across multiple brands. In this example, each retailer would run their own node, submitting transactions to the private blockchain when customers make purchases. The rewarded points would accrue to a customer address, allowing the customer to accrue and use points across brands or vendors. An example of this case study can be found on the Hyperledger website, explaining how a loyalty platform is built using Hyperledger Besu.

Another use case would be public, permissioned EVM compatible blockchain for organizations looking to host blockchain infrastructure but allow nodes to join the network provided they agree to certain conditions, for example certain regulations or standards that may not be present on Ethereum mainnet. LACChain, a project of the IDB Lab, is an example of such a blockchain network. Specifically created to encourage the use of distributed ledger technology in the countries of Latin America and the Caribbean, it has 50 organizations participating in the network, running 82 nodes as of May 2021. The blockchain is a general purpose blockchain, similar to Ethereum mainnet, but has compliance with the standards set for by the International Standards Organization’s Technical Committee 307 (ISO / TC 307). For a look into the infrastructure, smart contracts, and features of LACChain, see the LACChain GitHub repository.


# Requirements

On Linux, you need to:
- Download Besu
- Ensure you have Java 11+ installed

# Getting Java

Install Java:
sudo apt install openjdk-jre-headless
java --version

## Getting besu

Clone the Hyperledger/besu repo to your home directory
git clone --recursive https://github.com/hyperledger/besu.git

Build Besu with the Gradle wrapper gradlew, omitting tests as follows:
./gradlew build -x test

Go to the distribution directory:
cd build/distributions/

Expand the distribution archive:
tar -xzf besu-<version>.tar.gz

Move to the expanded folder and display the Besu help to confirm installation.
cd besu-<version>/
bin/besu --help



bin/besu --help

/bin/besu --version


# Use flags and subcommands to specify specific options for Hyperledger Besu.

Options and subcommands can be stored in what we call a configuration file, or config file. This file allows for the specifications of initial parameters for Besu, and gives us a file where we can save those parameters in the event we want to reuse them.

Config files are in the TOML format. An example config file is shown below. Comments are displayed after a # symbol, and provide context what each line does.


```TOML
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
#
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

```


A few key points to understand. Within the config file, each option will not have the leading dashes that would be present if these options or subcommands were called directly from the command line. Make sure that the format of the config file displayed above is followed. The comments are optional, but can help understand how the config file is set up, which is especially useful if you are trying to remember the configuration for a specific network.

The configuration file should be saved as config.toml.

To start a network using the config file, go to the command line and use the besu command with the option --config-file=<file-path>/config.toml.

For example, this would look like:

besu --config-file=/home/me/me_node/config.toml

To see all options that can be used in the config file or via the command line interface can be found in the "Hyperledger Besu Command Line" article.

For more information, please see the Hyperledger Besu Documentation, "Using the Hyperledger Besu Configuration File".


---



The first block in a blockchain is called the genesis block. Ethereum mainnet’s genesis block - block 0 - was mined on July 30, 2015. In order to join or create any network, the data for the genesis block must be included. Therefore, the genesis file defines the data that is in the first block of a blockchain, as well as rules for the blockchain itself. If a new node or validator attempts to join the blockchain, it will use the genesis file as the starting point in recreating the history of the chain in order to synchronize with the existing network.

The genesis file for Ethereum mainnet, along with the supported testnets, is included in the download of Besu. When creating a private network, a genesis file must be provided. The genesis file is a JSON formatted file. It looks like the below:
```json

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


```


---

In this specific example, the genesis file is for an IBFT 2.0 private network.
```json

{
"config": {
"chainId": 2018,
"muirglacierblock": 0,
"ibft2": {
"blockperiodseconds": 2,
"epochlength": 30000,
"requesttimeoutseconds": 4
}

```

The config key section contains the following information about the blockchain:

"chainId": 2018
The chain ID controls the transaction signature process, providing a unique identifier to allow for the hashing of signed transactions to only work on the network associated with the corresponding chain ID. Ethereum Improvement Proposal 155 (EIP-155) provides more information on the rationale behind the chain ID. Most chain IDs match the network ID of the network. In this case, 2018 refers to the chain ID associated with a development chain. For a list of the network and chain IDs, please see the Hyperledger Besu Documentation, "Network ID and Chain ID".

"muirglacierblock": 0,
This field is called a “milestone block”. Muir Glacier refers to a specific network upgrade that occurred at block 9,200,000 on Ethereum mainnet. For private networks, like the one that is being created in this example, the name of the latest milestone block can be listed, and set to be the genesis block. Here you can see a continuously updated list of network upgrades and the associated blocks for Ethereum.

"ibft2":
This specifies that the consensus protocol for the blockchain is IBFT 2.0. The options available for specifying the consensus mechanism are available in the Hyperledger Besu Documentation, with an overview of the proof-of-authority (PoA) consensus protocols available here.

Within the specification, the following three fields are provided:

"blockperiodseconds": 2,
The minimum block time, in seconds. In this case, after two seconds, a new block will be proposed by the network.

"epochlength": 30000,
The number of blocks at which to reset all votes. The votes refer to validators voting to add or remove validators to the network. In this case, after 30,000 blocks are created, this IBFT 2.0 network will discard all pending votes collected from received blocks. Existing proposals remain in effect and validators re-add their vote the next time they create a block.

"requesttimeoutseconds": 4
The time by which a new block must be proposed or else a new validator will be assigned by the network. If a validator goes down, the request time out ensures that proposal of a new block passes on to another validator. The request time out seconds should be set to be double the minimum block time (blockperiodseconds), hence why it is 4.

---

The second section, starting with "nonce": "0x0", contains information about the genesis block:

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

"nonce": "0x0",
The number used once aka nonce, that is a part of the blockheader for the first block. Set to 0x0.

"timestamp": "0x58ee40ba",
The creation date and time of the block. Often it can be set to 0x0, but as long as it is any value in the past, it will work. In this case 0x58ee40ba is a hexadecimal which converts to 1492009146 and represents Wed Apr 12 2017 14:59:06 GMT+0000.

"extraData": "0xf83ea00000000000000000000000000000000000000000000000000000000000000
000d5949811ebc35d7b06b3fa8dc5809a1f9c52751e1deb808400000000c0",
Extra data is a recursive length prefix (RLP) encoded string (which is space efficient) containing the validator address of the IBFT 2.0 private network. Instructions on how to create an RLP using Besu can be found in the Hyperledger Besu Documentation, "Extra Data".

"gasLimit": "0x1fffffffffffff",
The block gas limit, which is the total gas limit for all transactions included in a block. It defines how large the block size can be for the block, and is represented by an hexadecimal string. For this network, the gas limit is the maximum size, and is therefore a “free gas network”.

"difficulty": "0x1",
The difficulty of creating a new block. Represented as a hexadecimal string, the difficulty is set to 1, effectively the lowest difficulty.

"mixHash": "0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365",
The mixHash is the unique identifier for the block, which for this genesis file is 0x63746963616c2062797a616e74696e65206661756c7420746f6c6572616e6365.

"coinbase": "0x0000000000000000000000000000000000000000",
The coinbase account, which is where all block rewards for this network will be paid. In this case it is to 0x0000000000000000000000000000000000000000, which is sometimes called address(0) or the zero address.

"alloc": {
"9811ebc35d7b06b3fa8dc5809a1f9c52751e1deb": {
"balance": "0xad78ebc5ac6200000"
The alloc field creates an address on our network, which is sometimes also referred to as an externally owned account, as it is an account not associated with a smart contract (referred to as a contract account). The number starting with “98” is the public key of the address. The balance can be passed in as a decimal OR a hexadecimal (like it has in this case and corresponds to 200 ETH, or 2*10^20 Wei). The balance is always in Wei, or 10^-18 Ether.

Once you have created your genesis file, you will save it within the directory where your blockchain networks files will be kept. Do not save it within any of the Node or data folders, but rather at the top level. When it is time to start your network, you will use the flag:

--genesis-file=../genesis.json

To start up your network using the genesis file.

This looks like:

besu --genesis-file=../genesis.json