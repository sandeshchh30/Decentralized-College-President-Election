//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Vote{ 
    mapping(string => bool) public isVoted;
    mapping(string => bool) public isContested;
    mapping(string => uint) public voteCount;

    address public owner;

    struct Contestant{
        string name;
        string rollNo;
        uint cgpa;
    }

    Contestant[] public contestants;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    modifier isNotContestant(string memory _rollNo){
        require(!isContested[_rollNo]);
        _;
    }

    modifier hasNotVoted(string memory _rollNo){
        require(!isVoted[_rollNo]);
        _;
    }

    function addCanditate(string memory _name, string memory _rollNo, uint _cgpa) public onlyOwner isNotContestant(_rollNo){
        contestants.push(Contestant(_name, _rollNo, _cgpa));
        isContested[_rollNo] = true;
    }

    function vote(string memory _rollNo, string memory _myRollNO) public hasNotVoted(_myRollNO){
        voteCount[_rollNo]++;
        isVoted[_myRollNO] = true;
    }

    function winner() public view returns(Contestant memory){
        Contestant memory winnerCandidate;
        uint highestVote = 0;

        for (uint i=0; i<contestants.length; i++){
            if(voteCount[contestants[i].rollNo] > highestVote){
                winnerCandidate = contestants[i];
                highestVote = voteCount[winnerCandidate.rollNo];
            }
        }
        return winnerCandidate;
    }

    function getArray() public view returns (Contestant[] memory) {
        return contestants;
    }
}