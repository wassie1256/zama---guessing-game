// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GuessingGame {
    uint8 private answer;
    address public owner;
    bool public isActive;

    event Guessed(address indexed player, uint8 guess, bool correct);
    event GameStarted(uint8 answer);
    event GameEnded();

    constructor(uint8 _answer) {
        owner = msg.sender;
        answer = _answer;
        isActive = true;
        emit GameStarted(_answer);
    }

    function guess(uint8 _guess) public returns (bool) {
        require(isActive, "Game is not active");
        bool correct = (_guess == answer);
        if (correct) {
            isActive = false;
            emit GameEnded();
        }
        emit Guessed(msg.sender, _guess, correct);
        return correct;
    }

    function revealAnswer() public view returns (uint8) {
        require(!isActive, "Game is still active");
        return answer;
    }
}
