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
    
    local newTitleParams = { text = "Домашние тренировки", 
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
    

    local params = { text = [[Чтобы совсем не скиснуть дома, можно разнообразить свой день тренировками. Даже если раньше вы не увлекались спортом, то сейчас самое время. Гиподинамия - не лучшее, что можно получить от самоизоляции.

    Вашему вниманию представлена базовые упражнения, которые позволят не задеревенеть во время режима самоизоляции.
    
    1) Планка
    
    Встаньте в положение «упор лежа». Поднимите голову и расправьте плечи. Расположите кисти рук на уровне плеч под углом 90 градусов, чтобы равномерно распределить нагрузку и предупредить травму суставов. Втяните живот, сожмите ягодицы и соедините стопы. Держите спину прямо и не сгибайте ноги в коленях. Будьте неподвижны и не забывайте равномерно дышать.
    
    Максимально напрягайте мышцы пресса и не опускайте поясницу. Если вы правильно выполняете планку, то ваше тело образует прямую линию.
    
    Длительность стойки в планке зависит от вашего уровня подготовки. Начните с 30 секунд и увеличивайте время каждые 2–3 дня на 30 секунд. Развивайте выносливость и старайтесь довести планку до 3 минут.]], 
							x = display.contentCenterX + 10, 
							y = title.y + title.height + 20, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
							fontSize = 14, 
                            align = "left",
                            align = "top" }
	local summary = display.newText( params )
	summary:setFillColor( 0 ) -- black
    summary.anchorY = 0

    scrollView:insert( summary )

    local img = display.newImageRect("0.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height + 20 + img.height / 2
    scrollView:insert( img )

    params.y = img.y
    local params = getText([[2) Отжимания

    Примите упор лежа (лягте лицом вниз на пол, руки поставьте чуть шире плеч). Придайте телу правильную позу для отжиманий от пола ‒ форму прямой линии. Плечи должны быть немного выше уровня таза. Голова должна смотреть в пол.
    
    Ладони — на вертикали плеч, параллельно друг другу, направление пальцев — параллельно телу. Правильная постановка рук при классических отжиманиях от пола — на ширине плеч или немного шире.
    
    Руки согнуты, локти направлены в стороны под углом 45 градусов от тела, пальцы рук смотрят вперед
    
    Положение стоп непринципиально: они могут быть сведены либо расставлены.
    
    Плавно сгибайте локти медленно опускайтесь вниз, после чего поднимитесь обратно.
    
    Нижняя точка — по достижении прямого угла между бицепсом и предплечьем. Грудь касается пола.
    
    В верней позиции руки не распрямляют до конца, чтобы не блокировать локтевой сустав. В верхней точке задержаться.
    
    Чтобы повысить эффективность упражнения и не допустить травмоопасной осевой нагрузки на позвоночник, напрягите мышцы пресса.]], 14, params, 450)
    local summary = display.newText( params )
    summary:setFillColor( 0 ) -- black
    scrollView:insert(summary)
    
    local img = display.newImageRect("4.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height / 2
    scrollView:insert( img )

    params.y = img.y

    local params = getText([[3) Подтягивания коленей к груди сидя

    Сядьте на пол и примите удобный упор руками сзади
    
    Подтяните колени к груди и одновременно сделайте выдох
    
    Выпрямите ноги опуская их на пол или удерживая в воздухе
    
    Когда поднимаете колени к груди, то одновременно идите им навстречу всем телом]], 14, params, 250)
    local summary = display.newText( params )
    summary:setFillColor( 0 ) -- black
    scrollView:insert(summary)

    local img = display.newImageRect("5.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height / 2
    scrollView:insert( img )

    local img = display.newImageRect("6.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height * 2
    scrollView:insert( img )

    params.y = img.y

    local params = getText([[4) Отжимания от стульев

    Расположите ладони на стульях, ноги поставьте на пол, напрягите пресс.
    
    На выдохе вытолкните вес тела вверх, ощущая работу трицепса. Локти при этом смотрят назад — строго не в стороны.
    
    Отталкиваясь от стульев как можно сильнее, раскрывая грудь — задержитесь в положении 1-2 сек.
    
    На вдохе медленно опуститесь вниз, не сгибая коленей и держа пресс напряженным. В нижней точке движения локти должны быть параллельны полу.]], 14, params, 250)
    local summary = display.newText( params )
    summary:setFillColor( 0 ) -- black
    scrollView:insert(summary)

    local img = display.newImageRect("7.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height / 2
    scrollView:insert( img )


    local params = getText([[5) Приседания

    На вдохе, отводя таз назад, согните ноги в коленях до прямого угла. На выдохе вернитесь в исходную позицию.]], 14, params, 450)
    local summary = display.newText( params )
    summary:setFillColor( 0 ) -- black
    scrollView:insert(summary)

    local img = display.newImageRect("1.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height / 2
    scrollView:insert( img )

    local img = display.newImageRect("2.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height * 2
    scrollView:insert( img )

    local img = display.newImageRect("3.jpg", 200, 140)
    img.x = display.contentCenterX
    img.y = summary.y + summary.height/2 + 20 + img.height * 7 / 2
    scrollView:insert( img )

    params.y = img.y

    local params = getText([[Для более искушенных читателей мы предлагаем вам подборку ресурсов с разнообразными программами тренировок, которые можно выполнять как и в удобное для вас время, так и в прямом эфире с друзьями и тренером:

    Nike - прямые эфиры в Instagram, занятия проводят тренеры московских беговых клубов, известные спортсмены и даже главный тренер сборной по легкой атлетике Юрий Борзаковский. Расписание можно найти на nikemoscow.com.
    
    adidas - тренировки от амбассадоров бренда и капитанов команды adiadas Runners проводятся в группе на Facebook, расписание также можно найти там. Кроме того, ребята устраивают Zoom-вечеринки, это такой приятный лаунж-бонус. World Class - фитнес-сеть перевела тренировки в онлайн, они доступны в аккаунтах клуба в Instagram и YouTube. Занятия проводят профессиональные тренеры.
    
    Российский производитель одежды Gri предложил всем желающим в течении месяца выполнять ежедневные упражнения и получить по его итогам эксклюзивную футболку.
    
    Организатор гонок по триатлону Ironstar запустил челлендж и предлагает принять участие в индор-триатлоне. Велостанки и беговые дорожки можно заменить специальными упражнениями. Гонки проходят в Zoom по выходным, а в течении недели можно принять участие в тренировках и викторинах.
    
    You-tube каналы, ориентированные на спорт во время карантина и не только:]], 14, params, 500)
    local summary = display.newText( params )
    summary:setFillColor( 0 ) -- black
    scrollView:insert(summary)

	-- all objects must be added to group (e.g. self.view)
    -- sceneGroup:insert( background )
    

    local url = "https://www.youtube.com/channel/UCpQ34afVgk8cRQBjSJ1xuJQ"
    local textParams = { text = url, 
							x = display.contentCenterX + 10, 
							y = summary.y + summary.height/2 + 20, 
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
    local url = "https://www.youtube.com/channel/UCZIIRX8rkNjVpP-oLMHpeDw"
    local textParams = { text = url, 
							x = display.contentCenterX + 10, 
							y = summary.y + summary.height/2 + 60, 
							width = display.contentWidth * 3 / 4, 
							height = 0, 
							font = native.systemFont, 
                            fontSize = 14, 
                            align = "left",
                            align = "top" }
    local link = display.newText( textParams )
    link:setFillColor(0/255, 100/255, 220/255)
    link:addEventListener("touch", link)
    scrollView:insert( link )
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
