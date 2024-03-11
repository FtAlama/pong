push = require 'push'

WW = 1280
WH = 720

VW = 432
VH = 243

PADDLE_SPEED = 250

function love.load()

    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)

    love.graphics.setFont(smallFont)

    push:setupScreen(VW, VH, WW, WH, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Y = 30
    player2Y = VH - 50

    ballX = VW / 2 - 2
    ballY = VH / 2 - 2

    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50, 50)

    gameState = 'start'
end

function love.update(dt)

    if love.keyboard.isDown('z') then
        player1Y = math.max(0, player1Y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('s') then
        player1Y = math.min(VH - 20, player1Y + PADDLE_SPEED * dt)
    end

    if love.keyboard.isDown('up') then
        player2Y = math.max(0, player2Y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('down') then
        player2Y = math.min(VH - 20, player2Y + PADDLE_SPEED * dt)
    end

    if gameState == 'play' then
        ballX = ballX + ballDX * dt
        ballY = ballY + ballDY * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' or key == 'space' then
        if gameState == 'start' then
            gameState = 'play'
        --else
            --gameState = 'start'

            --ballX = VW / 2 - 2
            --ballY = VH / 2 - 2

            --ballDX = math.random(2) == 1 and 100 or -100
            --ballDY = math.random(-50, 50) * 1.5
        end
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.setFont(smallFont)

    if gameState == 'start' then
        love.graphics.printf('Hello Start State!', 0, 20, VW, 'center')
    else
        love.graphics.printf('Hello Play State!', 0, 20, VW, 'center')
    end

    love.graphics.rectangle('fill', 10, player1Y, 5, 20)
    love.graphics.rectangle('fill', VW - 10, player2Y, 5, 20)

    love.graphics.rectangle('fill', ballX, ballY, 4, 4)
    push:apply('end')
end