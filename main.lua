display.setStatusBar( display.DefaultStatusBar )

local widget = require "widget"
local composer = require "composer"

scenes = {}

local function onMenu( event )
	print(composer.getSceneName("current"))
	if composer.getSceneName("current") == "virusList" then
		composer.gotoScene("menu")
	elseif composer.getSceneName("current") == "dosugList" then
		composer.gotoScene("menu")
	elseif composer.getSceneName("current") == "menu" then
	else
		local scene = composer.getSceneName("previous")
		if scene == nil then
		else 
			composer.gotoScene(scene)
		end
	end
end

buttonParams =	{defaultFile="back.png", overFile="back.png", width = 32, height = 32, onPress=onMenu, selected=true, x=display.contentWidth / 2, y=display.contentHeight + 50}

local button = widget.newButton(buttonParams)

composer.gotoScene("menu")


