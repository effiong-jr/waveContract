// SPDX-License-Identifier: UNLICENSED;

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    uint256 private seed;

    event NewWave(address indexed from, uint256 timestamp, string message);

    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    constructor() payable {
        console.log("It's time to roll the smart way!!!");

        seed = (block.timestamp + block.difficulty) % 100;
    }

    Wave[] waves;

    mapping(address => uint256) public lastWave;

    function wave(string memory _message) public {
        require(
            lastWave[msg.sender] + 15 minutes < block.timestamp,
            "Wait 15 minutes"
        );

        lastWave[msg.sender] = block.timestamp;

        totalWaves += 1;
        console.log("%s has waved!", msg.sender);
        waves.push(Wave(msg.sender, _message, block.timestamp));

        seed = (block.timestamp + block.difficulty) % 100;

        console.log("Random Number generated: ", seed);

        if (seed <= 50) {
            console.log("%s won!", msg.sender);

            uint256 priceAmount = 0.0001 ether;
            require(
                priceAmount <= address(this).balance,
                "Trying to withdraw more than the contract balance"
            );

            (bool success, ) = (msg.sender).call{value: priceAmount}("");

            require(success, "Failed to withdraw money from the contract");
        }

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves.", totalWaves);
        return totalWaves;
    }
}
