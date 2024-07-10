// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract JASToken is ERC20, Ownable {
    constructor() ERC20("JAS Token", "JAS") {
        //John Angelo Sagum
        _mint(msg.sender, 1_000_000_000 * 10 ** decimals());
    }

    // John Angelo Sagum
    function createTokens(address recipient, uint256 amount) external onlyOwner {
        _mint(recipient, amount);
    }

    
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }


    function destroyTokens(uint256 amount) external {
        _burn(_msgSender(), amount);
    }
}
