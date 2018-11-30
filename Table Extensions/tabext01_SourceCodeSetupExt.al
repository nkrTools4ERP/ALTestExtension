tableextension 50101 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    // CSD1.00 - 30/11/2018 14:53
    // Chapter 7 - lab 1.7
    // Added new fields:
    // Seminar
    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }
}