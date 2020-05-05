-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()


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

    
    function getText(text, fontSize, prevText, shift)
        newText = prevText
        newText.text = text
        newText.y = prevText.y + prevText.height + shift
        newText.fontSize = fontSize
        return newText
    end
	
	-- local background = display.newRect( display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
	-- background:setFillColor(1)	-- white
	
	-- local title = display.newText( "Как защитить себя от вируса", display.contentCenterX, 125, native.systemFont, 32 )
    
    local newTitleParams = { text = "Досуг на карантине", 
							x = display.contentCenterX + 10, 
							y = 30, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 32, 
                            align = "left" }
    local title = display.newText(newTitleParams)                            
    title:setFillColor( 90/255, 96/255, 90/255 )	-- black
    scrollView:insert( title )
    
    local line = display.newRoundedRect(display.contentCenterX, title.y + title.height, display.contentWidth * 3 / 4, 3, 0)
    line:setFillColor(105/255, 100/255, 100/255)
    
    scrollView:insert( line )
    

    local newTextParams = { text = [[Досуг на карантине
    За прошедшее время самоизоляции и карантина у вас наверняка все запасы сладостей съедены, сериалы просмотрены, а кот в ужасе прячется от ваших попыток почесать ему пузико. Чем же заняться, чтобы не сойти с ума сидя дома и отвлечься от новостей про коронавирус? Мы нашли парочку идей!
    
    Выучить разговорный английский
    Многие неплохо разбираются в грамматике иностранного языка и имеют неплохой словарный запас, но применять все это на практике получается с трудом. Яндекс предлагает это исправить: для этого запущена бесплатная платформа Яндекс.Флоу, с которой можно получить навыки разговорного английского. Когда карантин кончится, будет приятно заказать кофе где-нибудь в Европе и поболтать с бариста без паники и мучительных попыток составить осмысленное предложение.
    Освоить программирование
    Кризис показал, что наличие навыков в самых разных сферах может помочь не потерять заработок. Разумеется, все вокруг говорят об IT. Пока мир замер в карантине, самое время попробовать свои силы, благо, можно сделать это бесплатно. Помогут видеолекции Технопарка и Mail.ru Group для тех, кто хочет научиться языкам программирования, основам анализа данных, мобильной разработки и т.д. Курсы академии Microsoft помогут освоить программирование и основы компьютерной грамотности.
    Читать и слушать книги из школьной программы
    Помните, как вас раздражали нудные книжки на уроках литературы в школе? Мы готовы поспорить, что сейчас эти произведения вы будете воспринимать совсем по-другому. А тут как раз «1°C: Аудиокниги» дает послушать произведения из школьной программы и списка внеклассного чтения — попробуете?
    Заняться здоровьем
    Многим из нас не хватало времени, чтобы прислушаться к себе, заняться своим самочувствием и здоровьем. Конечно, сейчас не получится сдать все анализы и спокойно ходить по врачам, но с некоторыми вопросами телемедицина может помочь — онлайн-консультации врачей доступны на Яндекс.Здоровье, SmartMed и других платформах. Перед записью проверьте, нет ли у приложений промокода — например, ОнлайнДоктор по коду CORONA2019 даёт доступ к бесплатной консультации дежурного врача.
    Заняться рукоделием
    Мелкая моторика и творчество помогают снизить уровень стресса — предлагаем воспользоваться этим. YouTube полон мастерклассов на любую тему, а ещё найти туториалы можно на сайте Леонардо — и там же заказать все нужные материалы.
    Готовить что-то кроме гречки
    Скачиваем приложение «Афиша Еда» или Food and Feed (не пугайтесь, оно тоже русскоязычное). Более 10 тысяч пошаговых рецептов, выбор рецептов по картинке, названию или ингредиентам.]], 
							x = display.contentCenterX + 10, 
							y = title.y + title.height + 20, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 14, 
                            align = "left",
                            align = "top" }
	local summary = display.newText( newTextParams )
	summary:setFillColor( 0 ) -- black
    summary.anchorY = 0

    scrollView:insert( summary )
	
	-- all objects must be added to group (e.g. self.view)
    -- sceneGroup:insert( background )
    
    local img = display.newImageRect("tree.png", 200, 200)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height + 20 + img.height / 2
    scrollView:insert( img )

    local url = "http://www.coronalabs.com"
    local textParams = { text = url, 
							x = display.contentCenterX + 10, 
							y = img.y + img.height/2 + 20, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 14, 
                            align = "left",
                            align = "top" }
    local link = display.newText( textParams )
    link:setFillColor(0/255, 100/255, 220/255)

    function link:touch( event )
        if event.phase == "began" then
            if ( system.canOpenURL( url ) ) then
                system.openURL( url )
                print("open")
            else
                print( "WARNING: wrong link!" )
            end
        end
    end

    
    link:addEventListener("touch", link)

    scrollView:insert( link )
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
