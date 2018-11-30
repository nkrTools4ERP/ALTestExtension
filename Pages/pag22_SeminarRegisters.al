page 50122 "CSD Seminar Registers"
{
    //CSD 1.0 - 30/11/2018 16:25
    // Chapter 7 - Lab 2.11

    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Register";
    Editable = false;

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; "No.") { }
                field("Creation Date"; "Creation Date") { }
                field("User ID"; "User ID") { }
                field("Source Code"; "Source Code") { }
                field("Journal Batch Name"; "Journal Batch Name") { }
            }
        }
        area(FactBoxes)
        {
            systempart("Notes"; Notes)
            {

            }
            systempart("Links"; Links)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }

        area(Navigation)
        {
            action("Seminar Ledgers")
            {
                Image = WarrantyLedger;
                RunObject = codeUnit "CSD SeminarRegShowLedger";
            }
        }
    }

    var
        myInt: Integer;
}