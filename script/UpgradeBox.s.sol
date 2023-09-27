//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "@foundry-devops/DevOpsTools.sol";
import {BoxV2} from "../src/BoxV2.sol";
import {BoxV1} from "../src/BoxV1.sol";

contract UpgradeBox is Script {
    function run() external returns (address) {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("ERC1967Proxy", block.chainid);
        vm.startBroadcast();
        BoxV2 newBox = new BoxV2(); // implementation logic
        vm.stopBroadcast();
        address proxy = upgradeBox(mostRecentlyDeployed, address(newBox));
        return proxy;
    }

    function upgradeBox(address proxyAddress, address newImplementation) internal returns (address) {
        vm.startBroadcast();
        BoxV1 proxy = BoxV1(proxyAddress);
        proxy.upgradeTo(newImplementation); // proxy contract now points to new address
        vm.stopBroadcast();
        return address(proxy);
    }
}
