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



//FETCH ALL NOTES -- GET request
app.get('/fetch', (req,res) => {
    Data.find({}).then((DBitems) =>{
        res.send(DBitems)
    })
})