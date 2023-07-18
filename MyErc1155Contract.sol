// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.19;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

contract BootcampNFT is  ERC1155 {

    uint256 tokenID = 0;

    constructor() ERC1155("BattleShip") {}

    function mintNFT(uint256 value) public {
        _mint(msg.sender, tokenID, value, "");
        tokenID += 1;
    }

}
