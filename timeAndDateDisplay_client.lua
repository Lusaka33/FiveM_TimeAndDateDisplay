local displayTime = true
local useMilitaryTime = false
local displayDayOfWeek = true
local displayDate = true

-- Display Time and Date at top right of screen
CreateThread(function()
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextEntry("STRING")
	SetTextFont(0)
	SetTextJustification(2)
	SetTextOutline()
    SetTextProportional(1)
    SetTextScale(0.0, 0.5)
    SetTextWrap(0.0, 0.95)
	
	while true do -- format: | 12:13 | Wednesday | January 17, 2017 |
		local timeAndDateString = "|"
		
		if displayTime then
			local hour = GetClockHours()
			local minute = GetClockMinutes()
		
			if !useMilitaryTime then
				hour + 1
				if hour >= 13 then
					hour - 12
				end
			end

			if hour <= 9 then
				hour = "0" .. hour
			end
			
			if minute <= 9 then
				minute = "0" .. minute
			end

			timeAndDateString = timeAndDateString .. " " .. hour .. ":" .. minute .. " |"
		end

		if displayDayOfWeek then
			local dayOfWeek = GetClockDayOfWeek()
			if dayOfWeek == 0 then
				dayOfWeek = "Sunday"
			elseif dayOfWeek == 1 then
				dayOfWeek = "Monday"
			elseif dayOfWeek == 2 then
				dayOfWeek = "Tuesday"
			elseif dayOfWeek == 3 then
				dayOfWeek = "Wednesday"
			elseif dayOfWeek == 4 then
				dayOfWeek = "Thursday"
			elseif dayOfWeek == 5 then
				dayOfWeek = "Friday"
			elseif dayOfWeek == 6 then
				dayOfWeek = "Saturday"
			end
			timeAndDateString = timeAndDateString .. " " .. dayOfWeek .. " |"
		end

		if displayDate then
			local month = GetClockMonth()
			local dayOfMonth = GetClockDayOfMonth()
			local year = GetClockYear()
			
			if month == 0 then
				month = "January"
			elseif month == 1 then
				month = "February"
			elseif month == 2 then
				month = "March"
			elseif month == 3 then
				month = "April"
			elseif month == 4 then
				month = "May"
			elseif month == 5 then
				month = "June"
			elseif month == 6 then
				month = "July"
			elseif month == 7 then
				month = "August"
			elseif month == 8 then
				month = "September"
			elseif month == 9 then
				month = "October"
			elseif month == 10 then
				month = "November"
			elseif month == 11 then
				month = "December"
			end
			timeAndDateString = timeAndDateString .. " " .. month .. " " .. dayOfMonth .. ", " .. year .. " |"
		end
		
        AddTextComponentString(timeAndDateString)
        DrawText(0.5, 0.015)
        Wait(1000)
	end
end)