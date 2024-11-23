// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "./fhevm/lib/TFHE.sol";

contract TimeCapsule {
    Message[] public messages;

    function unlockCapsule(uint256 capsuleId) public {}

    function placeCapsule(
        string memory _message,
        uint256 _unlockTime
    ) public returns (uint256 capsuleId) {
        messages.push(Message(_message, msg.sender, _unlockTime));
        return messages.length - 1;
    }

    function getCapsules() public view returns (Message[] memory) {
        address owner = msg.sender;
        Message[] memory userMessages = new Message[](5);

        for (uint256 i = 0; i < messages.length; i++) {
            if (messages[i].owner == owner) {
                userMessages[i] = messages[i];
            }
        }
        return userMessages;
    }
}

struct Message {
    string message;
    address owner;
    uint256 unlockTime;
}
