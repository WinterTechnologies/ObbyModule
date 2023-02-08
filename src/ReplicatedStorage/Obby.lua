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

return Obby