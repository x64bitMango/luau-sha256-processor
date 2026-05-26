--[=[

	FORMAT: Script


	REQUIREMENTS:
	- Allow HTTP Requests
	- Allow Loading Third Party Assets


	THIS IS SINGLE LAYERED SHA256 DECRYPTION PROCESSOR ONLY
	Note that server-side CPU usage goes through the roof while doing this
  Thank you to boatbomber for the hashlib library used in this processing tool
	
--]=]

-- THE HASH
local hash = "e30c2ea7a76f83b7c1a975ddc24286b675e714ebbbc72ccd5f0401730231ab57"
-- it's 'fart' converted into sha256


-- Constants
local HttpService = game:GetService('HttpService')
local ipairs = ipairs
local TestAmount = 1000 -- This is the hash test amount. Basically how many hashes to run per iteration. Signifigent lag starts at ~2k.
--

-- Load dependancies
local HashLib = require(5167746890) -- Hashlib asset ID
local wh = require(script.parent.DiscordWH)
--

	
alphabet = "abcdefghijklmnopqrstuvwxyz0123456789"
base = #alphabet   -- 36

local function Num2String(n, alphabet)
	local base = #alphabet
	local chars = {}

	repeat
		local r = n % base
		n = math.floor(n / base)
		table.insert(chars, 1, alphabet:sub(r + 1, r + 1))
	until n == 0

	return table.concat(chars)
end

function hashDemo(targetHash)

	local startTime = tick()
	local i=0
	local n = 0
	while true do

		local candidate = Num2String(n, alphabet)
		local hash = HashLib["sha256"](candidate)


		if hash == targetHash then 
			local elapsed = tick() - startTime
			b = i*TestAmount
			wh.sendWH(string.format("Hash source found! Took `%d` hashes | `%.4f` seconds to find the candidate `%s`", b, elapsed, candidate))
			return candidate 
		else
			i+=1
		end

		-- Every 100k hashes, send a webhook alert
		if i % 100000 == 0 then
			local elapsed = tick() - startTime
			local b = i*TestAmount
			wh.sendWH(string.format("`%d` hashing iterations have passed.. (`%d` hashes) | `%.4f` seconds", i, b, elapsed))
			wh.sendWH(string.format("Hash #`%d` candidate: `%s`", b, candidate))
			print(string.format("%d hashing iterations have passed.. (%d hashes) | %.4f seconds", i, b, elapsed))
			print(string.format("Hash #%d candidate: %s", b, candidate))
		end

		n = n + 1
	end

end



TestCompare(FunctionName, Arg, TestAmount)
	print("\n### Testing",FunctionName)
	wait(0.005)
	-- test my version

	local Times = {}
	for i=1, TestAmount do
		local t = tick()
		local hash = HashLib[FunctionName](Arg)
		local TimeTaken = tick()-t
		Times[#Times+1] = TimeTaken
	end

	local Total = 0
	for _,Time in ipairs(Times) do Total = Total+Time end

	-- print("* Optimized HashLib took `".. string.format("%.10f", Total).. "` to do ".. TestAmount .." "..FunctionName.." hashes with each one taking `".. string.format("%.10f", Total/#Times) .. "` on average")
end
-- Experimental optimized hashing
function tickSha(hashstring)
	local startTime = tick()
	local i=0

	while i do
		i+=1
		TestCompare("sha256", hashstring)
		if i % 100 == 0 then
			local elapsed = tick() - startTime
			b = i*TestAmount
			wh.sendWH(string.format("`%d hashing iterations have passed.. (%d hashes) | %.4f seconds`", i, b, elapsed))
			print(string.format("%d hashing iterations have passed.. (%d hashes) | %.4f seconds", i, b, elapsed))
		end


	end
end



-----------------------------------------------------------------

wait(5) -- wait a bit before starting

hashDemo(hash)



