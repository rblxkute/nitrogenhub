local Player = game.Players.LocalPlayer
local gameId = game.placeId

getgenv().SecureMode = true


local ArrayField = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/ArrayField/main/Source.lua'))()

if gameId == 6299805723 then
    --TODO ----------------------------------------------------------------------------------------------------
    --TODO ---------------------------------------------- GETGENV ---------------------------------------------
    --TODO ----------------------------------------------------------------------------------------------------

    getgenv().EnemyAutoFarm = nil
    getgenv().MapAutoFarm   = nil
    getgenv().AutoFarm      = false

    --TODO ----------------------------------------------------------------------------------------------------
    --TODO ---------------------------------------- CREATING THE WINDOW ---------------------------------------
    --TODO ----------------------------------------------------------------------------------------------------

    local Window = ArrayField:CreateWindow({
        Name = "Nitrogen Hub",
        LoadingTitle = "Nitrogen Hub is loading...",
        LoadingSubtitle = "Developed by kute",
        ConfigurationSaving = {
            Enabled = True,
            FolderName = "NitrogenHub",
            FileName = "AnimeFighters"
        },
        Discord = {
            Enabled = true,
            Invite = "zMyRS6JbSV",
            RememberJoins = true
        },
        KeySystem = true,
        KeySettings = {
            Title = "Nitrogen Hub",
            Subtitle = "Key System",
            Note = "Join the discord to get the key or buy premium",
            GrabKeyFromSite = false,
            Actions = {
                [1] = {
                    Text = 'Copy Discord',
                    OnPress = function()
                        print("test")
                    end,
                }
            },
            Key = {"test"}
        }
    })

    --TODO ----------------------------------------------------------------------------------------------------
    --TODO ------------------------------------------ AUTO FARM TAB  ------------------------------------------ 
    --TODO ----------------------------------------------------------------------------------------------------

    local AutoFarmTab = Window:CreateTab("Auto Farm", 0)
    local AutoFarmSection = AutoFarmTab:CreateSection("Auto Farm", true)

    local SelectEnemyDropdown = AutoFarmTab:CreateDropdown({
        Name = "Select Enemy",
        Options = {'Frieza 1', 'Frieza 2', 'Frieza 3', 'Cell Jr', 'Cell', 'Frieza Boss', 'Ginyu Boss'},
        CurrentOption = nil,
        MultiSelection = false,
        Flag = "SelectEnemyDropdown",
        Callback = function(Value)
            getgenv().EnemyAutoFarm = Value
        end
    })

    local SelectMapDropdown = AutoFarmTab:CreateDropdown({
        Name = "Select Map",
        Options = {'Super Island', 'Ninja Village', 'Crazy Town', 'Fruits Island', 'Hero University', 'Walled City', 'Slayer Army', 'Ghoul Town', 'Chimera Jungle', 'Virtual Castle', 'Emtpy Dimension', 'Cursed High', 'XYZ Metropolis', '9 Crimes Island', 'Destiny', 'Lucky Kingdom', 'Land of Alchemy', 'Slimey Island', 'Flame City', 'Divine Colisseum', 'Kingdom of Four', 'Icy Wastes', 'The Underworld', 'Physic City', 'The Hole', 'Ninja City', 'Time Travel Tokyo', 'Orca Road Prison', 'World of Games', 'Fashion Empire', 'Land of Guts', 'Hero Village', 'Soul Academy', 'World at War', 'The Abyss'},
        CurrentOption = "Super Island",
        MultiSelection = false,
        Flag = "SelectMapDropdown",
        Callback = function(Value)
            getgenv().MapAutoFarm = Value
            --if Value == 'Super Island' then SelectEnemyDropdown:Refresh({'Frieza 1', 'Frieza 2', 'Frieza 3', 'Cell Jr', 'Cell', 'Frieza Boss', 'Ginyu Boss'}, nil) 
            --elseif Value == 'Ninja Village' then SelectEnemyDropdown:Refresh({'Otogakure 1', 'Sunagakure 1', 'Otogakure 2', 'Sunagakure 2', 'Orochimaru', 'Madara'}, nil) end
        end
    })

    local AutoFarmToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm",
        CurrentValue = false,
        Flag = "AutoFarmToggle",
        Callback = function(Value)
            getgenv().AutoFarm = Value
            while(getgenv().AutoFarm == true) do
                task.wait(1)
                local enemy = game.Workspace.Worlds.DBZ.Enemies:FindFirstChild(tostring(getgenv().EnemyAutoFarm):gsub(" ", "")):FindFirstChild('Torso')
                Player.Character.HumanoidRootPart.CFrame = CFrame.new(enemy.Position)
            end
        end,
    })

    --TODO ----------------------------------------------------------------------------------------------------
    --TODO -------------------------------------------- FUNCTIONS  -------------------------------------------- 
    --TODO ----------------------------------------------------------------------------------------------------

    

end
ArrayField:LoadConfiguration()
