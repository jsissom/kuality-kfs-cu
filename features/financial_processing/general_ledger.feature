Feature: General Ledger

  [KFSQA-649] Cornell University requires an Accounting Line Description input through an eDoc to be recorded in the General Ledger.

  @KFSQA-649 @smoke @nightly-jobs @pending
  Scenario Outline: Accounting Line Description from eDoc updates General Ledger
    Given I am logged in as a KFS Chart Manager
    #Given I am logged in as a KFS Chart Administrator
    And   I clone Account <source_account> with the following changes:
      | Name                              | <eDoc> Test Account S |
      | Chart Code                        | IT                    |
      | Description                       | <eDoc> Test Account S |
    And   I clone Account <target_account> with the following changes:
      | Name                              | <eDoc> Test Account T |
      | Chart Code                        | IT                    |
      | Description                       | <eDoc> Test Account T |
    #And   I am logged in as a KFS User for the <docType> document
    Given I am logged in as a KFS Chart Administrator
    When  I start an empty <eDoc> document
    And   I add balanced Accounting Lines to the <eDoc> document
    And   I submit the <eDoc> document
    And   I blanket approve the <eDoc> document
    And   the <eDoc> document goes to one of the following statuses:
      | PROCESSED |
      | FINAL     |
    Given I am logged in as a KFS Chart Administrator
    And   Nightly Batch Jobs run
    When  I lookup the document ID for the <eDoc> document from the General Ledger
    Then  the Accounting Line Description for the <eDoc> document equals the General Ledger Accounting Line Description
  Examples:
    | eDoc                               | docType | source_account | target_account | done? |
#    | Advance Deposit                    | AD      | 2003600        |                | true  |
#    | Auxiliary Voucher                  | AV      | H853800        | H803800        | X      |
#    | Budget Adjustment                  | BA      | G003704        | G013300        | false |
#    | Credit Card Receipt                | CCR     | G003704        |                | X      |
#    | Disbursement Voucher               | DV      | 5193120        |                | X      |
#    | Distribution Of Income And Expense | DI      | G003704        | G013300        | X      |
#    | General Error Correction           | GEC     | G003704        | G013300        | true  |
#    | Internal Billing                   | IB      | G003704        | G013300        | X      |
#    | Indirect Cost Adjustment           | ICA     | 1278003        | Y404171        | X      |
#    | Journal Voucher                    | JV-1    | G003704        | G013300        | X      |
#    | Journal Voucher                    | JV-2    | G013300        |                | ?      |
#    | Journal Voucher                    | JV-3    | G003704        |                | ?      |
#    | Non-Check Disbursement             | ND      | G013300        |                |       |
#    | Pre-Encumbrance                    | PE      | G003704        |                | true  |
#    | Service Billing                    | SB      | U243700        | G013300        |       |
#    | Transfer Of Funds                  | TF      | A763306        | A763900        | X      |
