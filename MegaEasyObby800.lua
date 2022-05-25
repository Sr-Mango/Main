game.StarterGui:SetCore("SendNotification", {
    Title = "Loading...";
    Text = "Consider Joining Our Discord!"; 
    Duration = 3; 
})
wait(3)


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sr-Mango/Main/main/UILibrary.lua"))()

local a = Library:Window("MegaEasyObby 800 Stages")

local b = a:Tab("Main")

b:Button("Auto Farm", function() 
    while wait() do
        game:GetService("ReplicatedStorage").Events.prestige:FireServer()
        shirogang = game.Players.LocalPlayer.leaderstats.Stage.Value + 1
        
        if game.Workspace.Checkpoints:FindFirstChild(tostring(shirogang)) then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =
            game.Workspace.Checkpoints:FindFirstChild(tostring(shirogang)).CFrame
        end
    end
end)


-- gameid = 3587619225