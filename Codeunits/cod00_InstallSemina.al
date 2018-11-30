codeunit 50100 "CSD Install Seminar"
{
    Subtype = Install;

    trigger OnInstallAppPerCompany()
    var
        myInt: Integer;
    begin
        if SeminarSetup.Get() then
            exit

    end;

    var
        SeminarSetup: Record "CSD Seminar Setup";
}

/*codeunit 50101 "Upgrade Codeunit"
{
    Subtype=Upgrade;
    trigger OnUpgradePerCompany()
    var
        myInt: Integer;
    begin
        
    end;
}*/
