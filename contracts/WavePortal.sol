// SPDX-License-Identifier: UNLICENSED;

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    address[] addressCount;

    constructor() {
        console.log("It's time to roll the smart way!!!");
    }

    function wave() public {
        totalWaves += 1;
        addressCount.push(msg.sender);
        console.log("%s has waved!", msg.sender);
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }

    function getAddressCount() public view returns (address[] memory) {
        console.log("%d addresses in total", addressCount.length);
        return addressCount;
    }
}
