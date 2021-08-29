const { equal } = require('assert')
const express = require('express')
const { get } = require('http')
const mongoose = require('mongoose')
var app = express()
var Data = require('./noteSchema')
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