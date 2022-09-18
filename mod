if not game:IsLoaded() then
    game.Loaded:Wait()
end

									-- dark chat

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Chat = game:GetService("Chat")
local ChatSettings = require(Chat:WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local ChatGui = Player:WaitForChild("PlayerGui"):WaitForChild("BubbleChat")
ChatSettings.BubbleChatEnabled = true -- Turn on bubble chat.
ChatGui.DescendantAdded:Connect(function(ChatElement) -- OnBubbleChatDraw
    if ChatElement.Name == "ChatBubble" then
        ChatElement.ImageColor3 = Color3.fromRGB(30, 30, 30)
    elseif ChatElement.Name == "ChatBubbleTail" then
        ChatElement.ImageColor3 = Color3.fromRGB(30, 30, 30)
    elseif ChatElement.Name == "BubbleText" then
        ChatElement.TextColor3 = Color3.fromRGB(255, 255, 255)
    elseif ChatElement.Name == "SmallTalkBubble" then
        ChatElement.ImageColor3 = Color3.fromRGB(30, 30, 30)
    end
end)
print("loaded dark chat")


local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://1301186018"
    sound.Parent = game:GetService("SoundService")
sound.Volume = 2
    sound:Play()


wait(0.05)


--// variables/modules
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:FindFirstChild("RobloxGui")
local UserInputService = game:GetService("UserInputService")

local TopBar = game:GetService("CoreGui"):WaitForChild("ThemeProvider"):WaitForChild("TopBarFrame")
local ChatIcon = TopBar:WaitForChild("LeftFrame"):WaitForChild("ChatIcon"):WaitForChild("Background"):WaitForChild("Icon")

local UIS = game:GetService("UserInputService")

--// custom assets
local getasset = getsynasset or getcustomasset
makefolder("2016_storage")

writefile("2016_storage/bc.png", game:HttpGet("https://raw.githubusercontent.com/specowos/lua-projects/main/project%202016%3A%20Remastered/images/icon_BC-16.png"))
writefile("2016_storage/tbc.png", game:HttpGet("https://raw.githubusercontent.com/specowos/lua-projects/main/project%202016%3A%20Remastered/images/icon_TBC-16.png"))
writefile("2016_storage/obc.png", game:HttpGet("https://raw.githubusercontent.com/specowos/lua-projects/main/project%202016%3A%20Remastered/images/icon_OBC-16.png"))

local bc_storage = {
    getasset("2016_storage/bc.png"),
    getasset("2016_storage/obc.png"),
    getasset("2016_storage/tbc.png")
}

--// STYLE:
TopBar.Transparency = 1
TopBar.BorderSizePixel = 0
TopBar.BackgroundColor3 = Color3.fromRGB(31, 31, 31)

TopBar.LeftFrame.ChatIcon.Background.StateOverlay.Image = ""
TopBar.LeftFrame.MenuIcon.Background.StateOverlay.Image = ""

TopBar.LeftFrame.MenuIcon.Background.Image = ""
TopBar.LeftFrame.ChatIcon.Background.Image = ""

TopBar.LeftFrame.Position = UDim2.new(0, 0, 0, 2)
TopBar.LeftFrame.Size = UDim2.new(0, 0, 0, 36)

TopBar.LeftFrame.MenuIcon.Position = UDim2.new(0, 0, 0, 0)
TopBar.LeftFrame.MenuIcon.Size = UDim2.new(0, 50, 0, 36)
TopBar.LeftFrame.MenuIcon.Background.Icon.Position = UDim2.new(0, 25, 0, 12)
TopBar.LeftFrame.MenuIcon.Background.Icon.Size = UDim2.new(0, 32, 0, 25)
game.CoreGui:WaitForChild("ThemeProvider").LegacyCloseMenu.CloseMenuButton.Position = UDim2.new(0, -8, 0, 18)
game.CoreGui:WaitForChild("ThemeProvider").LegacyCloseMenu.CloseMenuButton.Size = UDim2.new(0, 32, 0, 25)

TopBar.LeftFrame.ChatIcon.Position = UDim2.new(0, 0, 0, 0)
TopBar.LeftFrame.ChatIcon.Size = UDim2.new(0, 50, 0, 36)
TopBar.LeftFrame.ChatIcon.Background.Icon.Position = UDim2.new(0, 14, 0, 13)
TopBar.LeftFrame.ChatIcon.Background.Icon.Size = UDim2.new(0, 28, 0, 27)

TopBar.LeftFrame.MenuIcon.Background.Icon.Image = "rbxasset://textures/ui/Menu/Hamburger.png"

--// FUNCTIONS:

--// old graphics
    --// epic 2016 remastered
	--// instances
    local cc = Instance.new("ColorCorrectionEffect")
    local lighting = game:GetService("Lighting")

    --// hd killer
    local ihateu = {"DepthOfFieldEffect", "SunRaysEffect", "BloomEffect"}
    for i, v in pairs(lighting:GetChildren()) do
        for index, value in ipairs(ihateu) do
            if v:IsA(value) then
            v:Destroy() 
            end
        end
    end

    --// setup
    cc.Parent = game.Lighting
    cc.Saturation = 0
    cc.Contrast = -0.05

    sethiddenproperty(lighting, "Technology", Enum.Technology.Compatibility) 

    settings().Rendering.QualityLevel = 16

    print("loaded old stuff")

--// fps mod
    local fps_counter = Instance.new("TextLabel")

    fps_counter.Name = "fps_counter"
    fps_counter.Parent = TopBar.RightFrame
    fps_counter.BackgroundTransparency = 1
    fps_counter.Size = UDim2.new(0, 35, 0, 32)
    fps_counter.Font = Enum.Font.SourceSans
    fps_counter.TextColor3 = Color3.fromRGB(255, 255, 255)
    fps_counter.TextSize = 16.000
    fps_counter.TextXAlignment = Enum.TextXAlignment.Right

    local FPS = 0
    local Tiempo = task.wait()

    spawn(function()
        while game:GetService("RunService").RenderStepped:wait() do
            local Transcurrido = math.abs(Tiempo-tick())
            Tiempo = tick()
            FPS = math.floor(1/Transcurrido)
        end
    end)

    spawn(function()
        while wait(0.25) do
            fps_counter.Text = "FPS: "..tostring(FPS) 
        end
    end)

--// chat scripts
    spawn(function()
        game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar:IsFocused() then
                game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency = 0.1
            else
                game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency = game.Players.LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.BackgroundTransparency
            end
        end)
    end)

