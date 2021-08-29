var mongoose = require('mongoose')
var Schema = mongoose.Schema

var tutor = new Schema({

    title: String,      //  Title of tutor
    datetime: String,       // Date of tutor
    text: String,       //  Description of tutor
    available: String,   // Availability of tutor
    contact: String        // Link of tutor
})


const Tutor = mongoose.model("tutoring", tutor)

module.exports = Tutor