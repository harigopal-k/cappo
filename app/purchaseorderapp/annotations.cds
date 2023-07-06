using CatalogService as service from '../../srv/CatalogService';

annotate CatalogService.POs with @(
    UI: {
        SelectionFields  : [
            PO_ID,
            GROSS_AMOUNT,
            LIFECYCLE_STATUS,
            CURRENCY_code,
            PARTNER_GUID.COMPANY_NAME
        ],

        LineItem  : [   
            {
                $Type: 'UI.DataField',
                Value:PO_ID,
            },
            {
                $Type: 'UI.DataField',
                Value:GROSS_AMOUNT,
            },
            {
                $Type:'UI.DataField',
                Value:OVERALL_STATUS,
                Criticality:Crtiticality,
                CriticalityRepresentation: #WithIcon
            },
            {
                $Type:'UI.DataFieldForAction',
                Label:'Boost',
                Action:'CatalogService.boost',
                Inline:true
            },
            {
                $Type:'UI.DataField',
                Value:CURRENCY_code,
            },
            {
                $Type:'UI.DataField',
                Value:PARTNER_GUID.COMPANY_NAME,
            },
            {
                $Type:'UI.DataField',
                Value:PARTNER_GUID.ADDRESS_GUID.COUNTRY
            },
            {
                $Type:'UI.DataField',
                Value: TAX_Amount
            }     
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Purchase Order',
            TypeNamePlural : 'Purchase Orders',
            Title:{
                Label: 'Purchase Order Id',
                Value: PO_ID
            },
            Description:{
                Label:'Supplier',
                Value:PARTNER_GUID.COMPANY_NAME
            },
            ImageUrl: 'data:image/jpeg;base64,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'
        },
        Facets  : [{
            $Type:'UI.CollectionFacet',
            Label:'Details',
            Facets:[
                {
                    $Type:'UI.ReferenceFacet',
                    Label:'More Details',
                    Target:![@UI.FieldGroup#AnubhavFields]
                },{
                    $Type:'UI.ReferenceFacet',
                    Label:'Amounts',
                    Target:![@UI.FieldGroup#SecondGroup]
            },
            ],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label: 'Line Items',
            Target: Items.![@UI.LineItem],
        }
            
        ],
        FieldGroup#SecondGroup: {
            $Type : 'UI.FieldGroupType',
            Data:[
                {
                    $Type:'UI.DataField',
                    Value:GROSS_AMOUNT
                },
                {
                    $Type:'UI.DataField',
                    Value:NET_AMOUNT
                },
                {
                    $Type:'UI.DataField',
                    Value:TAX_Amount
                },
                {
                    $Type:'UI.DataField',
                    Value:CURRENCY_code
                }
            ]
        },
        FieldGroup#AnubhavFields: {
            $Type : 'UI.FieldGroupType',
            Data:[
                {
                    $Type:'UI.DataField',
                    Value:PO_ID
                },
                {
                    $Type:'UI.DataField',
                    Value: PARTNER_GUID_NODE_KEY
                },
                {
                    $Type:'UI.DataField',
                    Value:PARTNER_GUID.BP_ID
                },
                {
                    $Type:'UI.DataField',
                    Value:PARTNER_GUID.COMPANY_NAME
                },
                {
                    $Type:'UI.DataField',
                    Value:LIFECYCLE_STATUS
                }
            ]
        },

    }
);   


annotate CatalogService.POs with {
    PARTNER_GUID@(
        Common:{
            Text : PARTNER_GUID.COMPANY_NAME,
        },
        ValueList.entity:CatalogService.BusinessPartnerSet
    )
};


annotate CatalogService.purchaseOrderItems with {
    PRODUCT_GUID@(
        Common:{
            Text : PRODUCT_GUID.DESCRIPTION,
        },
        ValuesList.entity:CatalogService.ProductSet
    )
};


@cds.odata.valuelist
annotate CatalogService.BusinessPartnerSet with @(
    UI.Identification:[{
        $Type:'UI.DataField',
        Value:COMPANY_NAME,
    }]
);

