// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract voting{
    string[] private c1 = ["abc","xyz"];
    uint[] private c1Votes = [0,0];
    address[] voted;
    uint index = 1;

    function listCandidate() public view returns (string[] memory)
    {
        return (c1); 
    }
     function vote(uint256 candidateIndex) public {
        address useradd = msg.sender;
        require(candidateIndex < c1.length, "Invalid candidate index");
        if (candidateIndex == 0) {
            c1Votes[0]++;   
            voted.push(useradd);
        } else if (candidateIndex == 1) {
            c1Votes[1]++;
        }
    }
     function getCandidate(uint256 candidateIndex) public view returns (uint) {
        require(candidateIndex < c1.length, "Invalid candidate index");
        if (candidateIndex == 0) {
            return (c1Votes[0]);
        } else if (candidateIndex == 1) {
            return (c1Votes[1]);
        }
    }
    function result() public view returns (string memory)
    {
        if (c1Votes[0] > c1Votes[1]) {
            return c1[0];
        }
        else if(c1Votes[0]<c1Votes[1])
        {
            return c1[1];
        }
        else if (c1Votes[0] == c1Votes[1]) {
            
        string memory message = "Voting ended in draw!";
            return message;
        }
    }
    function simulateVotes() public {
    address useradd = msg.sender;
    uint256 candidateIndex;
    for (uint i = 0; i < 200; i++) {
        candidateIndex = uint256(keccak256(abi.encodePacked(block.timestamp, i, useradd))) % 2;
        vote(candidateIndex);
    }
}



    // let i = await voting.deployed()
}