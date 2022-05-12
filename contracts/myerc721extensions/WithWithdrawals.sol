// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @author 1001.digital
/// @title An extension that enables the contract owner to withdraw funds stored in the contract.
abstract contract WithWithdrawals is Ownable
{
    /// Withdraws the ETH stored in the contract.
    /// @dev only the owner can withdraw funds.
    function withdraw() onlyOwner public {
        payable(owner()).transfer(address(this).balance);

        // https://solidity-by-example.org/payable version 0.8.13
        //address payable propietary;
        //propietary = payable(owner());
        // get the amount of Ether stored in this contract
        //uint amount = address(this).balance;
        // send all Ether to owner
        // Owner can receive Ether since the address of owner is payable
        //(bool success, ) = propietary.call{value: amount}("");
        //require(success, "Failed to send Ether");
    }
}