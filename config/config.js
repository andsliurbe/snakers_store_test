const { json } = require('express');
const { Client } = require('pg');



class MainConexion {
    conexion;
    constructor() {


        this.conexion = new Client({
            user: 'postgres',
            password: 'postgres',
            host: 'localhost',
            port: '5432',
            database: 'snakers_store_bd',
        });

        this.conexion
            .connect()

    }

    async consultar(query) {

        try {

            const rows = await new Promise(async (resolve, reject) => {

                await this.conexion.query(query, (err, result) => {


                    if (err) {
                        reject(err)
                    } else {
                        resolve(result)

                    }


                })
            })
            return rows.rows
        } catch (error) {
            console.log(error)
        }
    }


    async status() {
        this.conexion
            .connect()
            .then(() => {
                console.log('Connected to PostgreSQL database');

            })
            .catch((err) => {

                console.log('Error connecting to PostgreSQL database', err)
            });
    }
}


module.exports = MainConexion;

