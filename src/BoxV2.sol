//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract BoxV2 is
    Initializable,
    UUPSUpgradeable,
    OwnableUpgradeable // only UUPSUpgradeable is mendatory for upgradeability
{
    uint256 private number;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers(); // we don't want the implementation to be initialized but the proxy
    }

    function initalize() public initializer {
        __Ownable_init(); // sets owner to msg.sender (owner of proxy)
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 2;
    }

    function setNumber(uint256 _number) external {}

    function _authorizeUpgrade(address newImplementation) internal override onlyOwner {}
}
