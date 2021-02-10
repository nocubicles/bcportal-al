page 50131 ItemTracking
{
    PageType = API;
    APIGroup = 'BCPortal';
    APIPublisher = 'BCPortal';
    APIVersion = 'v1.0';
    EntitySetName = 'itemTrackings';
    EntityName = 'itemTracking';
    DelayedInsert = true;
    SourceTable = "Reservation Entry";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            repeater(ReservEntry)
            {
                field("QuantityBase"; "Quantity (Base)") { }
                field("ItemTracking"; "Item Tracking")
                {
                    trigger OnValidate()
                    begin
                        rec."Item Tracking" := rec."Item Tracking"::"Lot No.";
                    end;
                }
                field("EntryNo"; "Entry No.")
                {
                    trigger OnValidate()
                    begin
                        rec."Entry No." := rec.GetLastEntryNo() + 1;
                    end;
                }
                field("ReservationStatus"; "Reservation Status")
                {
                    trigger OnValidate()
                    begin
                        rec."Reservation Status" := rec."Reservation Status"::Surplus;
                    end;
                }
                field("CreationDate"; "Creation Date")
                {

                }
                field("ShipmentDate"; "Shipment Date") { }
                field("ItemNo"; "Item No.") { }
                field("LocationCode"; "Location Code") { }
                field("SourceType"; Rec."Source Type")
                {
                    trigger OnValidate()
                    begin
                        Rec."Source Type" := Rec."Source Type";
                    end;
                }
                field("SourceSubtype"; "Source Subtype") { }
                field("SourceID"; "Source ID") { }
                field("SourceRefNo"; "Source Ref. No.") { }
                field("LotNo"; "Lot No.") { }
                field("QtyperUnitofMeasure"; "Qty. per Unit of Measure") { }
                field(Positive; Positive) { }
                field(Description; Description) { }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        CreateReservEntry: Codeunit "Create Reserv. Entry";
    begin
        rec.Description := 'Tere funktsioonist';

        CreateReservEntry.SetDates(0D, rec."Expiration Date");

        CreateReservEntry.CreateReservEntryFor(
            Rec."Source Type",
            Rec."Source Subtype",
            Rec."Source ID",
            Rec."Source Batch Name",
            rec."Source Prod. Order Line",
            Rec."Source Ref. No.",
            Rec."Qty. per Unit of Measure",
            0,
            Rec."Quantity (Base)",
            Rec
        );

        CreateReservEntry.CreateEntry(
            Rec."Item No.",
            Rec."Variant Code",
            Rec."Location Code",
            '',
            0D,
            Rec."Shipment Date",
            0,
            Rec."Reservation Status"
        );

    end;
}