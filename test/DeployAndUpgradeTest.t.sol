//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";
import {DeployBox} from "../script/DeployBox.s.sol";
import {UpgradeBox} from "../script/UpgradeBox.s.sol";

contract DeployAndUpgradeTest is Test {
    DeployBox public deployer;
    UpgradeBox public upgrader;
    address public OWNER = makeAddr("OWNER");
    BoxV1 public boxV1;
    BoxV2 public boxV2;

    function setUp() external {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        boxV1 = BoxV1(deployer.run());
    }

    function testUpgrades() public {
        BoxV2 boxV2 = new BoxV2();
    }
}