@cds.odata.valuelist
annotate CatalogService.ProductSet with @(
    UI.Identification:[{
        $Type:'UI.DataField',
        Value:DESCRIPTION,
    }]
);


annotate CatalogService.purchaseOrderItems with @(
    UI:{
        LineItem:[
            {
                $Type:'UI.DataField',
                Value:PO_ITEM_POS,
            },
            {
                $Type:'UI.DataField',
                Value:PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type:'UI.DataField',
                Value:PRODUCT_GUID.ProductId,
            },
            {
                $Type:'UI.DataField',
                Value:GROSS_AMOUNT,
            },
            {
                $Type:'UI.DataField',
                Value:NET_AMOUNT,
            },
            {
                $Type:'UI.DataField',
                Value:TAX_Amount,
            },
            {
                $Type:'UI.DataField',
                Value:CURRENCY_code,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Item',
            TypeNamePlural : 'Items',
            Title : {
                $Type:'UI.DataField',
                Value:NODE_KEY,
            },
            Description:{
                $Type:'UI.DataField',
                Value:PO_ITEM_POS
            }
        },
        Facets  : [
            {
                $Type:'UI.ReferenceFacet',
                Target:'@UI.FieldGroup#LineItemHeader',
                Label:'More info'
            },
            {
                $Type:'UI.ReferenceFacet',
                Target:'@UI.FieldGroup#ProductDetails',
                Label:'Product Info'
            }
        ],
        FieldGroup#LineItemHeader : {
            $Type : 'UI.FieldGroupType',
            Data: [
                {
                    $Type:'UI.DataField',
                    Value:PO_ITEM_POS,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID_NODE_KEY,
                },
                {
                    $Type:'UI.DataField',
                    Value:GROSS_AMOUNT,
                },
                {
                    $Type:'UI.DataField',
                    Value:NET_AMOUNT,
                },
                {
                    $Type:'UI.DataField',
                    Value:TAX_Amount,
                },
                {
                    $Type:'UI.DataField',
                    Value:CURRENCY_code
                }
            ]
        },
        FieldGroup#ProductDetails : {
            $Type : 'UI.FieldGroupType',
            Data :[
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.PRODUCT_ID,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.DESCRIPTION,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.TYPE_CODE,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.CATEGORY,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME,
                },
                {
                    $Type:'UI.DataField',
                    Value:PRODUCT_GUID.TAX_TARIF_CODE,
                }
            ]
        },
    }
);
















































// below code is old 


// annotate service.POs with @(
//     UI.LineItem : [
//         {
//             $Type : 'UI.DataField',
//             Label : 'NODE_KEY',
//             Value : NODE_KEY,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : CURRENCY_code,
//         },
//         {
//             $Type : 'UI.DataField',
//             Label : 'GROSS_AMOUNT',
//             Value : GROSS_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : NET_AMOUNT,
//         },
//         {
//             $Type : 'UI.DataField',
//             Value : TAX_Amount,
//         },
//     ]
// );
// annotate service.POs with @(
//     UI.FieldGroup #GeneratedGroup1 : {
//         $Type : 'UI.FieldGroupType',
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : CURRENCY_code,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'GROSS_AMOUNT',
//                 Value : GROSS_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : NET_AMOUNT,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Value : TAX_Amount,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'NODE_KEY',
//                 Value : NODE_KEY,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PO_ID',
//                 Value : PO_ID,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'PARTNER_GUID_NODE_KEY',
//                 Value : PARTNER_GUID_NODE_KEY,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'LIFECYCLE_STATUS',
//                 Value : LIFECYCLE_STATUS,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'OVERALL_STATUS',
//                 Value : OVERALL_STATUS,
//             },
//             {
//                 $Type : 'UI.DataField',
//                 Label : 'NOTE',
//                 Value : NOTE,
//             },
//         ],
//     },
//     UI.Facets : [
//         {
//             $Type : 'UI.ReferenceFacet',
//             ID : 'GeneratedFacet1',
//             Label : 'General Information',
//             Target : '@UI.FieldGroup#GeneratedGroup1',
//         },
//     ]
// );
