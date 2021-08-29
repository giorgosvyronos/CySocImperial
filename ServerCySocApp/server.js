const { equal } = require('assert')
const express = require('express')
const { get } = require('http')
const mongoose = require('mongoose')
var app = express()
// var Data = require('./noteSchema')
var Event = require('./eventsSchema')
var Announcement = require('./announceSchema')
var Housing = require('./housingSchema')
var Job = require('./jobsSchema')
var Tutor = require('./tutoringSchema')




mongoose.connect('mongodb://localhost/newDB')

mongoose.connection.once("open", () => {
    
    console.log("Connected to DB!")

}).on("error", (error) => {

    console.log("Failed to connect " + error)

})

//==================================CREATE==============================//
// CREATE A NOTE -- POST request
app.post("/create", (req, res) => {

    var note = new Data ({
        note: req.get("note"),
        title: req.get("title"),
        date: req.get("date")
    })

    note.save().then(() => {
        if(note.isNew == false){
            console.log("Saved data!")
            res.send("Saved data!")
        }else{
            console.log("Failed to save data!")
        }
    })
})

// CREATE AN EVENT -- POST request
app.post("/events/create", (req, res) => {

    var event = new Event ({
        title: req.get("title"),
        datetime: req.get("datetime"),
        location: req.get("location"),
        text: req.get("text"),
        link: req.get("link")
    })

    event.save().then(() => {
        if(event.isNew == false){
            console.log("Saved event data!")
            res.send("Saved event data!")
        }else{
            console.log("Failed to save event data!")
        }
    })
})

// CREATE AN ANNOUNCEMENT -- POST request
app.post("/announcements/create", (req, res) => {

    var announcement = new Announcement ({
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link")
    })

    announcement.save().then(() => {
        if(announcement.isNew == false){
            console.log("Saved announcement data!")
            res.send("Saved announcement data!")
        }else{
            console.log("Failed to save announcement data!")
        }
    })
})

// CREATE A JOB -- POST request
app.post("/jobs/create", (req, res) => {

    var job = new Job ({
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link")
    })

    job.save().then(() => {
        if(job.isNew == false){
            console.log("Saved Job data!")
            res.send("Saved Job data!")
        }else{
            console.log("Failed to save Job data!")
        }
    })
})

// CREATE A HOUSING -- POST request
app.post("/housings/create", (req, res) => {

    var housing = new Housing ({
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link"),
        contact: req.get("contact")
    })

    housing.save().then(() => {
        if(housing.isNew == false){
            console.log("Saved Housing data!")
            res.send("Saved Housing data!")
        }else{
            console.log("Failed to save Housing data!")
        }
    })
})

// CREATE A HOUSING -- POST request
app.post("/tutors/create", (req, res) => {

    var tutor = new Tutor ({
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        available: req.get("available"),
        contact: req.get("contact")
    })

    tutor.save().then(() => {
        if(tutor.isNew == false){
            console.log("Saved Tutor data!")
            res.send("Saved Tutor data!")
        }else{
            console.log("Failed to save Tutor data!")
        }
    })
})



//http://192.168.10.13:8081/create
var server = app.listen(8081, "192.168.10.13", () => {
    console.log("Server is running!")
})







// DELETE A NOTE -- POST request

app.post("/delete", (req,res) => {
    Data.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete" + err)
        }else{
            console.log("Deleted!")
        }
    })
    res.send("Deleted!")
})

// DELETE AN EVENT -- POST request

app.post("/events/delete", (req,res) => {
    Event.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete event" + err)
        }else{
            console.log("Event Deleted!")
        }
    })
    res.send("Event Deleted!")
})

// DELETE AN ANNOUNCEMENT -- POST request

app.post("/announcements/delete", (req,res) => {
    Announcement.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete announcement" + err)
        }else{
            console.log("Announcement Deleted!")
        }
    })
    res.send("Announcement Deleted!")
})

// DELETE A JOB -- POST request

