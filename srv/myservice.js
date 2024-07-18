module.exports = async (srv) => {
 
    //implementation code
    srv.on('greetings', (req,res)=>{
        return "good morning ! " + req.data.name ;
    })
 
}