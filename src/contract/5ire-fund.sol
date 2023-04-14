// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract FireFund {

    struct UserMessage {
        string message;
        uint256 amount;
        uint256 timestamp;
    }

    struct UserDetails {
        string cid;
        address payable userAddress;
    }

    mapping(string => UserMessage[]) private _messagesByUsername;

    mapping(string => UserDetails) private _cidByUsername;

    function getProfile(string memory username) public view returns (UserDetails memory) {
        require(bytes(username).length > 0, "Username cannot be empty");
        return _cidByUsername[username];
    }

    function createProfile(string memory username, string memory cid, address payable userAddress) public {
        require(bytes(username).length > 0, "Username cannot be empty");
        require(bytes(cid).length > 0, "CID cannot be empty");

        _cidByUsername[username] = UserDetails(cid, userAddress);
    }

    function addMessage(string memory username, string memory message, uint256 amount) public payable {
        require(bytes(username).length > 0, "Username cannot be empty");
        require(bytes(message).length > 0, "Message cannot be empty");
        require(msg.value == amount, "Incorrect amount sent");

        _cidByUsername[username].userAddress.transfer(msg.value);
        _messagesByUsername[username].push(UserMessage(message, amount, block.timestamp));
    }

    function getAllMessages(string memory username) public view returns (UserMessage[] memory) {
        require(bytes(username).length > 0, "Username cannot be empty");
        
        UserMessage[] storage messages = _messagesByUsername[username];
        uint256 messagesLength = messages.length;
        
        UserMessage[] memory all_messages = new UserMessage[](messagesLength);
        
        for (uint256 i = 0; i < messagesLength; i++) {
            all_messages[i] = messages[i];
        }
        
        return all_messages;
    }
    
}