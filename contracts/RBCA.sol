// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RoleBasedAccessControl is AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function mintNFT(address recipient, string memory tokenURI) public onlyRole(MINTER_ROLE) returns (uint256) {
        // Call NFTFactory contract to mint NFT
        // Return the token ID
    }
    
}
