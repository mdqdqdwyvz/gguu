--[[
Created by Jaff
Hi there this requires at least 5 braincells to use
Feel Free to use the functions for your own use
I already Listed the functions usage so edit it if you want
]]
repeat wait() until game:IsLoaded()

task.spawn(function()  -- Hides name for yters (not sure if its Fe)
    while task.wait() and getgenv().hidename do
        pcall(function()
            if game.Players.LocalPlayer.Character.Head:FindFirstChild("_overhead") then
               workspace[game.Players.LocalPlayer.Name].Head["_overhead"]:Destroy()
            end
        end)
    end
end)


local function WatermarkForIdiotYter() -- If the yter is stupid they cant remove this
    game.StarterGui:SetCore("SendNotification", {
Title = "Status";
Text = getgenv().id.." Is your petid"; 
Icon = ""; 
Duration = 5; 
})
end


local function start() -- starts the game
if game:GetService("Workspace")["_wave_num"].Value < 1 then
game:GetService("ReplicatedStorage").endpoints.client_to_server.vote_start:InvokeServer()
end
end

local function place() -- place function if there is another erwin on the map
if game:GetService("Workspace")["_wave_num"].Value < getgenv().wavetolose then
for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
    if v.Name == getgenv().unit then
        local args = {
    [1] = v._stats.uuid.Value,
    [2] = CFrame.new(-2949.064453125, 91.80620574951172, -698.9860229492188) * CFrame.Angles(0, -0, -0)
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
task.wait(.1)
local args = {
    [1] = v._stats.uuid.Value,
    [2] = CFrame.new(-2944.968017578125, 91.80620574951172, -698.81396484375) * CFrame.Angles(0, -0, -0)
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))
task.wait(.1)
local args = {
    [1] = v._stats.uuid.Value,
    [2] = CFrame.new(-2947.109130859375, 91.80620574951172, -698.6688842773438) * CFrame.Angles(0, -0, -0)
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

end
end
end
end

local function place3() -- place down erwin so the other place functions can work
    if game:GetService("Workspace")["_wave_num"].Value < getgenv().wavetolose then
        local args = {
    [1] = getgenv().id,
    [2] = CFrame.new(-2949.064453125, 91.80620574951172, -698.9860229492188) * CFrame.Angles(0, -0, -0)
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.spawn_unit:InvokeServer(unpack(args))

end
end



local function upgrade() -- Upgrades to upgrade 5 and auto upgrades lowest upgraded unit
for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
    if v.Name == getgenv().unit then
        if v._stats.upgrade.Value < 10 then 
local args = {
[1] = v
  }
game:GetService("ReplicatedStorage").endpoints.client_to_server.upgrade_unit_ingame:InvokeServer(unpack(args))
end
end
end
end

local function join() -- join teleporter
local args = {
    [1] = "_lobbytemplategreen14"
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.request_join_lobby:InvokeServer(unpack(args))
end

--Webhook sender
local function webhook()
	pcall(function()
		local url = tostring(getgenv().webhook) --webhook
		print("webhook?")
		if url == "" then
			return
		end
			
    		XP = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.XPReward.Main.Amount.Text)
		gems = tostring(game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.GoldGemXP.GemReward.Main.Amount.Text)
		cwaves = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.WavesCompleted.Text
		ctime = game:GetService("Players").LocalPlayer.PlayerGui.ResultsUI.Holder.Middle.Timer.Text
		waves = cwaves:split(": ")
		ttime = ctime:split(": ")

		local data = {
			["content"] = "",
			["username"] = "Anime Adventures",
			["avatar_url"] = "https://tr.rbxcdn.com/e5b5844fb26df605986b94d87384f5fb/150/150/Image/Jpeg",
			["embeds"] = {
				{
					["author"] = {
						["name"] = "Anime Adventures | Result ✔",
						["icon_url"] = "https://cdn.discordapp.com/emojis/997123585476927558.webp?size=96&quality=lossless"
					},
					["description"] = "🎮 **"..game:GetService("Players").LocalPlayer.Name.."** 🎮",
					["color"] = 110335,

					["thumbnail"] = {
						['url'] = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. game.Players.LocalPlayer.userId .. "&width=420&height=420&format=png"
					},

					["fields"] = {
						{
							["name"] = "Total Waves:",
							["value"] = tostring(waves[2]) ..
								" <:wave:997136622363627530>",
							["inline"] = true
						}, {
							["name"] = "Recieved Gems:",
							["value"] = gems .. " <:gem:997123585476927558>",
							["inline"] = true
						}, {
                            ["name"] = "Recieved XP:",
                            ["value"] = XP .. " 🧪",
                            ["inline"] = true
                        }, {
                            ["name"] = "Total Time:",
                            ["value"] = tostring(ttime[2]) .. " ⏳",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Gems:",
                            ["value"] = tostring(game.Players.LocalPlayer._stats.gem_amount.Value).." <:gem:997123585476927558>",
                            ["inline"] = true
                        }, {
                            ["name"] = "Current Level:",
                            ["value"] = tostring(game.Players.LocalPlayer.PlayerGui.spawn_units.Lives.Main.Desc.Level.Text).. " ✨",
                            ["inline"] = true
                        }
					}
				}
			}
		}

		local porn = game:GetService("HttpService"):JSONEncode(data)

		local headers = {["content-type"] = "application/json"}
		request = http_request or request or HttpPost or syn.request or http.request
		local sex = {Url = url, Body = porn, Method = "POST", Headers = headers}
		warn("Sending webhook notification...")
		request(sex)
	end)
end

local function sell()
if game:GetService("Workspace")["_wave_num"].Value > getgenv().wavetolose -1 then
  for i, v in next, game:GetService("Workspace")["_UNITS"]:GetChildren() do
  if v.Name == getgenv().unit then
local args = {
    [1] = v
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.sell_unit_ingame:InvokeServer(unpack(args))
end
end
end
end

local function Create() -- Creates the map
local args = {
    [1] = "_lobbytemplategreen14",
    [2] = getgenv().act, -- ex 1,2,3 (LOWER THE NUMBER IF ITS TOO HARD)
    [3] = true,
    [4] = getgenv().dif --Hard mode for da exp
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.request_lock_level:InvokeServer(unpack(args))

end

local function start2() -- Starts the teleport
local args = {
    [1] = "_lobbytemplategreen14"
}

game:GetService("ReplicatedStorage").endpoints.client_to_server.request_start_game:InvokeServer(unpack(args))
end



local function place2() -- Places erwin until wave 5
    while getgenv().wavecount do
if game:GetService("Workspace")["_wave_num"].Value < 5 then 
    getgenv().wavecount = true
        task.wait()
        place3()
elseif game:GetService("Workspace")["_wave_num"].Value > 5 then
    getgenv().wavecount = false
    end
    end
    end



local function teleport() 
if game:GetService("Workspace")["_DATA"].GameFinished.Value == true then
task.wait(5)
webhook()
game:GetService("ReplicatedStorage").endpoints.client_to_server.teleport_back_to_lobby:InvokeServer()
end
end


if game.PlaceId == 8304191830 then
while true do
join()
task.wait(1)
Create()
task.wait(1)
start2()
task.wait()
WatermarkForIdiotYter()
task.wait(5)
end
elseif game.PlaceId == 8349889591 then
repeat wait() until game:IsLoaded()
task.wait(20) -- Waits for the game remotes to load (This is needed)
game.Players.LocalPlayer.PlayerGui.MessageGui.Enabled = false -- Removes the annoying error messages
_G.a = true 
while _G.a do
    task.wait()
if game.Players.LocalPlayer.PlayerGui.ResultsUI.Enabled == true then --Checks if reward is ready to claim and claims it
local button = game.Players.LocalPlayer.PlayerGui.ResultsUI.Holder.Buttons.Next

local events = {"MouseButton1Click", "MouseButton1Down", "Activated"}
for i,v in pairs(events) do
    for i,v in pairs(getconnections(button[v])) do
        v:Fire()
    end
end
else
task.wait()
place()
place3()
place2()
upgrade()
start()
sell()
teleport()
end
end
  end
