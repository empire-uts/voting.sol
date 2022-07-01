// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract Shogun {
    uint256 latestVoteNumber;
    uint256 productCount;
    uint256 prizeA;
    uint256 prizeLogic;
    bool votable;
    uint256 voteLimite;
    bool passwardExists;
    string passward;
    
    event viewVote(string product);
    event mostVotedProject(mostVoted);

    constructor {
        latestVoteNumber = 0;
        votable = false;
    }

    struct VoteName{
        uint voteNumber;
        uint voteName;
    }

    struct WhoseVote {
        string product;
        address owner;
    }


    struct VotingCount {
        address voter;
        uint count;
        string voteFirst;
        string voteSecond
        string voteThird
    }

    struct Vote {
        string product;
        address voter; 
    }


    struct Voted {
        string product;
        uint256 votedCount;
    }


    VoteName[] public voteName;
    WhoseVote[] public whoseVote;
    VotingCount[] public votingCount;
    Vote[] public vote;
    mapping(string => uint) public showVoteCount;
    Voted[] public voted;
    mapping(string => uint256) public productMap;
    address[][26] public addressArray;
    address[][26] public allPerticipantsAddressArray;

    function makeVote(
        string _a,
        string _b,
        string _c,
        string _d,
        string _e,
        string _f,
        string _g,
        string _h,
        string _i,
        string _j,
        string _k,
        string _l,
        string _m,
        string _n,
        string _o,
        string _p,
        string _q,
        string _r,
        string _s,
        string _t,
        string _u,
        string _v,
        string _w,
        string _x,
        string _y,
        string _z,
        string _voteName,
        uint256 _productCount,
        uint256 _prizeA,
        uint256 _prizeLogic,
        uint256 _voteLimit,
        bool _passwardExists,
        string _passward
    ) {
        require(votable = false, "an other vote exists")
        if(_a !== "") {whoseVote.push(_a, msg.sender);productMap(_a) = 0;}
        if(_b !== "") {whoseVote.push(_b, msg.sender);productMap(_b) = 1;}
        if(_c !== "") {whoseVote.push(_c, msg.sender);productMap(_c) = 2;}
        if(_d !== "") {whoseVote.push(_d, msg.sender);productMap(_d) = 3;}
        if(_e !== "") {whoseVote.push(_e, msg.sender);productMap(_e) = 4;}
        if(_f !== "") {whoseVote.push(_f, msg.sender);productMap(_f) = 5;}
        if(_g !== "") {whoseVote.push(_g, msg.sender);productMap(_g) = 6;}
        if(_h !== "") {whoseVote.push(_h, msg.sender);productMap(_h) = 7;}
        if(_i !== "") {whoseVote.push(_i, msg.sender);productMap(_i) = 8;}
        if(_j !== "") {whoseVote.push(_j, msg.sender);productMap(_j) = 9;}
        if(_k !== "") {whoseVote.push(_k, msg.sender);productMap(_k) = 10;}
        if(_l !== "") {whoseVote.push(_l, msg.sender);productMap(_l) = 11;}
        if(_m !== "") {whoseVote.push(_m, msg.sender);productMap(_m) = 12;}
        if(_n !== "") {whoseVote.push(_n, msg.sender);productMap(_n) = 13;}
        if(_o !== "") {whoseVote.push(_o, msg.sender);productMap(_o) = 14;}
        if(_p !== "") {whoseVote.push(_p, msg.sender);productMap(_p) = 15;}
        if(_q !== "") {whoseVote.push(_q, msg.sender);productMap(_q) = 16;}
        if(_r !== "") {whoseVote.push(_r, msg.sender);productMap(_r) = 17;}
        if(_s !== "") {whoseVote.push(_s, msg.sender);productMap(_s) = 18;}
        if(_t !== "") {whoseVote.push(_t, msg.sender);productMap(_t) = 19;}
        if(_u !== "") {whoseVote.push(_u, msg.sender);productMap(_u) = 20;}
        if(_v !== "") {whoseVote.push(_v, msg.sender);productMap(_v) = 21;}
        if(_w !== "") {whoseVote.push(_w, msg.sender);productMap(_w) = 22;}
        if(_x !== "") {whoseVote.push(_x, msg.sender);productMap(_x) = 23;}
        if(_y !== "") {whoseVote.push(_y, msg.sender);productMap(_y) = 24;}
        if(_z !== "") {whoseVote.push(_z, msg.sender);productMap(_z) = 25;}
        else {revert;};        

        latestVoteNumber += 1;
        voteName.push(latestVoteNumber, _voteName);
        productCount = whoseVote.length + 1;
        prizeA = _prizeA;
        voteLimit = _voteLimit;
        passwardExists = _passwardExists
        passward = keccak256(abi.encodePacked(address(this), _passward));
        address(this).send(prizeA);
    }

    function view external viewVote {
        for(uint256 i = 0; i < productCount; i++;){
            emit viewVote[whoseVote.product[i]]
        }
    }

    function voteSending(
        string _passward,
        string _product,
    ) {
        require(votable == true && keccak256(abi.encodePacked(address(this), _passward)) == passward, "nothing vote exists or wrong passward")        
        require(votingCount.count(msg.sender) < voteLimit + 1, "MAX vote only three")
        addressArray[productMap(_product)].push(msg.sender);
        allPerticipantsAddressArray[productMap(_product)].push(msg.sender);
        vote.push(_product, msg.sender);
        vote.lemgth
        vote.product = _product;
        voteCountArray.push();
        vote.voteCount += 1;
        showVoteCount(_product) = vote.voteCount;
        voted.votedCount += 1;
    }


    function reward(
        string _passward,
        string _product
    ) returns(string mostVoted){ 
        require(votable == true && keccak256(abi.encodePacked(address(this), _passward)) == passward, "nothing vote exists or wrong passward")
        string memory mostVoted;
        mostVoted = voted.voteCount[0];
        for(uint256 i = 0; i < productCount; i++) {
            if(mostVoted < voted.voteCount[i + 1]) {
                mostVoted = voted.voteCount[i + 1];
            };
        };
        emit mostVotedProject(mostVoted);
        uint prizeAReturned %= showVoteCount(mostVoted);
        uint prizeAPresented = showVoteCount(mostVoted) - prizeAReturned;
        if(prizeLogic == 0) {
            for(uint256 i = 0; i < addressArray.length + 1; i ++) {
                addressArray[(productMap(mostVoted))][i].transfer(prizeAPresented / mostVoted);
            }
            msg.sender.transfer(prizeAReturned);
        } if(prizeLogic == 1) {
            .transfer(prizeA /);
        } else {
            revert;
        }

        productMap(mostVoted)

        votable = false;
        delete voteCount, whoseVote;
    }

}    
    
    