while wait() do
    shirogang = game.Players.LocalPlayer.leaderstats.Stage.Value + 1
    
    if game.Workspace.Stages:FindFirstChild(tostring(shirogang)) then
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
        game.Workspace.Stages:FindFirstChild(tostring(shirogang)).CFrame
    end
end



game.StarterGui:SetCore("SendNotification", {
    Title = "Loading...";
    Text = "Consider Joining Our Discord!"; 
    Duration = 3; 
})
wait(3)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sr-Mango/Main/main/UILibrary.lua"))()

local a = Library:Window("Cotton Obby")

local b = a:Tab("Main")

b:Button("Complete Obby", function()
    while wait() do
        shirogang = game.Players.LocalPlayer.leaderstats.Stage.Value + 1
        
        if game.Workspace.Stages:FindFirstChild(tostring(shirogang)) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Workspace.Stages:FindFirstChild(tostring(shirogang)).CFrame
        end
    end
end)

-- gameid = 7378813434

