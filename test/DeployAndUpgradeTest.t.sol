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
    address public proxyAddress;

    function setUp() external {
        deployer = new DeployBox();
        upgrader = new UpgradeBox();
        proxyAddress = deployer.run(); // right now, points to BoxV1
    }

    function testProxyStartsAsBoxV1() public {
        vm.expectRevert();
        BoxV2(proxyAddress).setNumber(7); // because setNumber doesn't exist in BoxV1
    }

    function testUpgrades() public {
        BoxV2 boxV2 = new BoxV2();
        upgrader.upgradeBox(proxyAddress, address(boxV2));
        uint256 expectedValue = 2;
        assertEq(expectedValue, BoxV2(proxyAddress).version());
        BoxV2(proxyAddress).setNumber(7);

        assertEq(7, BoxV2(proxyAddress).getNumber());
    }
}
