-----------------------------------------------------------------------------------------
-- Title: Animating Images
-- Name: Dante Beltran
-- Course: ICS3C
-- This program will display pictures on the screen and each object will move/
-- in different directions and have different effects. 
-----------------------------------------------------------------------------------------

-- declare my local variables
local pacman
local mario
local pikachu
local kirby
local backgroundImage
local midpoint = display.contentWidth/2
local textObject

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the scroll speed
scrollSpeed = 3
scrollSpeed2 = 0
kirbyScrollSpeed = 3

-- backround image with widht and height
local backroundImage = display.newImageRect("Images/background.jpg", 2048, 1536)

--character image with width and height
local pacman = display.newImageRect("Images/Pacman.png", 200, 200)
local mario = display.newImageRect("Images/Mario.png", 200, 200)
local pikachu = display.newImageRect("Images/Pikachu.png", 200, 200)
local kirby = display.newImageRect("Images/Kirby.png", 300, 200)

-- create text object, set its position
local textObject = display.newText ("Animating Images!", 500, 700, nil, 50)
textObject:setTextColor (0, 1, 0)

-- load sounds
local backgroundMusic = audio.loadSound("Sounds/Background Music.mp3")

--play sounds
audio.play(backgroundMusic)

-- set the image to be transparent
pacman.alpha = 0

-- set the initial x and y position of the beetleship
pacman.x = 0
pacman.y = 0
mario.x = 0
mario.y = 0
pikachu.x = 1000
pikachu.y = display.contentHeight/8
kirby.x = 0
kirby.y = display.contentHeight/2

-- set the scale of Pikachu
pikachu:scale(1, 1 )

-- Function: MovePikachu
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of Pacman and it changes the scale of Pacman
local function MovePikachu(event)
	-- add the scroll speed to the x-value of Pacman
	pikachu.x = pikachu.x - scrollSpeed
	-- makes the object grow as it is moving
	pikachu.xScale = pikachu.xScale + 0.005
	pikachu.yScale = pikachu.yScale + 0.005
	
end

-- MovePacman will be called over and over again
Runtime:addEventListener("enterFrame", MovePikachu)

-- Function: MovePacman
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of Pacman
local function MovePacman(event)
	-- add the scroll speed to the x-value of Pacman
	pacman.x = pacman.x + scrollSpeed 
	pacman.y = pacman.y + scrollSpeed
	-- change the transparency of Pacman every time it moves so that it fades out
	pacman.alpha = pacman.alpha + 0.01
end
	

-- MovePacman will be called over and over again
Runtime:addEventListener("enterFrame", MovePacman)

-- Function: MoveKirby
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of Kirby 
local function MoveKirby(event)
	-- add the scroll speed to the x-value of Kirby
	kirby.x = kirby.x + kirbyScrollSpeed
	kirby:rotate (1)
	-- when kirby reaches a x value greater than 1000 the scroll speed and scale changes
	if (kirby.x > 1000) then
		kirby.xScale = -1
		kirbyScrollSpeed = -3
	end
	-- when kirby reaches a x value less than 0 the scroll speed and scale changes
	if (kirby.x < 0) then
		kirby.xScale = 1
		kirbyScrollSpeed = 3
	end


end


--MoveKirby will be called over and over again
Runtime:addEventListener("enterFrame", MoveKirby)

-- Function: MoveMario
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function makes mario move on a parabolic path
local function MoveMario(event)
	-- add 2 scroll speeds to the x value and y value of mario
	mario.x = mario.x + scrollSpeed
	mario.y = mario.y + scrollSpeed2
	print ("mario.x ="..mario.x)
-- sets the scroll speed of which the object moves at
	if (mario.x >= 0) then
		scrollSpeed = 4
		scrollSpeed2 = -3
	end
	--  when the object reaches the midpoint of the screen  the scroll speed will change. 
	if (mario.x <= midpoint) then
		scrollSpeed = 4
		scrollSpeed2 = 3
	end
end

Runtime:addEventListener("enterFrame", MoveMario)

	









