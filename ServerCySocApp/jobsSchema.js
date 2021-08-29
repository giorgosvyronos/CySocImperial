var mongoose = require('mongoose')
var Schema = mongoose.Schema

var job = new Schema({

    title: String,          // Title of Job
    datetime: String,       // Date and Time of Job
    text: String,    //  Description of Job
    link: String            // Link of Job
})


const Job = mongoose.model("job", job)

module.exports = Job