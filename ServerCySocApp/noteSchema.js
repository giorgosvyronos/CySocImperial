var mongoose = require('mongoose')
var Schema = mongoose.Schema

var note = new Schema({

    title: String,      //  Title of event
    date: String,       //  Date of event
    note: String        // Description of event
})


const Data = mongoose.model("data", note)

module.exports = Data