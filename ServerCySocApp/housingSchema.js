var mongoose = require('mongoose')
var Schema = mongoose.Schema

var house = new Schema({

    title: String,          // Title of House
    datetime: String,       // Date and Time of Availability
    text: String,    //  Description of House
    link: String,            // Link of Job
    contact: String         // Contact for House
})


const House = mongoose.model("data", house)

module.exports = House