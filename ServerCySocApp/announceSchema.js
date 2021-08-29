var mongoose = require('mongoose')
var Schema = mongoose.Schema

var announcement = new Schema({

    title: String,      //  Title of announcement
    datetime: String,       // Date of announcement
    text: String,       //  Description of announcement
    link: String        // Link of announcement
})


const Announcement = mongoose.model("data", announcement)

module.exports = Announcement