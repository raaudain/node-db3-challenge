const db = require("../data/db-config");

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
};


function find(){
    return db("schemes");
}

function findById(id){
    return db("schemes")
        .where({id})
        .first();
}

function findSteps(id){
    return db("schemes as sch")
        .select("sch.scheme_name as Plan", "s.step_number as Step", "s.instructions as Instructions")
        .join("steps as s", "sch.id", "s.scheme_id")
        .where("s.scheme_id", id)
        .orderBy("s.step_number")
}

function add(scheme){
    return db("schemes")
    .insert(scheme, "id")
    .then(ids => {
        const [id] = ids;
        return findById(id);
    })
}

function update(changes, id){
    return db("schemes")
    .where({id})
    .update(changes)
}

function remove(id){
    return db("schemes")
    .where({id})
    .del()
}