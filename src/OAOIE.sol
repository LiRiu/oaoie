// ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘
// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;
import {AIOracleCallbackReceiver} from "./AIOracleCallbackReceiver.sol";
import {IAIOracle} from "./IAIOracle.sol";
import {IE} from "./IE.sol";
import "../lib/forge-std/src/console.sol";

contract OAOIE is AIOracleCallbackReceiver, IE {

    /// =========================== CONSTANTS =========================== ///

    uint64 private constant AIORACLE_CALLBACK_GAS_LIMIT = 5000000;

    /// =========================== EVENTS =========================== ///

    event CallbackOperationResult(
        uint256 modelId,
        bytes input,
        bytes output,
        bytes32 action,
        string p0,
        string p1,
        string p2
    );

    /// ======================== CONSTRUCTOR ======================== ///

    constructor(IAIOracle _aiOracle) AIOracleCallbackReceiver(_aiOracle) {}

    /// ===================== OAO CALLBACK EXECUTION ===================== ///
    function OAOCallback(
        uint256 modelId,
        bytes calldata input,
        bytes calldata output
    ) external onlyAIOracleCallback {
        string calldata intent = string(output);
        Operation memory op = command(intent);
        emit CallbackOperationResult(
            modelId,
            input,
            output,
            op.action,
            op.p0,
            op.p1,
            op.p2
        );
    }

    function calculateAIResult(string calldata prompt) external payable {
        bytes memory input = bytes(prompt);
        aiOracle.requestCallback(
            1, input, address(this), this.OAOCallback.selector, AIORACLE_CALLBACK_GAS_LIMIT
        );
    }
}
