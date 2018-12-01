table 50141 "CSD My Seminars"
{
    DataClassification = ToBeClassified;
    Caption = 'My Seminars';
    fields
    {
        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = "User";
            DataClassification = ToBeClassified;
        }
        field(20; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = "CSD Seminar";
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "User ID", "Seminar No.")
        {
            Clustered = true;
        }
    }
}