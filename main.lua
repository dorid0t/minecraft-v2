love.window.setTitle( "minecraft v2" )

playerHealth = 100
playerMaxHealth = 100

playerx = 11
playery = 50

move_up = 0
move_down = 0
move_left = 0
move_right = 0

dead = false

function love.load()
    love.keyboard.setKeyRepeat(true)
end

function love.keypressed(key, isrepeat)
    if key == "up" then
        move_up = 1
    end
    if key == "down" then
        move_down = 1
    end
    if key == "right" then
        move_right = 1
    end
    if key == "left" then
        move_left = 1
    end
    if key == "k" then
    	playerHealth = playerHealth - 1
    end
end


function love.keyreleased(key)
    if key == "up" then
        move_up = 0
    end
    if key == "down" then
        move_down = 0
    end
    if key == "right" then
        move_right = 0
    end
    if key == "left" then
        move_left = 0
    end
end

function think()
    playery = playery - move_up
    playery = playery + move_down
    playerx = playerx - move_left
    playerx = playerx + move_right

    if playerHealth <= 0 then
    	dead = true
    end

    if dead == true then
    	playerHealth = 0
    end

    if playerx <= 10 then
    	playerx = playerx + 1
    end

    if playerx >= 790 then
    	playerx = playerx - 1
    end

    if playery <= 10 then
    	playery = playery + 1
    end

    if playery >= 590 then
    	playery = playery - 1
    end
end

function love.draw()
    think()

    love.graphics.setColor(255, 255, 255)
    love.graphics.circle("fill", playerx, playery, 10, 10)

    love.graphics.setColor(255,255,255)
    love.graphics.print("X: ".. playerx.. ", Y: ".. playery, 2, 2)

    love.graphics.setColor(25,255,25)
    love.graphics.print("HP: ".. playerHealth, 2, 19)
end