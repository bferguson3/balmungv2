extends Node

var acceptPressed
var acceptReleased = true
var cancelPressed
var cancelReleased = true
var leftPressed
var leftReleased = true
var rightPressed
var rightReleased = true
var upPressed
var upReleased = true
var downPressed
var downReleased = true

enum inputModes { noInput, moving }
var inputMode


var playerBlockedDown
var playerBlockedUp
var playerBlockedLeft
var playerBlockedRight