-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )
local Moje = require( "datapickerkal" )
local bacground = display.newRect( 0, 0, display.contentWidth, display.contentHeight )
bacground:setFillColor( 0, 1, 0, 1 )
bacground.anchorX = 0
bacground.anchorY = 0

local MojPickerData = Moje.nowyDataPicker( {
			year = 2023,
			month = 5,
			day = 21,
			x = display.contentCenterX,
			y = 200,
			width = 130,
			height = 60,
			rounded = 15,
			label = "Data",
			labelColorDefault = { 0, 0, 0.7, 1 },
			labelColorOver = { 0, 0.2, 0.85, 1 },
			font = native.systemFontBold,
			fontSize = 20,
			strokeWidth = 4,
			strokeColorDefault = { 
				type = "gradient", 
				color1 = { 0.2, 0.2, 0.2, 1 }, 
				color2 = { 0.2, 0.2, 0.2, 0 }, 
				direction = "down"  
				}, -- or { 0.2, 0.2, 0.2, 1 } or documentation Paint Type Solar2D
			strokeColorOver = {
				type = "gradient",
				color1 = { 0.9, 0.6, 0.2, 1 },
				color2 = { 0.9, 0.6, 0.2, 0.1 },
				direction = "down"
				}, -- or { 0.9, 0.6, 0.2, 0.1 } or documentation Paint Type Solar2D
			colorDefault = {
				type = "gradient",
				color1 = { 0.8, 0.8, 0.8, 1 },
				color2 = { 1, 1, 1, 1 },
				direction = "down"
				}, -- or documentation Paint Type Solar2D 
			colorOver = {
				type = "gradient",
				color1 = { 1, 1, 1, 1 },
				color2 = { 0.8, 0.8, 0.8, 1 },
				direction = "down"
				} -- or documentation Paint Type Solar2D 
			} )
local function listener(  )
	--demonstration of how to return year, month and day data from DataPickerKal
	--demonstracja jak zwraca dane roku miesiąca i dnia z DataPickerKal
	print( "Year =", MojPickerData.year, "Month =", MojPickerData.month, "Day =", MojPickerData.day )
end
MojPickerData:addEventListener( "tap", listener )