page 50121 "CSD Seminar Ledger Entries"
{
    // CSD 1.00 - 30/11/2018 16:15
    // Chapter 7 - Lab 2.9

    Caption = 'Seminar Ledger Entries';
    PageType = Card;
    SourceTable = "CSD Seminar Ledger Entry";
    Editable = false;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Posting Date"; "Posting Date") { }
                field("Document No."; "Document No.") { }
                field("Document Date"; "Document Date") { }
                field("Entry Type"; "Entry Type") { }
                field("Seminar No."; "Seminar No.") { }
                field(Description; Description) { }
                field("Bill-to Customer No."; "Bill-to Customer No.") { }
                field("Charge Type"; "Charge Type") { }
                field(Type; Type) { }
                field(Quantity; Quantity) { }
                field("Unit Price"; "Unit Price") { }
                field("Total Price"; "Total Price") { }
                field(Chargeable; Chargeable) { }
                field("Participant Contact No."; "Participant Contact No.") { }
                field("Participant Name"; "Participant Name") { }
                field("Instructor Resource No."; "Instructor Resource No.") { }
                field("Room Resource No."; "Room Resource No.") { }
                field("Starting Date"; "Starting Date") { }
                field("Seminar Registration No."; "Seminar Registration No.") { }
                field("Entry No."; "Entry No.") { }
            }
        }
        area(FactBoxes)
        {
            systempart("Record Links"; Links)
            {

            }
            systempart("Notes"; Notes)
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
    }

    var
        myInt: Integer;
}