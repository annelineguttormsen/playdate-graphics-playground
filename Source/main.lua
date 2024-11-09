import "CoreLibs/graphics"
import "CoreLibs/crank"
import "graphic/RadioWave"

local screenWidth, screenHeight = playdate.display.getSize()
local ticksPerRevolution = 6
local gfx <const> = playdate.graphics
local font = gfx.font.new('font/Mini Sans 2X') -- DEMO

local function loadGame()
	playdate.display.setRefreshRate(20)
	math.randomseed(playdate.getSecondsSinceEpoch()) -- seed for math.random
	gfx.setFont(font) -- DEMO
	RadioWave:init(0, screenHeight / 2, screenWidth, screenHeight / 2, 10, 10, 10, 10)
end

local function updateGame()
	local crankTicks = playdate.getCrankTicks(ticksPerRevolution)
	if crankTicks == 1 then
		RadioWave:update(0, screenHeight / 2, screenWidth, screenHeight / 2, 20, 50, 10, 10)
	elseif crankTicks == -1 then
		RadioWave:update(0, screenHeight / 2, screenWidth, screenHeight / 2, 20, 50, 10, 10)
	else
		RadioWave:update(0, screenHeight / 2, screenWidth, screenHeight / 2, 10, 10, 10, 10)
	end
end

local function drawGame()
	gfx.clear() -- Clears the screen
	RadioWave:draw()
end

loadGame()

function playdate.update()
	updateGame()
	drawGame()
	playdate.drawFPS(0,0) -- FPS widget
end