page 50102 "CSD Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar List';
    Editable = false;
    CardPageId = 50101;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; "No.") { }
                field("Name"; "Name") { }
                field("Seminar Duration"; "Seminar Duration") { }
                field("Seminar Price"; "Seminar Price") { }
                field("Minimum Participants"; "Minimum Participants") { }
                field("Maximum Participants"; "Maximum Participants") { }
            }
        }
        area(FactBoxes)
        {
            systempart("Links"; Links) { }
            systempart("Notes"; Notes) { }
        }
    }

    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    RunObject = page "CSD Seminar Comment Sheet";
                    RunPageLink = "Table Name" = const (Seminar), "No." = field ("No.");

                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
                action("Ledger Entries")
                {
                    Caption = 'Ledger Entries';
                    RunObject = page "CSD Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field ("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortcutKey = "Ctrl+F7";
                    Image = WarrantyLedger;
                }
                action("&Registrations")
                {
                    Caption = '&Registrations';
                    RunObject = page "CSD Seminar Registration List";
                    RunPageLink = "Seminar No." = field ("No.");
                    Promoted = true;
                    PromotedCategory = Process;
                    Image = Timesheet;
                }
            }
        }
        area(Processing)
        {
            action("Seminar Registrations")
            {
                Runobject = page "CSD Seminar Registration";
                RunpageLink = "Seminar No." = field ("No.");
                RunPageMode = Create;
                Image = NewTimesheet;
                Promoted = true;
                PromotedCategory = New;
            }
        }
    }
}