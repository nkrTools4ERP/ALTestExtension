page 50140 "CSD Seminar Manager Activities"
{
    PageType = CardPart;
    InsertAllowed = false;
    DeleteAllowed = false;
    SourceTable = "CSD Seminar Cue";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            cuegroup(Registration)
            {
                Caption = 'Registrations';
                field(Planned; Planned)
                {
                }
                field(Registered; Registered)
                {
                }
                actions
                {
                    action(New)
                    {
                        Caption = 'New';
                        RunObject = page "CSD Seminar Registration";
                        RunPageMode = Create;
                    }
                }
            }
            cuegroup("For Posting")
            {
                field(Closed; Closed)
                {
                }
            }
        }
    }

    trigger OnOpenPage();
    begin
        if not get then begin
            init;
            insert;
        end;
    end;
}