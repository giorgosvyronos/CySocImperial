var mongoose = require('mongoose')
var Schema = mongoose.Schema

var event = new Schema({

    title: String,          // Title of event
    datetime: String,       // Date and time of event
    location: String,       // Location of event
    text: String,    // Description of event
    link: String,           // Link to Facebook event
})


const Event = mongoose.model("data", event)

module.exports = Event