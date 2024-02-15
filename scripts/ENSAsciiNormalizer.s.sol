// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import {ENSAsciiNormalizer, ENS} from "../src/ENSAsciiNormalizer.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract IEDeploy is Script {
    address internal constant ENS_ADDRESS =
        0x00000000000C2E074eC69A0dFb2997BA6C7d2e1e;
    address internal constant LIRIU =
        0x77C6d4c010EaeF7C0dC0080F78ded522AB58A926;

    bytes internal constant asciiMAP =
        hex"2d00020101000a010700016101620163016401650166016701680169016a016b016c016d016e016f0170017101720173017401750176017701780179017a06001a010500";

    ENSAsciiNormalizer internal ens; // Intents Engine.

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        ens = new ENSAsciiNormalizer(ENS(ENS_ADDRESS), asciiMAP);
        console.log(address(ens));

        vm.stopBroadcast();
    }
}
