
game.StarterGui:SetCore("SendNotification", {
    Title = "Loading...";
    Text = "Consider Joining Our Discord!"; 
    Duration = 3; 
})
wait(3)

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sr-Mango/Main/main/UILibrary.lua"))()

local a = Library:Window("Escape Easy Parkour Obby!")

local b = a:Tab("Main")

b:Button("Unlock All Gamepasses", function()
    game:GetService("ReplicatedStorage").GC:FireServer()
    game:GetService("ReplicatedStorage").R:FireServer()
    game:GetService("ReplicatedStorage").GH:FireServer()
    game:GetService("ReplicatedStorage").RC:FireServer()
    game:GetService("ReplicatedStorage").JP:FireServer()
    game:GetService("ReplicatedStorage").SC:FireServer()
end)

b:Button("Print", function()    
    while true do
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").CheckpointAssist.CFrame
    wait(0.3)
    end
end)

-- gameid = 7219650554

