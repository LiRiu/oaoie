// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

import {OAOIE} from "../src/OAOIE.sol";
import {IAIOracle} from "../src/IAIOracle.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import "../lib/forge-std/src/console.sol";

contract OAOIEScript is Script {
    IAIOracle internal constant aiOracle = IAIOracle(0xb880D47D3894D99157B52A7F869aB3B1E2D4349d);

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        OAOIE oaoie = new OAOIE(aiOracle);
        console.log(address(oaoie));

        vm.stopBroadcast();
    }
}
