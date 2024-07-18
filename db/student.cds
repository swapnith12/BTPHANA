using {ust.reuse as reuse} from './resuse';
using {cuid,managed,temporal} from '@sap/cds/common';
namespace ust.lnd;

context master{

    entity student: reuse.address {
        key id : reuse.Guid;
        nameFirst : String(40);
        nameLast : String(40);
        age  : Int64;
        class : Association to one department;
    }

    entity department {
        key id : Integer;
        name : String;
    }

    // entity book add a filed with localised key word for transalation
    entity books {
        key id : reuse.Guid;
        name : localized String;
    }
}

context transaction {
    entity subs: cuid, managed, temporal{
        student: Association to one master.student;
        department : Association to master.department;
        // books : Association  to master.books;
    }
}

context cds {
    // define view![SwapNith] noe db will keep with exact name
    define view swap as select 
    from master.student{
        key id,
        nameFirst
    }
}


