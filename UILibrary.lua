for _, v in pairs(game.CoreGui:GetChildren()) do
	if v.Name == "KurumiLibrary" then
		v:Destroy()
	end
end

local Library = {TabCount = 0}

function Library:Window(title)
	local ScreenGui = Instance.new("ScreenGui")
	local Top = Instance.new("Frame")
	local Main = Instance.new("Frame")
	local TabHolder = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local Title = Instance.new("TextLabel")
	local Mini = Instance.new("TextButton")
	local UICorner_9 = Instance.new("UICorner")

	ScreenGui.Name = "KurumiLibrary"
	ScreenGui.Parent = game.CoreGui
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Top.Name = "Top"
	Top.Parent = ScreenGui
	Top.AnchorPoint = Vector2.new(0.5, 0.5)
	Top.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
	Top.BorderSizePixel = 0
	Top.Position = UDim2.new(0.5, 0, 0.35, 0)
	Top.Size = UDim2.new(0, 389, 0, 29)
	Top.Active = true

	Main.Name = "Main"
	Main.Parent = Top
	Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0, 0, 1, 0)
	Main.Size = UDim2.new(0, 389, 0, 234)
	Main.ClipsDescendants = true

	TabHolder.Name = "TabHolder"
	TabHolder.Parent = Main
	TabHolder.Active = true
	TabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabHolder.BackgroundTransparency = 1.000
	TabHolder.Size = UDim2.new(0, 112, 0, 203)
	TabHolder.ScrollBarThickness = 0

	UIListLayout.Parent = TabHolder
	UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 3)

	UIPadding.Parent = TabHolder
	UIPadding.PaddingTop = UDim.new(0, 6)

	Title.Name = "Title"
	Title.Parent = Top
	Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Title.BackgroundTransparency = 1.000
	Title.Position = UDim2.new(0.0161290318, 0, 0.103448279, 0)
	Title.Size = UDim2.new(0, 162, 0, 23)
	Title.Font = Enum.Font.TitilliumWeb
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextScaled = true
	Title.TextSize = 14.000
	Title.TextWrapped = true
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Mini.Name = "Mini"
	Mini.Parent = Top
	Mini.BackgroundColor3 = Color3.fromRGB(255, 129, 26)
	Mini.ClipsDescendants = true
	Mini.Position = UDim2.new(0.933179677, 0, 0.137931034, 0)
	Mini.Size = UDim2.new(0, 21, 0, 19)
	Mini.ZIndex = 2
	Mini.Font = Enum.Font.TitilliumWeb
	Mini.Text = ""
	Mini.TextColor3 = Color3.fromRGB(0, 0, 0)
	Mini.TextSize = 14.000

	UICorner_9.CornerRadius = UDim.new(0, 2)
	UICorner_9.Parent = Mini

	Mini.MouseButton1Click:Connect(function()
		if Mini.BackgroundColor3 == Color3.fromRGB(255, 129, 26) then
			game:GetService("TweenService"):Create(Mini, TweenInfo.new(0.35), {BackgroundColor3 = Color3.fromRGB(255, 0, 102)}):Play()
			Main:TweenSize(UDim2.new(0, 389,0, 0), "Out", "Quad", 0.4, true)
		else
			game:GetService("TweenService"):Create(Mini, TweenInfo.new(0.35), {BackgroundColor3 = Color3.fromRGB(255, 129, 26)}):Play()
			Main:TweenSize(UDim2.new(0, 389,0, 234), "Out", "Quad", 0.4, true)
		end
	end)

	function dragify(Frame)
		dragToggle = nil
		dragSpeed = .25 -- You can edit this.
		dragInput = nil
		dragStart = nil
		dragPos = nil

		function updateInput(input)
			Delta = input.Position - dragStart
			Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + Delta.X, startPos.Y.Scale, startPos.Y.Offset + Delta.Y)
			game:GetService("TweenService"):Create(Frame, TweenInfo.new(.25), {Position = Position}):Play()
		end

		Frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = Frame.Position
				input.Changed:Connect(function()
					if (input.UserInputState == Enum.UserInputState.End) then
						dragToggle = false
					end
				end)
			end
		end)

		Frame.InputChanged:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
				dragInput = input
			end
		end)

		game:GetService("UserInputService").InputChanged:Connect(function(input)
			if (input == dragInput and dragToggle) then
				updateInput(input)
			end
		end)
	end

	dragify(Top)

	local TabHolderV = {}

	function TabHolderV:Tab(title)
		local TabButton = Instance.new("TextButton")
		local UICorner = Instance.new("UICorner")
		local TabName = Instance.new("TextLabel")
		local Tab = Instance.new("Frame")
		local Container = Instance.new("ScrollingFrame")
		local UIListLayout_2 = Instance.new("UIListLayout")
		local UIPadding_2 = Instance.new("UIPadding")

		TabButton.Name = "TabButton"
		TabButton.Parent = TabHolder
		TabButton.BackgroundColor3 = Library.TabCount == 0 and Color3.fromRGB(1, 255, 120) or Color3.fromRGB(40, 40, 40)
		TabButton.BorderSizePixel = 0
		TabButton.ClipsDescendants = true
		TabButton.Position = UDim2.new(0.0357142873, 0, 0.024630541, 0)
		TabButton.Size = UDim2.new(0, 104, 0, 28)
		TabButton.AutoButtonColor = false
		TabButton.Font = Enum.Font.TitilliumWeb
		TabButton.Text = ""
		TabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		TabButton.TextSize = 14.000

		UICorner.CornerRadius = UDim.new(0, 1)
		UICorner.Parent = TabButton

		TabName.Name = "TabName"
		TabName.Parent = TabButton
		TabName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabName.BackgroundTransparency = 1.000
		TabName.Position = UDim2.new(0.0865384638, 0, 0.189560443, 0)
		TabName.Size = UDim2.new(0, 71, 0, 18)
		TabName.Font = Enum.Font.TitilliumWeb
		TabName.Text = title
		TabName.TextColor3 = Library.TabCount == 0 and Color3.fromRGB(60, 60, 60) or Color3.fromRGB(255, 255, 255)
		TabName.TextScaled = true
		TabName.TextSize = 14.000
		TabName.TextWrapped = true
		TabName.TextXAlignment = Enum.TextXAlignment.Left

		Tab.Name = "Tab"
		Tab.Parent = Main
		Tab.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
		Tab.BorderSizePixel = 0
		Tab.Position = UDim2.new(0.31195429, 0, 0.024630541, 0)
		Tab.Size = UDim2.new(0, 267, 0, 227)
		Tab.Visible = Library.TabCount == 0

		Container.Name = "Container"
		Container.Parent = Tab
		Container.Active = true
		Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Container.BackgroundTransparency = 1.000
		Container.Size = UDim2.new(0, 267, 0, 227)
		Container.CanvasSize = UDim2.new(0, 0, 6, 0)
		Container.ScrollBarThickness = 0

		UIListLayout_2.Parent = Container
		UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout_2.Padding = UDim.new(0, 5)

		UIPadding_2.Parent = Container
		UIPadding_2.PaddingTop = UDim.new(0, 5)

		TabButton.MouseButton1Click:Connect(function()
			for i,v in pairs(Main:GetChildren()) do
				if v.Name == "Tab" then
					v.Visible = false
				end
			end
			Tab.Visible = true
			
			for i,v in pairs(TabHolder:GetChildren()) do
				if v.Name == "TabButton" then
					v.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
					v.TabName.TextColor3 = Color3.fromRGB(255, 255, 255)
				end
			end
			TabButton.BackgroundColor3 = Color3.fromRGB(1, 255, 120)
			TabName.TextColor3 = Color3.fromRGB(60, 60, 60)
		end)

		Library.TabCount = Library.TabCount + 1

		local Lib = {}

		function Lib:Button(name, callback)
			local Button = Instance.new("TextButton")
			local UICorner_2 = Instance.new("UICorner")
			local ButtonName = Instance.new("TextLabel")

			Button.Name = "Button"
			Button.Parent = Container
			Button.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			Button.BorderSizePixel = 0
			Button.ClipsDescendants = true
			Button.Position = UDim2.new(0.0355805233, 0, 0.0252525248, 0)
			Button.Size = UDim2.new(0, 248, 0, 28)
			Button.Font = Enum.Font.TitilliumWeb
			Button.Text = ""
			Button.TextColor3 = Color3.fromRGB(0, 0, 0)
			Button.TextSize = 14.000
			Button.MouseButton1Click:Connect(function()
				callback()
			end)

			UICorner_2.CornerRadius = UDim.new(0, 3)
			UICorner_2.Parent = Button

			ButtonName.Name = "ButtonName"
			ButtonName.Parent = Button
			ButtonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.BackgroundTransparency = 1.000
			ButtonName.Position = UDim2.new(0, 0,0.143, 0)
			ButtonName.Size = UDim2.new(0, 248,0, 19)
			ButtonName.Font = Enum.Font.TitilliumWeb
			ButtonName.Text = name
			ButtonName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.TextScaled = true
			ButtonName.TextSize = 14.000
			ButtonName.TextWrapped = true

			Button.MouseButton1Click:Connect(function()
				local c = Instance.new("ImageLabel", Button)
				local Mouse = game.Players.LocalPlayer:GetMouse()
				c.BackgroundTransparency = 1
				c.Image = "rbxassetid://3570695787"
				c.ImageTransparency = 0.8
				c.Position = UDim2.new(0, (Mouse.X - c.AbsolutePosition.X), 0, (Mouse.Y - c.AbsolutePosition.Y))
				c.ScaleType = "Slice"
				c.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				c.SliceCenter = Rect.new(100, 100, 100, 100)
				c.SliceScale = 1
				local Size = 0
				if Button.AbsoluteSize.X > Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.X*1.5
				elseif Button.AbsoluteSize.X < Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.Y*1.5
				elseif Button.AbsoluteSize.X == Button.AbsoluteSize.Y then
					Size = Button.AbsoluteSize.X*1.5
				end
				c:TweenSizeAndPosition(UDim2.new(0, Size, 0, Size), UDim2.new(.5, -Size/2, .5, -Size/2), "Out", "Linear", .5)
				while c.ImageTransparency ~= 1 do
					wait()
					c.ImageTransparency = c.ImageTransparency + 0.02
					if c.ImageTransparency == 1 then c:Destroy() end
				end
			end)
		end

		function Lib:Toggle(name, callback)
			local ToggleBack = Instance.new("Frame")
			local UICorner_3 = Instance.new("UICorner")
			local Toggle = Instance.new("TextButton")
			local ToggleLogo = Instance.new("Frame")
			local UICorner_4 = Instance.new("UICorner")
			local ToggleName = Instance.new("TextLabel")

			ToggleBack.Name = "ToggleBack"
			ToggleBack.Parent = Container
			ToggleBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			ToggleBack.Position = UDim2.new(-0.228464425, 0, 0.017676767, 0)
			ToggleBack.Size = UDim2.new(0, 248, 0, 28)

			UICorner_3.CornerRadius = UDim.new(0, 3)
			UICorner_3.Parent = ToggleBack

			Toggle.Name = "Toggle"
			Toggle.Parent = ToggleBack
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BackgroundTransparency = 1.000
			Toggle.ClipsDescendants = true
			Toggle.Size = UDim2.new(0, 248, 0, 28)
			Toggle.ZIndex = 2
			Toggle.Font = Enum.Font.TitilliumWeb
			Toggle.Text = ""
			Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
			Toggle.TextSize = 14.000

			ToggleLogo.Name = "ToggleLogo"
			ToggleLogo.Parent = ToggleBack
			ToggleLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleLogo.Position = UDim2.new(0.0282258056, 0, 0.178571433, 0)
			ToggleLogo.Size = UDim2.new(0, 20, 0, 17)

			UICorner_4.CornerRadius = UDim.new(0, 3)
			UICorner_4.Parent = ToggleLogo

			ToggleName.Name = "ToggleName"
			ToggleName.Parent = ToggleBack
			ToggleName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.BackgroundTransparency = 1.000
			ToggleName.Position = UDim2.new(0.149193555, 0, 0.142857149, 0)
			ToggleName.Size = UDim2.new(0, 248, 0, 19)
			ToggleName.Font = Enum.Font.TitilliumWeb
			ToggleName.Text = name
			ToggleName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ToggleName.TextScaled = true
			ToggleName.TextSize = 14.000
			ToggleName.TextWrapped = true
			ToggleName.TextXAlignment = Enum.TextXAlignment.Left

			Toggle.MouseButton1Click:Connect(function()
				if ToggleLogo.BackgroundColor3 == Color3.fromRGB(255, 255, 255) then
					game:GetService("TweenService"):Create(ToggleLogo, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(1, 255, 120)}):Play()
					callback(true)
				else
					game:GetService("TweenService"):Create(ToggleLogo, TweenInfo.new(0.25), {BackgroundColor3 = Color3.fromRGB(255, 255, 255)}):Play()
					callback(false)
				end
			end)
		end

		function Lib:Slider(name, min, max, start, callback)
			local SliderBack = Instance.new("Frame")
			local UICorner_5 = Instance.new("UICorner")
			local SliderName = Instance.new("TextLabel")
			local Slider = Instance.new("Frame")
			local UICorner_6 = Instance.new("UICorner")
			local SliderValue = Instance.new("TextLabel")
			local dragging = false;

			SliderBack.Name = "SliderBack"
			SliderBack.Parent = Container
			SliderBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			SliderBack.Position = UDim2.new(-0.228464425, 0, 0.017676767, 0)
			SliderBack.Size = UDim2.new(0, 248, 0, 28)
			SliderBack.ClipsDescendants = true

			UICorner_5.CornerRadius = UDim.new(0, 3)
			UICorner_5.Parent = SliderBack

			SliderName.Name = "SliderName"
			SliderName.Parent = SliderBack
			SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.BackgroundTransparency = 1.000
			SliderName.Position = UDim2.new(0.0282258056, 0, 0.178571433, 0)
			SliderName.Size = UDim2.new(0, 80, 0, 19)
			SliderName.ZIndex = 2
			SliderName.Font = Enum.Font.TitilliumWeb
			SliderName.Text = name
			SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.TextScaled = true
			SliderName.TextSize = 14.000
			SliderName.TextWrapped = true
			SliderName.TextXAlignment = Enum.TextXAlignment.Left

			Slider.Name = "Slider"
			Slider.Parent = SliderBack
			Slider.BackgroundColor3 = Color3.fromRGB(1, 255, 120)
			Slider.Size = UDim2.new((start or 0) / max, 0, 1, 0);

			UICorner_6.CornerRadius = UDim.new(0, 3)
			UICorner_6.Parent = Slider

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = SliderBack
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.Position = UDim2.new(0.802419364, 0, 0.178571433, 0)
			SliderValue.Size = UDim2.new(0, 49, 0, 19)
			SliderValue.Font = Enum.Font.TitilliumWeb
			SliderValue.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0) .. "/" .. max
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextScaled = true
			SliderValue.TextSize = 14.000
			SliderValue.TextWrapped = true

			local function slide(input)
				local pos = UDim2.new(math.clamp((input.Position.X - SliderBack.AbsolutePosition.X) / SliderBack.AbsoluteSize.X, 0, 1), 0, 1, 0);
				Slider:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
				local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min);
				SliderValue.Text = tostring(value) .. "/" .. max;
				callback(value);
			end;

			SliderBack.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = true;
				end;
			end);

			SliderBack.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false;
				end;
			end);

			SliderBack.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					slide(input);
				end;
			end);

			game:GetService("UserInputService").InputChanged:Connect(function(input)
				if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
					slide(input);
				end;
			end);
		end

		function Lib:Box(name, string,  callback)
			local BoxBack = Instance.new("Frame")
			local Box = Instance.new("TextBox")
			local UICorner_7 = Instance.new("UICorner")
			local UICorner_8 = Instance.new("UICorner")
			local BoxName = Instance.new("TextLabel")

			BoxBack.Name = "BoxBack"
			BoxBack.Parent = Container
			BoxBack.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			BoxBack.Size = UDim2.new(0, 248, 0, 28)
			BoxBack.ClipsDescendants = true

			Box.Name = "Box"
			Box.Parent = BoxBack
			Box.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			Box.ClipsDescendants = true
			Box.Position = UDim2.new(0.735, 0, 0.1, 0)
			Box.Size = UDim2.new(0, 63, 0, 23)
			Box.Font = Enum.Font.TitilliumWeb
			Box.Text = string
			Box.TextColor3 = Color3.fromRGB(255, 255, 255)
			Box.TextSize = 16.000
			Box.FocusLost:Connect(function()
				callback(Box.Text)
			end)

			UICorner_7.CornerRadius = UDim.new(0, 3)
			UICorner_7.Parent = Box

			UICorner_8.CornerRadius = UDim.new(0, 3)
			UICorner_8.Parent = BoxBack

			BoxName.Name = "BoxName"
			BoxName.Parent = BoxBack
			BoxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.BackgroundTransparency = 1.000
			BoxName.Position = UDim2.new(0.0282258056, 0, 0.142857149, 0)
			BoxName.Size = UDim2.new(0, 80, 0, 19)
			BoxName.Font = Enum.Font.TitilliumWeb
			BoxName.Text = name
			BoxName.TextColor3 = Color3.fromRGB(255, 255, 255)
			BoxName.TextScaled = true
			BoxName.TextSize = 14.000
			BoxName.TextWrapped = true
			BoxName.TextXAlignment = Enum.TextXAlignment.Left
		end
		
		function Lib:Label(text)
			local Label = Instance.new("TextLabel")

			Label.Name = "Label"
			Label.Parent = Container
			Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Label.BackgroundTransparency = 1.000
			Label.Position = UDim2.new(0.0355805233, 0, 0.603524208, 0)
			Label.Size = UDim2.new(0, 248, 0, 20)
			Label.Font = Enum.Font.TitilliumWeb
			Label.Text = text
			Label.TextColor3 = Color3.fromRGB(255, 255, 255)
			Label.TextScaled = true
			Label.TextSize = 14.000
			Label.TextWrapped = true
		end

		return Lib

	end

    return TabHolderV
    
end

return Library
