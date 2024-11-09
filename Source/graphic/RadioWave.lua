import "CoreLibs/graphics"
import "CoreLibs/object"

local gfx <const> = playdate.graphics

class("RadioWave").extends()

function RadioWave:init(startX, startY, endX, endY, startAmp, endAmp, period, phaseshift)
  self.meta = {
    startX = startX,
    startY = startY,
    endX = endX,
    endY = endY,
    startAmp = startAmp, 
    endAmp = endAmp, 
    period = period, 
    phaseshift = phaseshift
  }
end

function RadioWave:update(startX, startY, endX, endY, startAmp, endAmp, period, phaseshift)
  local startAmpOffShift = math.random() * 10
  local endAmpOffShift = math.random() * 10
  local phaseshiftOffShift = math.random() * 20
  
  self.meta = {
    startX = startX,
    startY = startY,
    endX = endX,
    endY = endY,
    startAmp = startAmp + startAmpOffShift,
    endAmp = endAmp + endAmpOffShift,
    period = period, 
    phaseshift = phaseshift + phaseshiftOffShift
  }
end

function RadioWave:draw()
  local meta = self.meta
	gfx.drawSineWave(meta.startX, meta.startY, meta.endX, meta.endY, meta.startAmp, meta.endAmp, meta.period, meta.phaseshift)
end