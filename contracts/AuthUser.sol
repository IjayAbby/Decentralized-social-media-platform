// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract Authentication {
    mapping(address => bool) public authenticatedUsers;

    function authenticate() public {
        authenticatedUsers[msg.sender] = true;
    }

    function isAuthenticated(address user) public view returns (bool) {
        return authenticatedUsers[user];
    }
}
