// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TGE is ERC20 {
    address payable public owner;

    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        owner = payable(msg.sender);
        _mint(owner, initialSupply * (10**decimals()));
    }
}

contract TokenFactory {
    address[] public createdTokens;

    // This function will create new TGE tokens and return their address
    function createToken(string memory name, string memory symbol, uint256 initialSupply) public returns (address) {
        TGE newToken = new TGE(name, symbol, initialSupply);
        createdTokens.push(address(newToken));
        return address(newToken);
    }

    function getCreatedTokens() public view returns (address[] memory) {
        return createdTokens;
    }
}