local function changechatico()
    if ChatIcon.Image == "rbxasset://textures/ui/TopBar/chatOff.png" then
        ChatIcon.Image = "rbxasset://textures/ui/Chat/Chat@2x.png"
    elseif ChatIcon.Image == "rbxasset://textures/ui/TopBar/chatOn.png" then
        ChatIcon.Image = "rbxasset://textures/ui/Chat/ChatDown@2x.png"
    end		
end

for _,v in pairs(game:GetDescendants()) do
    if v:IsA("TextLabel") and v.Text == "Chat '/?' or '/help' for a list of chat commands." then
        v.Text = "press keypad 1 2 and 3 for cool noises"
    end
end

changechatico()

spawn(function()
    game:GetService("Players").PlayerChatted:Connect(function(PlayerChatType, sender, message, recipient)
        changechatico()
    end)
end)

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        changechatico()
    end)
end)

--// just something useful from the src i was too lazy to group
game.RunService.Heartbeat:Connect(function()
    TopBar.LeftFrame.MenuIcon.Background.StateOverlay.Image = ""
        game.CoreGui:WaitForChild("ThemeProvider").LegacyCloseMenu.CloseMenuButton.Image = "rbxasset://textures/ui/Menu/HamburgerDown.png"
    game.CoreGui:WaitForChild("ThemeProvider").LegacyCloseMenu.CloseMenuButton.ImageRectOffset = Vector2.new(0, 0)
    game.CoreGui:WaitForChild("ThemeProvider").LegacyCloseMenu.CloseMenuButton.ImageRectSize = Vector2.new(0, 0)
    if TopBar.RightFrame:FindFirstChild("MoreMenu") then
        TopBar.RightFrame.MoreMenu:Destroy()
    end
    if TopBar.LeftFrame.ChatIcon:FindFirstChild("BadgeContainer") then
        if TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge") then
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.Image = "rbxasset://textures/ui/Chat/MessageCounter.png"
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectOffset = Vector2.new(0, 0)
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ImageRectSize = Vector2.new(0, 0)
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner:ClearAllChildren()
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Position = UDim2.new(0, 15, 0, 2)
            TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Inner.ScaleType = Enum.ScaleType.Fit
            if TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge"):FindFirstChild("Background") then
                TopBar.LeftFrame.ChatIcon.BadgeContainer:FindFirstChild("Badge").Background:Destroy()
            end
        end
    end
end)


--/console
    loadstring(game:HttpGet("https://raw.githubusercontent.com/specowos/lua-projects/main/project%202016%3A%20Remastered/modules/old_console.lua"))()
