local lib = {}

function lib:GetStatus(exploit, rn)
	
	if rn == nil then
		rn = false
	end
	
	local HttpService = game:GetService("HttpService")
	local url = "https://api.whatexploitsare.online/status"
	local response = request(url)
	local data = HttpService:JSONDecode(response)
	if exploit == true then
		return data
	else
		for y,v in data do
			if v[exploit] then
				local ft = v[exploit]
				if ft.updated == 2 then
					ft.updated = "issues_reported"
				elseif ft.updated == 3 then
					ft.updated = "API_outage"
				elseif ft.updated == 4 then
					ft.updated = "in_testing"
				end
				if rn then
					return {[exploit] = v[exploit]}
				else
					return v[exploit]
				end
			end
		end
	end
	return error("Could not find your exploit.")
end

function lib:GetDownloadLink(wrd, exploit)
	
	if exploit == nil then
		exploit = wrd
		wrd = false
	end
	
	if exploit == "KRNL" and not wrd then
		exploit = "KRNLNEW"
	elseif exploit == "KRNLNEW" or exploit == "KRNLOLD" then
		if wrd then
			exploit = "KRNL"
		end
	end

	-- If the person didnt insert if he wanted WRD, then WRD will be automaticly setted to nil.

	-- Website downloads table.

	local downloads = {
		KRNLNEW = "https://k-storage.com/krnl_beta.exe",
		KRNLOLD = "https://k-storage.com/krnl_bootstrapper.exe",
		Electron = "https://ryos.best/download.php",
		Oxygen = "https://raw.githubusercontent.com/iDevastate/Oxygen-v2/main/oxygen_u.zip",
		Fluxus = "https://linkvertise.com/152666/FluxusV7Installer/1",
		RoWare = "https://script-ware.com/roware",
		Celestial = "https://cdn.discordapp.com/attachments/983508416855162890/1006602540168777748/Build_8-9-22.rar",
		Comet = "https://cdn.discordapp.com/attachments/888201334891900928/1033517294560743506/Comet_3_Alpha_10.zip"
	}

	-- WRD downloads table

	local wrdd = {
		KRNL = "https://cdnwrd2.com/r/54921/1668645549605/KRNLWRD.rar",
		Oxygen = "https://cdn.discordapp.com/attachments/897394099148173313/913467135592894474/OxyInstaller.exe",
		Fluxus = "https://cdnwrd2.com/r/65121/1668153759579/Fluxus.zip",
		RoWare = "https://script-ware.com/api/serve/beta/RoWare-InstallerNA.exe",
		Comet = "https://cdn.discordapp.com/attachments/888201334891900928/1033517294560743506/Comet_3_Alpha_10.zip"
	}



	local function checkError()
		if wrd then
			if not wrdd[exploit] then
				return error("Your exploit is not in our WRD database.")
			else 
				return wrdd[exploit]
			end
		else
			if not downloads[exploit] then
				error("Your exploit is not in our database")
			else 
				return downloads[exploit]
			end
		end
	end

	return checkError()
end