// SPDX-License-Identifoaoier: AGPL-3.0-only
pragma solidity ^0.8.19;

import {OAOIE} from "../src/OAOIE.sol";
import {Test} from "../lib/forge-std/src/Test.sol";
import {IAIOracle} from "../src/IAIOracle.sol";
import "../lib/forge-std/src/console.sol";

contract IETest is Test {
    address internal constant DAO = 0xDa000000000000d2885F108500803dfBAaB2f2aA;

    address internal constant ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;
    address internal constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address internal constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address internal constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address internal constant SUSHI = 0x6B3595068778DD592e39A122f4f5a5cF09C90fE2;
    address internal constant UNI = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
    address internal constant USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address internal constant OMG = 0xd26114cd6EE289AccF82350c8d8487fedB8A0C07;

    address internal constant VITALIK_DOT_ETH = 0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045;
    address internal constant LIRIU_DOT_ETH = 0x77C6d4c010EaeF7C0dC0080F78ded522AB58A926;
    address internal constant NANI_DOT_ETH = 0x7AF890Ca7262D6accdA5c9D24AC42e35Bb293188;

    address internal constant USDC_WHALE = 0xD6153F5af5679a75cC85D8974463545181f48772;
    address internal constant DAI_WHALE = 0x075e72a5eDf65F0A5f44699c7654C1a76941Ddc8;

    address internal constant OAO_ADDRESS = 0xb880D47D3894D99157B52A7F869aB3B1E2D4349d;

    OAOIE internal oaoie; // Intents Engine.

    function setUp() public payable {
        vm.createSelectFork(vm.rpcUrl("sepo")); // Ethereum mainnet fork.
        oaoie = new OAOIE(IAIOracle(OAO_ADDRESS));
        vm.prank(DAO);
        oaoie.setName(ETH, "ETH");
        vm.prank(DAO);
        oaoie.setName(ETH, "ether");
        vm.prank(DAO);
        oaoie.setName(ETH, "ethereum");
        vm.prank(DAO);
        oaoie.setName(DAI, "DAI");
        vm.prank(DAO);
        oaoie.setName(USDC, "USDC");
        vm.prank(DAO);
        oaoie.setName(WETH, "WETH");
        vm.prank(DAO);
        oaoie.setName(WETH, "wrapped eth");
        vm.prank(DAO);
        oaoie.setName(WETH, "wrapped ether");
        vm.prank(DAO);
        oaoie.setName(SUSHI, "SUSHI");
        vm.prank(DAO);
        oaoie.setName(UNI, "UNI");
        vm.prank(DAO);
        oaoie.setName(USDT, "USDT");
        vm.prank(DAO);
        oaoie.setName(USDT, "tether");
        vm.prank(DAO);
        oaoie.setName(OMG, "omg");
    }

    function testDeploy() public payable {
        new OAOIE(IAIOracle(0xb880D47D3894D99157B52A7F869aB3B1E2D4349d));
    }

    function testIENameSetting() public payable {
        assertEq(oaoie.tokens("uni"), UNI);
    }

    function testOAOCallbackSendETH() public payable {
      uint256 lBal = LIRIU_DOT_ETH.balance;
      console.log(lBal);
      uint256 vBal = VITALIK_DOT_ETH.balance;
      console.log(vBal);

      vm.prank(VITALIK_DOT_ETH);
      oaoie.calculateAIResult{value: 1 ether }("send liriu 1 ETH");

      vm.prank(OAO_ADDRESS);
      oaoie.OAOCallback(1, "input", "send liriu 1 ETH");

      lBal = IERC20(USDC).balanceOf(LIRIU_DOT_ETH);
      console.log(lBal);
    }
}

interface IERC20 {
    function approve(address, uint256) external; // unsafe lol.
    function balanceOf(address) external view returns (uint256);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function transfer(address to, uint256 amount) external returns (bool);
}
