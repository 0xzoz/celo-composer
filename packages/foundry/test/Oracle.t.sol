// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {Oracle} from "src/Oracle.sol";

contract OracleTest is Test {
    Oracle oracle;

    function setUp() external {
        oracle = new Oracle();
    }

    function testGetLatestCeloPrice() external {
        uint256 expectedPrice = 123456;
        bytes32 dataFeedId = bytes32("CELO");
        vm.expectOracleQuery(dataFeedId, expectedPrice);
        uint256 actualPrice = oracle.getLatestCeloPrice();
        assertEq(actualPrice, expectedPrice);
    }
}