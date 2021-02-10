page 50130 AssemblyOrders
{
    PageType = API;
    APIGroup = 'BCPortal';
    APIPublisher = 'BCPortal';
    APIVersion = 'v1.0';
    EntitySetName = 'assemblyOrders';
    EntityName = 'assemblyOrder';
    DelayedInsert = true;
    SourceTable = "Assembly Header";

    layout
    {
        area(Content)
        {
            repeater(AssemblyHeader)
            {
                field(SystemId; Rec.SystemId)
                {
                    Caption = 'System Id';
                }
                field(Status; Rec.Status) { }
                field(Description; Rec.Description) { }
                field("No"; Rec."No.")
                {
                    Caption = 'Customer No.';
                }
                field("ItemNo"; Rec."Item No.")
                {
                    Caption = 'Item No.';
                }
                field("DueDate"; Rec."Due Date")
                {
                    Caption = 'Due Date';
                }
                field("EndingDate"; Rec."Ending Date")
                {
                    Caption = 'Ending Date';
                }
                field("PostingDate"; Rec."Posting Date")
                {
                    Caption = 'Posting Date';
                }
                field("StartingDate"; Rec."Starting Date")
                {
                    Caption = 'Starting Date';
                }
                field("DocumentType"; Rec."Document Type")
                {
                    Caption = 'Document Type';
                }
                field(Quantity; Rec.Quantity)
                {

                }
                field("QuantityBase"; Rec."Quantity (Base)")
                {

                }
                field("QuantityToAssemble"; Rec."Quantity to Assemble") { }
                field("AssembledQuantity"; Rec."Assembled Quantity") { }
                field("AssembledQuantityBase"; Rec."Assembled Quantity (Base)") { }
                field("RemainingQuantity"; Rec."Remaining Quantity") { }
                field("RemainingQuantityBase"; Rec."Remaining Quantity (Base)") { }
                field("QtyPerUnitOfMeasure"; Rec."Qty. per Unit of Measure") { }
                part(AssemblyLines; "Assembly Order Subform")
                {
                    ApplicationArea = All;
                    Caption = 'Lines', Locked = true;
                    EntityName = 'assemblyOrderLine';
                    EntitySetName = 'assemblyOrderLines';
                    SubPageLink = "Document No." = field("No.");
                }
            }
        }
    }

    [ServiceEnabled]
    procedure PostAssemblyOrder(var actionContext: WebServiceActionContext)
    begin
        Codeunit.run(Codeunit::"Assembly-Post", Rec);
        actionContext.SetObjectType(ObjectType::Page);
        actionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;

    [ServiceEnabled]
    procedure AddTrackingToLine(var actionContext: WebServiceActionContext)
    var
        TempReservEntry: Record "Reservation Entry" temporary;
        LotNo: Code[50];
        LineNo: Integer;
        AssemblyLine: Record "Assembly Line";
    begin

    end;
}