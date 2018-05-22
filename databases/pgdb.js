module.exports = pgPool => {
    return {
        getCustomer(id) {
            return pgPool.query(`
                select * from customers
                where id = $1
            `, [id]).then(res => {
                return res.rows[0];
            });
        },
        getCustomers() {
            return pgPool.query(`
                select * from customers
            `).then(res => {
                return res.rows;
            })
        }
    }
}