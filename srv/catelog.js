// module.exports = cds.service.impl( async function(){
 
//     //Step 1: get the object of our odata entities
//     const { EmployeeSet, POs } = this.entities;
//     this.before('UPDATE' , EmployeeSet, (req) => {
//         var salary = parseInt(req.data.salaryAmount)
//         if(salary >= 100000){
//             return req.error(500,"sorry the salary is not in range")
//         }
//     })
//     this.after('READ' , EmployeeSet, (req,res) => {
//         req.push({"ID":"Suhel"})
//         return req.data
//     });
 
//     this.on('boost', async (req,res) => {
//         try {
//             const ID = req.params[0];
//             console.log("Hey Amigo, Your purchase order with id " + req.params[0] + " will be boosted");
//             const tx = cds.tx(req);
//             await tx.update(POs).with({
//                 GROSS_AMOUNT: { '+=' : 20000 },
//                 NOTE: 'Boosted!!'
//             }).where(ID);
//         } catch (error) {
//             return "Error " + error.toString();
//         }
//     });
//     this.on('getOrderDefaults', async (req,res) => {
//         return {
//             "OVERALL_STATUS":"N"
//         };
//     });
//     this.on('largestOrder', async (req,res) => {
//         try {
//             const ID = req.params[0];
//             const tx = cds.tx(req);
           
//             //SELECT * UPTO 1 ROW FROM dbtab ORDER BY GROSS_AMOUNT desc
//             const reply = await tx.read(POs).orderBy({
//                 GROSS_AMOUNT: 'desc'
//             }).limit(1);
 
//             return reply;
//         } catch (error) {
//             return "Error " + error.toString();
//         }
//     });
 
// }
// );


module.exports = cds.service.impl( async function(){
 
    //Step 1: get the object of our odata entities
    const { EmployeeSet, POs } = this.entities;
    this.before('UPDATE' , EmployeeSet, (req) => {
        var salary = parseInt(req.data.salaryAmount)
        if(salary >= 100000){
            return req.error(500,"sorry the salary is not in range")
        }
    })
    this.after('READ' , EmployeeSet, (req,res) => {
        req.push({"ID":"Munna"})
        return req.data
    });
 
    this.on('boost', async (req,res) => {
        try {
            const ID = req.params[0];
            console.log("Hey Amigo, Your purchase order with id " + req.params[0] + " will be boosted");
            const tx = cds.tx(req);
            await tx.update(POs).with({
                GROSS_AMOUNT: { '+=' : 20000 },
                NOTE: 'Boosted!!'
            }).where(ID);
        } catch (error) {
            return "Error " + error.toString();
        }
    });
    this.on('getOrderDefaults', async (req,res) => {
        return {
            "OVERALL_STATUS":"N"
        };
    });
    this.on('largestOrder', async (req,res) => {
        try {
            const ID = req.params[0];
            const tx = cds.tx(req);
           
            //SELECT * UPTO 1 ROW FROM dbtab ORDER BY GROSS_AMOUNT desc
            const reply = await tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);
 
            return reply;
        } catch (error) {
            return "Error " + error.toString();
        }
    });
 
}
);