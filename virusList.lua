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
	    
    local newTitleParams = { text = "Вирус и карантин", 
							x = display.contentCenterX + 10, 
							y = 0, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 40, 
                            align = "left" }
    local title = display.newText(newTitleParams)                            
    title:setFillColor( 0 )	-- black
    scrollView:insert( title )

    local line = display.newRoundedRect(display.contentCenterX, title.y + title.height /2, display.contentWidth * 3 / 4, 3, 0)
    line:setFillColor(105/255, 100/255, 100/255)
    scrollView:insert(line)
    
    local newParams =  getText("1. Как защитить себя от вируса", 20, newTitleParams, 90)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Не смотря на то, что тема с вирусом у всех на слуху, далеко не все знают, как именно распространяется болезнь, чем она опасна и как защитить себя и своих близких. Обо всем этом читайте в нашей статье.", 14, newParams, 90)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Читать статью", 14, newParams, 60)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("article")
        end
    end
    summary:addEventListener("touch", summary)
    scrollView:insert( summary )

    local newParams =  getText("2. Типы масок", 20, newTitleParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Проблема правильного выбора масок сейчас актуальна как нигода. Давайте разберемся, какие типы бывают и как выбрать подходящую.", 14, newParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Читать статью", 14, newParams, 60)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("article")
        end
    end
    summary:addEventListener("touch", summary)
    scrollView:insert( summary )

    local newParams =  getText("3. Домашние тренировки", 20, newTitleParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Карантин, еще не повод запускать себя, и в этом вам поможет эта статья. В ней мы расскажем, как поддерживать себя в форме тренеруясь дома.", 14, newParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Читать статью", 14, newParams, 60)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("sport_article")
        end
    end
    summary:addEventListener("touch", summary)
    scrollView:insert( summary )

    local newParams =  getText("4. Антисептик?", 20, newTitleParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("В настоящее время антисептик пользуется огромным спросом, и порой его трудно найти в магазинах. Рассказываем о плюсах и минусах. ", 14, newParams, 70)
    local summary = display.newText(newParams)
    summary:setFillColor( 0 ) -- black
    scrollView:insert( summary )

    local newParams =  getText("Читать статью", 14, newParams, 60)
    local summary = display.newText(newParams)
    summary:setFillColor(0/255, 100/255, 220/255) -- black
    function summary:touch( event )
        if event.phase == "began" then
            composer.gotoScene("article")
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
	elseif phase == "did" then
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

-----------------------------------------------------------------------------------------

return scene
