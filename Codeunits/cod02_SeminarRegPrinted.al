codeunit 50102 "CSD Seminar Reg. Header"
{
    TableNo = "CSD Seminar Reg. Header";

    trigger OnRun()
    begin
        Find;
        "No. Printed" += 1;
        Modify;
        Commit;
    end;
}