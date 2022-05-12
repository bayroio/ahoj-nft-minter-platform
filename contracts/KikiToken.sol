// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
//import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./myerc721extensions/LimitedTokensPerWallet.sol";
import "./myerc721extensions/RandomlyAssigned.sol";
import "./myerc721extensions/WithContractMetaData.sol";
import "./myerc721extensions/WithSaleStart.sol";
import "./myerc721extensions/WithWithdrawals.sol";

//contract KikiToken is ERC721, ERC721URIStorage, Ownable {
contract KikiToken is LimitedTokensPerWallet, RandomlyAssigned, WithContractMetaData, WithSaleStart, WithWithdrawals {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    // WithContractMetaData("ipfs://0123456789123456789123456789123456789123456789/metadata.json")
    constructor(string memory uri) 
        ERC721("KikiToken", "KIKI")
        LimitedTokensPerWallet(2)
        RandomlyAssigned(10, 1)
        WithContractMetaData(uri)
        WithSaleStart(1735686000)
    {}

    function claim() external payable ensureAvailability afterSaleStart {
        require(msg.value == 10000000000000000, "Necesitas pagar exactemente 0.01 para hacer el mint del NFT"); // 10000000000000000 wei = 0.01 Ether
        uint256 newTokenId = nextToken(); // Create a new token ID
        _mint(msg.sender, newTokenId);
    }
}


// ******************* Polygon: Smart Contract **************************
// TxHash: 0xd2b9571fe052608595500ad0d411c7a5d36aeb72b095e1a1f73e64b1aa85236a
// address: 0x9b45fd193788e23F89206a079227a3a1ddc20723
// https://mumbai.polygonscan.com/
// https://mumbai.polygonscan.com/address/0x9b45fd193788e23f89206a079227a3a1ddc20723

// ******************* Polygon: Library **************************
// TxHash: 0x8e0b2c2ec9ba747dd327d0031d2c864997e510c66b8a13b6748190f044fdf880
// address: 0x80217fB44078B6f30f80A4EA1947856023c4AbC2
// https://mumbai.polygonscan.com/
// https://mumbai.polygonscan.com/address/0x80217fb44078b6f30f80a4ea1947856023c4abc2