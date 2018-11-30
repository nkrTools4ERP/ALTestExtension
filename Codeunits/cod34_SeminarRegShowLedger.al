codeunit 50134 "CSD SeminarRegShowLedger"
{
    // CSD 1.00 - 30/11/2018 16:18
    // Chapter 7 - Lab 2.10

    TableNo = "CSD Seminar Register";

    trigger OnRun()
    begin
        SeminarLedgerEntry.SetRange("Entry No.", "From Entry No.", "To Entry No.");
        page.Run(Page::"CSD Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: record "CSD Seminar Ledger Entry";

}