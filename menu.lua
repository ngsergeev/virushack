-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local widget = require("widget")


function scene:create( event )
	local sceneGroup = self.view
	
	local height = display.contentHeight / 3
	local width = display.contentWidth * 3 / 4
    local sheduleParams = { width = width, 
							height = height, 
							x = display.contentCenterX, 
							y = height * 2 / 3, 
							defaultFile = "rasp.png",
							selected=false,
							onRelease = function ( event )
											composer.gotoScene("shedule")
										end	
						}
    local shedule = widget.newButton(sheduleParams)                            
	sceneGroup:insert( shedule )
	
	local articlesParams = { width = width, 
							height = height, 
							x = display.contentCenterX, 
							y = display.contentHeight - height * 2 / 3, 
							defaultFile = "stati.png",
							selected=false,
							onRelease = function ( event )
											composer.gotoScene("topics")
										end	
						}
    local articles = widget.newButton(articlesParams)                            
    sceneGroup:insert( articles )

end

function scene:show( event )
    display.setDefault("background", 195/255, 183/255, 172/255)
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
	elseif phase == "did" then
		print("showed menu")
	end	
end


    
function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
	elseif phase == "did" then
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
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


system.request("suspendApplication")
-----------------------------------------------------------------------------------------

return scene
