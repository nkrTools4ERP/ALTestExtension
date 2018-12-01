codeunit 50132 "CSD Seminar Jnl.-Post Line"
{
    // CSD1.00 - 30/11/2018 - 15:56
    // Chapter 7 - Lab 2.8

    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunWithCheck(SeminarJnlLine);
    end;

    var
        SeminarJnlLine: record "CSD Seminar Journal Line";
        SeminarLdgrEntry: record "CSD Seminar Ledger Entry";
        SeminarRegister: record "CSD Seminar Register";
        SeminarJnlCheckLine: codeunit "CSD Seminar Jnl.-Check Line";
        NextEntryNo: integer;

    procedure RunWithCheck(var seminarJnlLine2: record "CSD Seminar Journal Line")
    var
        myInt: Integer;
    begin
        with seminarJnlLine2 do begin
            SeminarJnlLine := seminarJnlLine2;
            Code();
            seminarJnlLine2 := SeminarJnlLine;
        end;
    end;

    local procedure Code()
    var
        myInt: Integer;
    begin
        with SeminarJnlLine do begin
            if EmptyLine() then
                exit;
            SeminarJnlCheckLine.RunCheck(SeminarJnlLine);
            if NextEntryNo = 0 then begin
                SeminarLdgrEntry.LockTable();
                if SeminarLdgrEntry.FindLast() then
                    NextEntryNo := SeminarLdgrEntry."Entry No.";
            end;

            if "Document Date" = 0D then
                "Document Date" := "Posting Date";

            if SeminarRegister."No." = 0 then begin
                SeminarRegister.LockTable();
                if (not SeminarRegister.FindLast() or (SeminarRegister."To Entry No." <> 0)) then begin
                    SeminarRegister.Init();
                    SeminarRegister."No." := SeminarRegister."No." + 1;
                    SeminarRegister."From Entry No." := NextEntryNo;
                    SeminarRegister."To Entry No." := NextEntryNo;
                    SeminarRegister."Creation Date" := TODAY;
                    SeminarRegister."Source Code" := "Source Code";
                    SeminarRegister."Journal Batch Name" := "Journal Batch Name";
                    SeminarRegister."User ID" := UserId();
                    SeminarRegister.Insert();
                end;
            end;
            SeminarRegister."To Entry No." := NextEntryNo;
            SeminarRegister.Modify;

            SeminarLdgrEntry.Init;
            SeminarLdgrEntry."Seminar No." := "Seminar No.";
            SeminarLdgrEntry."Posting Date" := "Posting Date";
            SeminarLdgrEntry."Document Date" := "Document Date";
            SeminarLdgrEntry."Document No." := "Document No.";
            SeminarLdgrEntry."Entry Type" := "Entry Type";
            SeminarLdgrEntry."Instructor Resource No." := "Instructor Resource No.";
            SeminarLdgrEntry."Journal Batch Name" := "Journal Batch Name";
            SeminarLdgrEntry.Description := Description;
            SeminarLdgrEntry."Bill-to Customer No." := "Bill-to Customer No.";
            SeminarLdgrEntry."Charge Type" := "Charge Type";
            SeminarLdgrEntry.Type := Type;
            SeminarLdgrEntry.Quantity := Quantity;
            SeminarLdgrEntry."Unit Price" := "Unit Price";
            SeminarLdgrEntry."Total Price" := "Total Price";
            SeminarLdgrEntry."Participant Contact No." := "Participant Contact No.";
            SeminarLdgrEntry."Participant Name" := "Participant Name";
            SeminarLdgrEntry.Chargeable := Chargeable;
            SeminarLdgrEntry."Room Resource No." := "Room Resource No.";
            SeminarLdgrEntry."Starting Date" := "Starting Date";
            SeminarLdgrEntry."Seminar Registration No." := "Seminar Registration No.";
            SeminarLdgrEntry."Res. Ledger Entry No." := "Res. Ledger Entry No.";
            SeminarLdgrEntry."Source Type" := "Source Type";
            SeminarLdgrEntry."Source No." := "Source No.";
            SeminarLdgrEntry."Source Code" := "Source Code";
            SeminarLdgrEntry."Reason Code" := "Reason Code";
            SeminarLdgrEntry."Posting No. Series" := "Posting No. Series";
            SeminarLdgrEntry."Entry No." := NextEntryNo;
            NextEntryNo += 1;
            SeminarLdgrEntry.Insert();
        end;
    end;
}