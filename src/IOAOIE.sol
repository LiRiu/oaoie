// ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘ ⌘
// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.19;

interface IOAOIE {
    event CallbackOperationResult(
        uint256 modelId,
        bytes input,
        bytes output,
        bytes32 action,
        string p0,
        string p1,
        string p2
    );

    function OAOCallback(
        uint256 modelId,
        bytes calldata input,
        bytes calldata output
    ) external;

    function calculateAIResult(string calldata prompt) external payable;
}
