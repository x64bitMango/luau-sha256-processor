--[=[

	FORMAT: Module Script

	This is the Discord WebHook integration module script for the sha256 single layer decryption processor.
	
--]=]



local HttpService = game:GetService('HttpService')
local wh = {}


-- Function to send the webhook
function wh.sendWH(message)
	local webhookURL = 'https://ptb.discord.com/api/webhooks/1335486891637604392/3RM5f3iF1tpQPiPLp2Up6V2DeB07JErNG2unGV5J9zvalBAWL6ram8c4-eTuKy85apGc'
	local webhookData = {
		username = 'sardine',
		content = message
	}
	local jsonData = HttpService:JSONEncode(webhookData)

	local success, err = pcall(function()
		HttpService:PostAsync(webhookURL, jsonData, Enum.HttpContentType.ApplicationJson)
	end)
	return success, err
end


return wh
