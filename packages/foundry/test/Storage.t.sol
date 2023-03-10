// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

import {Storage} from "src/Storage.sol";

contract StorageTest is Test {
    using stdStorage for StdStorage;

    Storage storageContract;

    function setUp() external {
        storageContract = new Storage();
    }

    function testStoreAndRetrieve() external {
        uint256 expected = 42;

        // Store the number
        storageContract.store(expected);

        // Check that the number was stored correctly
        assertEq(storageContract.retrieve(), expected);

        // Store a different number
        expected = 123;
        storageContract.store(expected);

        // Check that the new number was stored correctly
        assertEq(storageContract.retrieve(), expected);
    }
}