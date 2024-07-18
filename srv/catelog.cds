// using { anubhav.db.master, anubhav.db.transaction } from '../db/datamodel';
// using { cappo.cds } from '../db/cdsviews';

// service CatalogService @(path: 'CatalogService') {
 
//     entity ProductSet as projection on master.product;
//     entity BusinessPartnerSet as projection on master.businesspartner;
//     entity BusinessAddressSet as projection on master.address;
//     entity EmployeeSet as projection on master.employees;
//     entity POs @(odata.draft.enabled) as projection on transaction.purchaseorder{
//         *,
//         Items,
//         case OVERALL_STATUS
//            when 'P' then 'Pending'
//            when 'N' then 'Warning'
//            when 'A' then 'Approved'
//            when 'X' then 'Rejected'
//         end as OVERALLSTATUS: String,
//         case OVERALL_STATUS
//            when 'P' then 1
//            when 'N' then 1
//            when 'A' then 2
//            when 'X' then 3
//         end as ColorCode: Integer,
//     }
//     actions{
//         @Common.SideEffects : {
//             TargetProperties : [
//                 'in/GROSS_AMOUNT',
//             ]
//         }
//         action boost() returns POs
//     }; 
//     entity POItems as projection on transaction.poitems;
//     // entity OrderItems as projection on cds.CDSViews.ItemView;
//     // entity Products as projection on cds.CDSViews.ProductView;
 
// }


using { anubhav.db.master , anubhav.db.transaction } from '../db/datamodel';
using { cappo.cds } from '../db/cdsviews';
 
service CatalogService @(path: 'CatalogService'){
    entity ProductSet as projection on master.product;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity BusinessAddress as projection on master.address ;
    entity EmployeeSet as projection on master.employees;
    // entity POItems as projection on transaction.poitems;
    entity POs @(odata.draft.enabled:true) as projection on transaction.purchaseorder{
        *,
        Items,
        case OVERALL_STATUS
            when 'P' then 'Pending'
            when 'N' then 'New'
            when 'A' then 'Approved'
            when 'X' then 'Rejected'
            end as Overallstatus : String(10),
            case OVERALL_STATUS
            when 'P' then 2
            when 'N' then 2
            when 'A' then 3
            when 'X' then 1
            end as ColorCode : Integer,
    }
    actions{
        @Common.SideEffects : {
            TargetProperties : [
                'in/GROSS_AMOUNT',
            ]
        }
        action boost() returns POs
    };
    function largestOrder() returns array of POs;
    // definition of the
    function getOrderDefaults() returns POs;
    entity POItems as projection on transaction.poitems
    // entity Products as projection on cds.CDSViews.ProductView;
    // entity OrderItems as projection on cds.CDSViews.ItemView;
}
 