-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function getText(text, fontSize, prevText, shift)
    newText = prevText
    newText.text = text
    newText.y = prevText.y + prevText.height + shift
    newText.fontSize = fontSize
    return newText
end


function scene:create( event )
    local sceneGroup = self.view
    
    local function scrollListener( event )
        local phase = event.phase
        local direction = event.direction

        if event.limitReached then
            if "up" == direction then
                print("Reached top limit")
            elseif "down" == direction then
                print("Reached Bottom Limit")
            end
        end

        return true
    end
    local widget = require("widget")

    local scrollView = widget.newScrollView(
        {
            left = 0,
            top = 0,
            width = display.contentWidth,
            height = display.contentHeight,
            topPadding = 50,
            bottomPadding = 50,
            horizontalScrollDisabled = true,
            verticalScrollDisabled = false,
            listener = scrollListener,
            hideBackground = true,
        }
    )
	    
    local newTitleParams = { text = "Популярные темы", 
							x = display.contentCenterX + 10, 
							y = 0, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 32, 
                            align = "left" }
    local title = display.newText(newTitleParams)                            
    title:setFillColor( 0 )	-- black
    scrollView:insert( title )
    
    local newParams =  getText("1. Вирус и карантин", 20, newTitleParams, 50)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Карантин стал не легким испытанием для многих людей. Чтобы как-то помочь сориентироваться в стремительное меняющейся ситуации мы подготовили для вас подборку статей, которые помогут быть в курсе происходящего и не скучать.", 14, newParams, 80)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Перейти к подборке", 14, newParams, 75)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("virusList")
        end
    end
    summary:addEventListener("touch", summary)
    scrollView:insert( summary )

    local newParams =  getText("2. Досуг", 20, newTitleParams, 50)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Карантин меняет представление людей обо всех сферах жизни. Коснулось это и такой важной части, как досуг. В этой подборке статей мы постарались собрать для вас все, что может быть вам интересно, если вы не знаете, чем занять себя на карантине.", 14, newParams, 80)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Перейти к подборке", 14, newParams, 75)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("dosugList")
        end
    end
    summary:addEventListener("touch", summary)
    scrollView:insert( summary )

    sceneGroup:insert( scrollView )
end

function scene:show( event )
    display.setDefault("background", 210/255, 201/255, 192/255)
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
