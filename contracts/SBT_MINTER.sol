
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Gyotaku is ERC721, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Gyotaku", "GYO") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://pbs.twimg.com/profile_images/1240905732888748032/FBIo4kmc_400x400.jpg";
    }
    // add some codes
    function changeBaseURI() external pure {
        
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    function _beforeTokenTransfer(
        address from, 
        address to, 
        uint256 tokenId
        )
        internal
        whenNotPaused
        override
    {
        require(from == address(0));
        super._beforeTokenTransfer(from, to, tokenId);
    }



}