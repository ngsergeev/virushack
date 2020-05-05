-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local widget = require "widget"
local composer = require( "composer" )
local os = require("os")

local scene = composer.newScene()

-- set background
local r = 40
local g = 80
local b = 150
local strength = 2.5
r = r*strength
g = g*strength
b = b*strength
display.setDefault("background", r/255, g/255, b/255)

-- Constants
local daysec = 86400


-- Functions
function nextDay(time, days)
	days = days or 1
	return time + days * daysec
end


function getWeekStart(time)
	for i=0,6 do
		local date = os.date("*t", time-i*daysec)
		if (date.wday == 2) then
			return time-i*daysec
		end
	end
	return 0
end


function getFormatedDate(time)
	return os.date("%b %d", time)
end

function gotoDayTasks(event, time)
    if event.phase == "ended" then
        print(os.date("%c", time))
    end
end

-- Scene Logic
function scene:create( event )
	local sceneGroup = self.view
	
	-- Get local time, trim it to 12:00
	local time = os.time()
	local date = os.date("*t", time)
	time = os.time( {year=date.year,
					 month=date.month,
					 day=date.day})
	local wst = getWeekStart(time)
	print(getFormatedDate(wst))

	
	local pos = {10, -10}
	local shape = {300, 60}
	local skip = 10

	days = {"Mon.png", "Tu.png", "Wd.png", "Th.png", "Fr.png", "St.png", "Su.png"}
	for i=0, 6 do
		days[i] = days[i + 1]
		print(days[i])
	end
	
	-- Create buttons for the week, starting with Monday
	for i=0,6 do
		local options = {
			left=pos[1], 
			top=pos[2] + i * shape[2] + i * skip,
			label=tostring(getFormatedDate(wst + i * daysec)),
			defaultFile = days[i],
			labelColor = { default = {200,79,189}, over = {39,135,184},},
			fontSize = 14,
			labelXOffset = 30,
			width=shape[1], height=shape[2],
			onRelease = function(event) 
							gotoDayTasks(event, wst + i * daysec)
						end
		}
		
		local B = widget.newButton(options)

		sceneGroup:insert(B)
		
	end
end

function scene:show( event )
	display.setDefault("background", 52/255, 38/255, 24/255)
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end


    
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
		
		composer.removeScene(scene)
		
	elseif phase == "did" then
		-- Called when the scene is now off screen

	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

function scene:scroll( event )
	local sceneGroup = self.view
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )


-----------------------------------------------------------------------------------------

return scene
