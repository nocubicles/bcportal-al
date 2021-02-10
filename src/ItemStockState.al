query 50131 ItemStockState
{
    Caption = 'Item Stock State';
    QueryType = API;
    APIGroup = 'BCPortal';
    APIPublisher = 'BCPortal';
    APIVersion = 'v1.0';
    DataAccessIntent = ReadOnly;
    EntitySetName = 'itemStockStates';
    EntityName = 'itemStockState';

    elements
    {
        dataitem(ItemLedgerEntry; "Item Ledger Entry")
        {
            DataItemTableFilter = Open = filter(true);
            column(ItemNo; "Item No.")
            {

            }
            column(LocationCode; "Location Code")
            {

            }
            column(Remaining_Quantity; "Remaining Quantity")
            {
                method = Sum;
            }
            column(Lot_No_; "Lot No.")
            {

            }
        }
    }
}