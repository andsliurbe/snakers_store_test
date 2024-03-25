const express = require('express')
const app = express()
const MainConexion = require('./config/config.js')
 


app.get('/',async function (req, res) {


    let conexion= new MainConexion();
     conexion.consultar("");
    res.send('Hello World')
  


})

/**
 *  Productos disponibles en stock 
 */
app.get('/products',async function (req, res) {


    let conexion=  new MainConexion();
     let result =await conexion.consultar(`
     -- productos disponibles en stock 
select
	s.id_snaker ,
	s.titlle ,
	s.description ,
	s.price ,
	s.count_stock ,
	s.path_img ,
	m."name" 
from
	snakers s
	inner join marks m on m.id_mark = s.id_mark 
	where s.count_stock >0
	and  s.deleted_at  is null and m.deleted_at  is null 
	order by m."name" ASC `);

    if(result!=0 && result!=undefined)
    {

    res.send({success:true, data:result , msg:`Exito`})
    }else{

        res.send({success:false, data:[] , msg:`Sin registros`})
    }
    
  


})

/**
 *  Productos disponibles en stock 
 */
app.get('/price/:user_id/:nombre_producto',async function (req, res) {

    let variables = req.params


    let conexion=  new MainConexion();
     let result =await conexion.consultar(`
     -- productos disponibles en stock 
     select
         s.id_snaker ,
         s.titlle ,
         s.description ,
         case when mcp.descuento is not null then 
         s.price-((s.price*mcp.descuento)/100) else s.price end
         as price,
         case when mcp.descuento is not null then 
         true else  false end
         as has_special_price,
         s.count_stock ,
         s.path_img ,
         m."name"
     from
         snakers s
         inner join marks m on m.id_mark = s.id_mark 
         
         left join marks_clients_prices mcp  on   mcp.id_mark= m.id_mark and  mcp.id_client =${variables.user_id}
         where s.count_stock >0
         and  s.deleted_at  is null and m.deleted_at  is null 
         and s.titlle ilike '%${variables.nombre_producto}%'
         order by m."name" ASC `);

    if(result!=0 && result!=undefined)
    {

    res.send({success:true, data:result , msg:`Exito`})
    }else{

        res.send({success:false, data:[] , msg:`Sin registros`})
    }
    
  


})

app.listen(3000)