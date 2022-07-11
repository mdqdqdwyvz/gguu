for i, v in next, workspace[game.Players.LocalPlayer.Name]["_pets_folder"]:GetChildren() do
                        if v:IsA("Model") then
                            table.insert(LOGGED, v.Name)
                            writefile("datetest.txt", table.concat(LOGGED))
                            writelog = function()
                            end
                        end
end
LOGGED = {}
getgenv().id = readfile("datetest.txt")
getgenv().unit = "sanji" -- YOU CAN CHANGE THIS TO OTHER UNITS EX SANJI
getgenv().hidename = true -- hides name
getgenv().dif = "Normal" -- Normal = less hard,exp. Hard = more exp,more harder
getgenv().act = "namek_level_1" --Lower if it is too hard
loadstring(game:HttpGet("https://rawscripts.net/raw/RELEASE-Anime-Adventures-Lobby-3936"))()