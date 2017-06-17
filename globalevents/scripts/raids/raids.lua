local raids = {
	-- Weekly
	['Monday'] = {
		['08:00'] = {raidName = 'Orc nilf'}
	},

	['Friday'] = {
		['12:00'] = {raidName = 'Orc pont'}
	},

	-- By date (Day/Month)
	['31/10'] = {
		['12:00'] = {raidName = 'Halloween Hare'},
		['16:00'] = {raidName = 'Halloween Hare'},
		['20:00'] = {raidName = 'Halloween Hare'}
	},
	
	['01/11'] = {
		['12:00'] = {raidName = 'Halloween Hare'},
		['16:00'] = {raidName = 'Halloween Hare'},
		['20:00'] = {raidName = 'Halloween Hare'}
	},
	
	['02/11'] = {
		['12:00'] = {raidName = 'Halloween Hare'},
		['16:00'] = {raidName = 'Halloween Hare'},
		['20:00'] = {raidName = 'Halloween Hare'}
	},
	
	
	
	['16/04'] = {
		['09:00'] = {raidName = 'Ester pont'},
		['12:00'] = {raidName = 'Ester nilf'},
		['14:00'] = {raidName = 'Ester pont'},
		['16:00'] = {raidName = 'Ester nilf'},
		['18:00'] = {raidName = 'Ester pont'}
	}
}

function onThink(interval, lastExecution, thinkInterval)
	local day, date = os.date('%A'), getRealDate()

	local raidDays = {}
	if raids[day] then
		raidDays[#raidDays + 1] = raids[day]
	end
	if raids[date] then
		raidDays[#raidDays + 1] = raids[date]
	end

	if #raidDays == 0 then
		return true
	end

	for i = 1, #raidDays do
		local settings = raidDays[i][getRealTime()]
		if settings and not settings.alreadyExecuted then
			Game.startRaid(settings.raidName)
			settings.alreadyExecuted = true
		end
	end

	return true
end