// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LoanLedger {
    address public borrower;
    address public lender;
    uint public loanAmount;
    uint public balance;

    event PaymentRecorded(address from, uint amount, uint remaining);

    constructor(address _borrower, uint _loanAmount) {
        lender = msg.sender;
        borrower = _borrower;
        loanAmount = _loanAmount;
        balance = _loanAmount;
    }

    function recordPayment(uint amount) public {
        require(msg.sender == borrower, "Only borrower can pay");
        require(balance >= amount, "Payment exceeds balance");

        balance -= amount;

        emit PaymentRecorded(msg.sender, amount, balance);
    }

    function getBalance() public view returns (uint) {
        return balance;
    }
}
