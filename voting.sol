pragma solidity ^0.5.0;

contract votingContract{
    
    constructor() public {
        
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, "A", 0);
        
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, "B", 0);
    }
    
    struct Candidates {
        uint candidateNumber;
        string candidateName;
        int voteCount;
    }

    uint private numberOfCandidates = 0;
    
    mapping(uint=>Candidates) private candidates;
    
    function addCandidate(string memory candidateName) public {
        numberOfCandidates++;
        candidates[numberOfCandidates] = Candidates(numberOfCandidates, candidateName, 0);
    }
    
    function getCandidate(uint candidateNumber) view public returns(uint, string memory) {
        return(
            candidates[candidateNumber].candidateNumber,
            candidates[candidateNumber].candidateName
        );
    }
    
    function voteTo(uint candidateNumber) public {
        candidates[candidateNumber].voteCount++;
    }
    
    function getLeadingCandidate() view public returns(string memory) {
        bool isTie = false;
        uint c_id = 1;
        int c_vote_count = candidates[c_id].voteCount;

        for(uint i=1; i<numberOfCandidates; i++) {
            if(candidates[i].voteCount > c_vote_count) {
                c_id = i;
                c_vote_count = candidates[i].voteCount;
            }
        }
        return candidates[c_id].candidateName;
    }
}