app.post("/jobs/delete", (req,res) => {
    Job.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete job" + err)
        }else{
            console.log("Job Deleted!")
        }
    })
    res.send("Job Deleted!")
})

// DELETE A HOUSING -- POST request

app.post("/housings/delete", (req,res) => {
    Housing.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete housing" + err)
        }else{
            console.log("Housing Deleted!")
        }
    })
    res.send("Housing Deleted!")
})

// DELETE A HOUSING -- POST request

app.post("/tutors/delete", (req,res) => {
    Tutor.findOneAndRemove({
        _id: req.get("id")
    },(err) => {
        if(err){
        console.log("Failed to delete tutor" + err)
        }else{
            console.log("Tutor Deleted!")
        }
    })
    res.send("Tutor Deleted!")
})





// UPDATE A NOTE -- POST request
app.post("/update", (req,res) => {
    Data.findOneAndUpdate({
        _id: req.get("id")
    },{
        note: req.get("note"),
        date: req.get("date"),
        title: req.get("title")

    },(err) => {
        if(err){
        console.log("Failed to update " + err)
        }else{
            console.log("Updated!")
        }
    })
    res.send("Updated!")
})

// UPDATE AN EVENT -- POST request
app.post("/events/update", (req,res) => {
    Event.findOneAndUpdate({
        _id: req.get("id")
    },{
        title: req.get("title"),
        datetime: req.get("datetime"),
        location: req.get("location"),
        text: req.get("text"),
        link: req.get("link")

    },(err) => {
        if(err){
        console.log("Failed to update event " + err)
        }else{
            console.log("Event Updated!")
        }
    })
    res.send("Event Updated!")
})

// UPDATE AN ANNOUNCEMENT -- POST request
app.post("/announcements/update", (req,res) => {
    Announcement.findOneAndUpdate({
        _id: req.get("id")
    },{
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link")

    },(err) => {
        if(err){
        console.log("Failed to update announcement " + err)
        }else{
            console.log("Announcement Updated!")
        }
    })
    res.send("Announcement Updated!")
})

// UPDATE AN JOB -- POST request
app.post("/jobs/update", (req,res) => {
    Job.findOneAndUpdate({
        _id: req.get("id")
    },{
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link")

    },(err) => {
        if(err){
        console.log("Failed to update job " + err)
        }else{
            console.log("Job Updated!")
        }
    })
    res.send("Job Updated!")
})

// UPDATE A HOUSING -- POST request
app.post("/housings/update", (req,res) => {
    Housing.findOneAndUpdate({
        _id: req.get("id")
    },{
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        link: req.get("link"),
        contact:req.get("contact")

    },(err) => {
        if(err){
        console.log("Failed to update housing " + err)
        }else{
            console.log("Housing Updated!")
        }
    })
    res.send("Housing Updated!")
})

// UPDATE A TUTOR -- POST request
app.post("/tutors/update", (req,res) => {
    Tutor.findOneAndUpdate({
        _id: req.get("id")
    },{
        title: req.get("title"),
        datetime: req.get("datetime"),
        text: req.get("text"),
        available: req.get("available"),
        contact:req.get("contact")

    },(err) => {
        if(err){
        console.log("Failed to update tutor " + err)
        }else{
            console.log("Tutor Updated!")
        }
    })
    res.send("Tutor Updated!")
})

//FETCH ALL NOTES -- GET request
app.get('/fetch', (req,res) => {
    Data.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})

//FETCH ALL EVENTS -- GET request
app.get('/events/fetch', (req,res) => {
    Event.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})

//FETCH ALL EVENTS -- GET request
app.get('/announcements/fetch', (req,res) => {
    Announcement.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})

//FETCH ALL EVENTS -- GET request
app.get('/jobs/fetch', (req,res) => {
    Job.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})

//FETCH ALL EVENTS -- GET request
app.get('/housings/fetch', (req,res) => {
    Housing.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})

//FETCH ALL EVENTS -- GET request
app.get('/tutors/fetch', (req,res) => {
    Tutor.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})