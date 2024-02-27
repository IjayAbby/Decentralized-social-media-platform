// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTFactory is ERC721 {
    uint256 private tokenId;

    constructor() ERC721("DecentralizedSocialMedia", "DSocial") {}
    

    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        tokenId++;
        _mint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);
        return tokenId;
    }
}
