// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract CommunityContent {
    struct Community {
        uint256 id;
        string name;
        string description;
        uint256 creationTime;
    }

    struct Content {
        uint256 id;
        address creator;
        string contentURI;
        uint256 creationTime;
        uint256 communityId; // Link to the community
    }

    struct Comment {
        uint256 id;
        address author;
        string text;
        uint256 timestamp;

    }

    // Example: Mapping for communities and content
    mapping(uint256 => Community) public communities;
    mapping(uint256 => Content) public contents;
    mapping(uint256 => Comment[]) public comments;


    uint256 private nextCommunityId =  0;
    uint256 private nextContentId =  0;

    function createCommunity(string memory _name, string memory _description) public {
        communities[nextCommunityId] = Community(nextCommunityId, _name, _description, block.timestamp);
        nextCommunityId++;
    }

    function addContent(uint256 _communityId, string memory _contentURI) public {
        require(_communityId < nextCommunityId, "Invalid community ID");
        contents[nextContentId] = Content(nextContentId, msg.sender, _contentURI, block.timestamp, _communityId);
        nextContentId++;
    }

    function commentContent(uint256 _contentId, string memory _text) public {
        require(_contentId < nextContentId, "Invalid content ID");
        comments[_contentId].push(Comment(comments[_contentId].length, msg.sender, _text, block.timestamp));
    }


}
