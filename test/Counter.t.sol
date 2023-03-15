// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {SetupScript} from "../src/SetupScript.sol";

contract CounterTest is SetupScript {

    function setUp() public {
        setUpContracts();
    }

    function testIncrement() public {
        counter.increment();
    }

    function testSetNumber(uint256 x) public {
        vm.assume(x<10);
        counter.setNumber(x);
    }
}
