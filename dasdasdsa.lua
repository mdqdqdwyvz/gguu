LOGGED = {}
for i, v in next, workspace[game.Players.LocalPlayer.Name]["_pets_folder"]:GetChildren() do
                        if v:IsA("Model") then
                            table.insert(LOGGED, v.Name)
                            writefile("datetest.txt", table.concat(LOGGED))
                            writelog = function()
                            end
                        end
end
