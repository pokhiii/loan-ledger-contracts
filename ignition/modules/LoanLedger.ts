import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const LoanLedgerModule = buildModule("LoanLedgerModule", (m) => {
  // Borrower address (using the 2nd signer from Hardhat accounts by default)
  const borrower = m.getAccount(1);

  // Loan amount
  const loanAmount = 100000;

  // Deploy LoanLedger contract with constructor args
  const loanLedger = m.contract("LoanLedger", [borrower, loanAmount]);

  return { loanLedger };
});

export default LoanLedgerModule;
