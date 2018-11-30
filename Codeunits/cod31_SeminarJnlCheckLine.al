codeunit 50131 "CSD Seminar Jnl.-Check Line"
{
    // CSD 1.00 - 30/11/2018 15:21
    // Chapter 7 - Lab 2.1

    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(rec);
    end;

    var
        GLSetup: record "General Ledger Setup";
        UserSetup: record "User Setup";
        AllowPostingFrom: date;
        AllowPostingTo: date;
        ClosingDateTxt: label 'Cannot be a closing date.';
        PostingDateTxt: label 'is not within your range of allowed posting dates.';

    procedure RunCheck(var semiJnlLine: record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        with semiJnlLine do begin
            if EmptyLine() then
                exit;

            TestField("Posting Date");
            TestField("Instructor Resource No.");
            TestField("Seminar No.");

            case "Charge Type" of
                "Charge Type"::Instructor:
                    TestField("Instructor Resource No.");
                "Charge Type"::Participant:
                    TestField("Participant Contact No.");
                "Charge Type"::Room:
                    TestField("Room Resource No.");
            end;

            if (Chargeable) then
                TestField("Bill-to Customer No.");
            If "Posting Date" = ClosingDate("Posting Date") then
                FieldError("Posting Date", ClosingDateTxt);
            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                if UserId <> '' then
                    if UserSetup.Get(UserId) then begin
                        AllowPostingFrom := UserSetup."Allow Posting From";
                        AllowPostingTo := UserSetup."Allow Posting To";
                    end;
                if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                    GLSetup.Get;
                    AllowPostingFrom := GLSetup."Allow Posting From";
                    AllowPostingTo := GLSetup."Allow Posting To";
                end;
                if AllowPostingTo = 0D then
                    AllowPostingTo := DMY2Date(31, 12, 9999);
            end;
            if ("Posting Date" < AllowPostingFrom) OR ("Posting Date" > AllowPostingTo) then
                FieldError("Posting Date", PostingDateTxt);
            if ("Document Date" <> 0D) then
                if ("Document Date" = ClosingDate("Document Date")) then
                    FieldError("Document Date", PostingDateTxt);
        end;
    end;
}