# [OAOIE](https://github.com/LiRiu/IE)  [![License: AGPL-3.0-only](https://img.shields.io/badge/License-AGPL-black.svg)](https://opensource.org/license/agpl-v3/) [![solidity](https://img.shields.io/badge/solidity-%5E0.8.24-black)](https://docs.soliditylang.org/en/v0.8.24/) [![Foundry](https://img.shields.io/badge/Built%20with-Foundry-000000.svg)](https://getfoundry.sh/) ![tests](https://github.com/z0r0z/zenplate/actions/workflows/ci.yml/badge.svg)

**Onchain AI Oracle Intents Engine** (OAOIE): A Basic *Text-to-tx* Simulator Contract based on [ie](https://github.com/NaniDAO/ie) and [OAO](https://github.com/hyperoracle/OAO).

## Overview

Users describe the transaction they want in natural language, and OAOIE translates it into specific format and completes the corresponding contract call.

With the help of [opML](https://arxiv.org/pdf/2401.17555.pdf), the entire intent will be parsed and executed onchain.

1. User Intent => `"I want to send liriu 1 eth token"`.
2. opML LlaMA2 Intent Solving => `"send liriu 1 ETH"`.
3. OAOIE Onchain Call => `"address(liriu).transfer(1 ether)"`.

### 1) Send

Example intents:
- **I want to send 1 ETH to vitalik**
- **send vitalik 1 ETH**
- **send 1 ETH to/for vitalik**

aliases: *transfer*, *give*

### 2) Swap

Example intents:
- **I want to swap 20 ETH for 10 BTC**
- **swap 20 ETH for 10 BTC**

## Dev Guide

### Quick Start

```sh
git clone https://github.com/LiRiu/oaoie.git
cd oaoie && npm install
cp .env.example .env && vim .env # PRIVATE_KEY is required.
npm run test -- "I want to send liriu 1 eth token"
```

### Build

Run: `curl -L https://foundry.paradigm.xyz | bash && source ~/.bashrc && foundryup`

Build the foundry project with `forge build`. Run tests with `forge test`. Measure gas with `forge snapshot`. Format with `forge fmt`.

*Note:* Tests currently run on a fork of mainnet to check ENS properly.

## Disclaimer

*These smart contracts and testing suite are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of anything provided herein or through related user interfaces. This repository and related code have not been audited and as such there can be no assurance anything will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk.*

## License

See [LICENSE](./LICENSE) for more details.

## Thanks

- [Idea from z0r0zzz](https://twitter.com/z0r0zzz/status/1756126502179983625)
- [Initial Implementation by NaniDAO](https://github.com/NaniDAO/ie)
