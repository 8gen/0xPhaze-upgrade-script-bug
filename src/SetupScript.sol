// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Counter} from "./Counter.sol";
import {UpgradeScripts} from "upgrade-scripts/UpgradeScripts.sol";

contract SetupScript is UpgradeScripts {
    Counter counter;

    function setUpContracts() internal {
        // encodes constructor call: `ExampleNFT(1)`
        bytes memory constructorArgs = abi.encode(uint256(1));
        address implementation = setUpContract("Counter", constructorArgs);

        bytes memory initCall = abi.encodeCall(Counter.init, ());
        address proxy = setUpProxy(implementation, initCall);

        counter = Counter(proxy);
    }

    function integrationTest() internal view {
        require(counter.owner() == msg.sender);
    }
}
