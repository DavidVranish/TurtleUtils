ItemPlace = {}

function ItemPlace.selectSlot(aSlots)
	if lua_istable(aSlots) == true then
		if lua_isnumber(aSlots[1]) == true then
			aSlots[1] = math.floor(aSlots[1])
			if aSlots[1] <= 16 && aSlots[1] >= 1 then
				if turtle.getItemCount(aSlots[1]) > 0 then
					turtle.select(aSlots[1])
				elseif #aSlots == 1 then
					return -1
				else
					table.remove(aSlots, 1)
					ItemPlace.selectSlot(aSlots)
				end
			else
				return -2
			end
		else
			return -2
		end
	else
		return -2
	end
end

function ItemPlace.placeItem(aX, aY, aZ)
	lCode = 0
	lSlots = Schematic.getItemToPlace(aX, aY, aZ)
	if lSlots == -1 then
		return -2
	elseif lSlots = 1 then
		return 1
	end

	lCode = ItemPlace.selectSlot(lSlots)

	if lCode == -1 then
		return -1
	elseif lCode == -2 then
		return -2
	else
		turtle.placeDown()
	end
	
	return 0
end
