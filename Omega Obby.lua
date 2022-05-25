game.StarterGui:SetCore("SendNotification", {
    Title = "Loading...";
    Text = "Consider Joining Our Discord!"; 
    Duration = 3; 
})
wait(3)

local wait_time = 0.1 
local todo = game:GetService("Workspace").Stages:GetChildren()
local Plr = game:GetService("Players").LocalPlayer

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sr-Mango/Main/main/UILibrary.lua"))()

local a = Library:Window("Omega Obby 525 Stages")

local b = a:Tab("Main")

b:Box("Start Stage", "Value", function(value)
    start_stage = value
end)

b:Box("End Stage", "Value", function(value)
    end_stage = value
end)

b:Button("Start", function()    
    function tp(plr, endpos)
        plr.character.HumanoidRootPart.CFrame = CFrame.new(endpos)
    end
    
    for j = start_stage, end_stage, 1 do
    for i,v in pairs(todo) do
            if todo[i].name == tostring(j) then
                local todo_2 = todo[i]:GetChildren()
                for t,v in pairs(todo_2) do
                    if todo_2[t].name == "Spawn" then
                        local Pos = todo_2[t].Position
                        tp(Plr, Pos)
                        wait(wait_time)
                        break
                    end
                end
            end
        end
    end
    
end)


-- gameid = 8003084678

