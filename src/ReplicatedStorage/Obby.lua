local Obby = {}

function Obby:killOnTouch(brick)
    brick.Touched:Connect(function(h)
        h = h.Parent:FindFirstChild("Humanoid")
        if h ~= nil then
            h.Health = 0
        end
    end)
end

function Obby:damagePlayer(brick, amount)
	brick.Touched:Connect(function(h)
		h = h.Parent:FindFirstChild("Humanoid")
		if amount == nil then
			if h ~= nil then
				h.Health -= 1
			end
		else
			if h ~= nil then
				h.Health -= amount
			end
		end
	end)
end

function Obby:icyPart(brick)
    brick.CustomPhysicalProperties = PhysicalProperties.new(1, 0.01, 1, 100, 1)
end

function Obby:disapearingPart(brick, delay)
    brick.Touched:Connect(function(h)
        h = h.Parent:FindFirstChild("Humanoid")
        if h ~= nil then
            wait(delay)
            brick.CanCollide = false
            brick.Transparency = 1
            wait(3)
            brick.CanCollide = true
            brick.Transparency = 0
        end
    end)
end

function Obby:fadePart(brick)
    brick.Touched:Connect(function(h)
        h = h.Parent:FindFirstChild("Humanoid")
        if h ~= nil then
            if not isTouched then
                for count = 1, 10 do
                    brick.Transparency = count / 10
                    wait(0.1)
                end

                brick.CanCollide = false
                wait(3)
                brick.CanCollide = true
                brick.Transparency = 0
                isTouched = false
            end
        end
    end)
end

return Obby