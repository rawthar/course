pageextension 123456703 ResourceListExt extends "Resource List"
{
    layout
    {
       modify(Type)
       {
           Visible = Showtype;
       }

       addafter(Type)
       {
           field("Resource Type";"Resource Type")
           {               
           }
           field("Maximum Participants";"Maximum Participants")
           {
               Visible = ShowMaxField;
           }
       }
    }
    
    trigger OnOpenPage();
    begin
        FilterGroup(3);
        Showtype := (GetFilter(Type)='');
        ShowMaxField := (GetFilter(Type) = format(Type::Machine));
        FilterGroup(0);
    end;
    var
        [InDataSet]
        ShowMaxField: Boolean;
        [InDataSet]
        Showtype: Boolean;
}