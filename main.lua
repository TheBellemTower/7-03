-----------------------------------------------------------------------------------------
--
-- main.lua
--
--Created by Ethan Bellem
--Createed on April 2018
-----------------------------------------------------------------------------------------

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 ) -- ( x, y )
--physics.setDrawMode( "hybrid" )   -- Shows collision engine outlines only

local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = display.contentCenterX 
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local Ground = display.newImage( "./assets/sprites/land.png" )
Ground.x = display.contentCenterX + 900
Ground.y = 1000
Ground.id = "the ground"
physics.addBody( Ground, "static", { 
    friction = 0.5, 
    bounce = 0.3 
    } )

local theCharacter = display.newImage( "./assets/sprites/santa.png" )
theCharacter.x = display.contentCenterX + 900
theCharacter.y = 900
theCharacter.id = "the character"
theCharacter.isFixedRotation = true
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = .7
    } )

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 150
dPad.alpha = 0.50
dPad.id = "d-pad"

local up = display.newImage( "./assets/sprites/upArrow.png" )
up.x = 150
up.y = display.contentHeight - 260
up.id = "up arrow"

local down = display.newImage( "./assets/sprites/downArrow.png" )
down.x = 150
down.y = display.contentHeight - 40
down.id = "down arrow"

local left = display.newImage( "./assets/sprites/leftArrow.png" )
left.x = 40
left.y = display.contentHeight - 150
left.id = "left arrow"

local right = display.newImage( "./assets/sprites/rightArrow.png" )
right.x = 260
right.y = display.contentHeight - 150
right.id = "right arrow"
 
function up:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
            x = 0, -- move 0 in the x direction 
            y = -50, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function down:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
            x = 0, -- move 0 in the x direction 
            y = 50, -- move up 50 pixels
            time = 100 -- move in a 1/10 of a second
            } )
    end

    return true
end

function left:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
            x = -50, 
            y = 0, 
            time = 100 
            } )
    end

    return true
end

function right:touch( event )
    if ( event.phase == "ended" ) then
        -- move the character up
        transition.moveBy( theCharacter, { 
            x = 50,  
            y = 0, 
            time = 100 
            } )
    end

    return true
end

up:addEventListener( "touch", up )
down:addEventListener( "touch", down )
left:addEventListener( "touch", left )
right:addEventListener( "touch", right )
