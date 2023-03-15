// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0 <0.9.0;
import {OwnableUDS} from "UDS/auth/OwnableUDS.sol";
import {UUPSUpgrade} from "UDS/proxy/UUPSUpgrade.sol";

import {Lib} from "./library/Lib.sol";

contract Counter is UUPSUpgrade, OwnableUDS {
    uint256 public immutable version;
    uint256 public number;

    constructor(uint256 version_) {
        version = version_;
    }

    function init() external initializer {
        __Ownable_init();
    }

    function _authorizeUpgrade(address) internal override onlyOwner {}

    function setNumber(uint256 newNumber) public {
        number = newNumber + Lib.x();
    }

    function increment() public {
        number++;
    }
}
