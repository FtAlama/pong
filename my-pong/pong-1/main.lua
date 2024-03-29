
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VRW = 432
VIRTUAL_HEIGHT = 243

function love.load()
	
	love.graphics.setDefaultFilter('nearest', 'nearest')

	push:setupScreen(VRW, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false;
		resizable = false;
		vsync = true
	})
end

function love.keypressed(key)
	if key == 'escape' then
		love.event.quit();
	end 
end

function love.draw()

	push:apply('start')

	love.graphics.printf(
		'Hello World !',
		0,
		VIRTUAL_HEIGHT / 2 - 6,
		VRW,
		'center'
	)
	push:apply('end')	
end