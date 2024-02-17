# [OAOIE](https://github.com/LiRiu/IE)  [![License: AGPL-3.0-only](https://img.shields.io/badge/License-AGPL-black.svg)](https://opensource.org/license/agpl-v3/) [![solidity](https://img.shields.io/badge/solidity-%5E0.8.24-black)](https://docs.soliditylang.org/en/v0.8.24/) [![Foundry](https://img.shields.io/badge/Built%20with-Foundry-000000.svg)](https://getfoundry.sh/) ![tests](https://github.com/z0r0z/zenplate/actions/workflows/ci.yml/badge.svg)

The **Onchain AI OracleA Intents Engine** (IE): A Basic *Text-to-tx* Simulator Contract based on [OAO](https://github.com/hyperoracle/OAO).

## Uses

```sh
git clone https://github.com/LiRiu/oaoie.git
cd oaoie && npm install
cp .env.example .env && vim .env # PRIVATE_KEY is required.
npm run test -- "I want to send liriu 1 eth token"
```

## Command Syntax (⌘)

Users describe the transaction they want to send in natural language, and OAOIE translates it into a specific command format and completes the corresponding contract invocation. With the help of opML, the entire command is intelligently parsed and executed on-chain.

`"I want to send liriu 1 eth token"`
↓(opML)
`"send liriu 1 ETH"`
↓(OAOIE)
`"address(liriu).transfer(1 ether)"`

### Send
- *V0*

*Words: 4*

[action] [object] [value] [asset]
- **send vitalik 1 ETH**

*Words: 5*

[action] [value] [asset] [to/for] [object]
- **send 1 ETH to/for vitalik**

aliases: *transfer*, *give*

### Swap
- *V1*

## Build

Run: `curl -L https://foundry.paradigm.xyz | bash && source ~/.bashrc && foundryup`

Build the foundry project with `forge build`. Run tests with `forge test`. Measure gas with `forge snapshot`. Format with `forge fmt`.

*Note:* Tests currently run on a fork of mainnet to check ENS properly.

## Disclaimer

*These smart contracts and testing suite are being provided as is. No guarantee, representation or warranty is being made, express or implied, as to the safety or correctness of anything provided herein or through related user interfaces. This repository and related code have not been audited and as such there can be no assurance anything will work as intended, and users may experience delays, failures, errors, omissions, loss of transmitted information or loss of funds. The creators are not liable for any of the foregoing. Users should proceed with caution and use at their own risk.*

## License

See [LICENSE](./LICENSE) for more details.
