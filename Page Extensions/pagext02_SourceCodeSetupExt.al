pageextension 50102 "CSD SourceCodeExt" extends "Source Code Setup"
{
    // CSD1.00 - 30/11/2018 14:58 
    // Chapter 7 - Lab 1.8

    layout
    {
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';
                field(Seminar; "CSD Seminar")
                {

                }
            }
        }

    }

    actions
    {
        // Add changes to page actions here
    }
}