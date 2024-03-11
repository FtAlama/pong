push = require 'push'

WW = 1280
WH = 720

VW = 432
VH = 243

PADDLE_SPEED = 200


function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')
    smallFont = love.graphics.newFont('font.ttf', 8)

    scoreFont = love.graphics.newFont('font.ttf', 32)
    love.graphics.setFont(smallFont)

    push:setupScreen(VW, VH, WW, WH, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1Score = 0
    player2Score = 0

    player1Y = 30
    player2Y = VH - 50
end

function love.update(dt)
    if love.keyboard.isDown('z') then
        player1Y = player1Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('s') then
        player1Y = player1Y + PADDLE_SPEED * dt
    end

    if love.keyboard.isDown('up') then
        player2Y = player2Y + -PADDLE_SPEED * dt
    elseif love.keyboard.isDown('down') then
        player2Y = player2Y + PADDLE_SPEED * dt
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')

    love.graphics.clear(40/255, 45/255, 52/255, 255/255)

    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello pong!', 0, 20, VW, 'center')

    love.graphics.setFont(scoreFont)

    love.graphics.print(tostring(player1Score), VW / 2 - 50,
        VH / 3)

    love.graphics.print(tostring(player2Score), VW / 2 + 30,
        VH / 3)
        
    love.graphics.rectangle('fill', 10, player1Y, 5, 20)

    love.graphics.rectangle('fill', VW - 10, player2Y, 5, 20)

    love.graphics.rectangle('fill', VW / 2 - 2, VH /2 - 2, 4, 4)

    push:apply('end')
end