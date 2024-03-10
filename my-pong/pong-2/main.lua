push = require 'push'

WW = 1280
WH = 720

VW = 432
VH = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    smallFont = love.graphics.newFont('font.ttf', 8)
    love.graphics.setFont(smallFont)

    push:setupScreen(VW, VH, WW, WH, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.draw()
    push:apply('start')
    
    -- important les /255 sinon il comprends pas dans quel dimension clear
   -- love.graphics.clear(40/255, 45/255, 52/255, 255/255)
    
    love.graphics.printf('Hello World!', 0, 20, VW, 'center')

    love.graphics.rectangle('fill', 10, 30, 5, 20)
    love.graphics.rectangle('fill', VW - 10, VH - 50, 5, 20)
    love.graphics.rectangle('fill', VW / 2 - 2, VH / 2 - 2, 4, 4)

    push:apply('end')
end