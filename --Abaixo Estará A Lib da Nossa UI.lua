--Abaixo Estará A Lib  da Nossa UI

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/7yhx/kwargs_Ui_Library/main/source.lua"))()

local UI = Lib:Create{
    Theme = "Dark", -- or any other theme
    Size = UDim2.new(0, 555, 0, 400) -- default
 }
 
 local Main = UI:Tab{
    Name = "Inicio"
 }
 
 local Divider = Main:Divider{
    Name = "Inicio shit"
 }
 
 local QuitDivider = Main:Divider{
    Name = "Sair"
 }

-- Arsenal Script
-- By: Bing

-- ESP
local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()

-- Aimbot
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera

local function GetClosestPlayer()
    local ClosestPlayer = nil
    local ShortestDistance = math.huge

    for _, Player in pairs(Players:GetPlayers()) do
        if Player.Team ~= LocalPlayer.Team and Player.Character and Player.Character:FindFirstChild("Head") then
            local Distance = (Player.Character.Head.Position - Camera.CFrame.p).magnitude
            if Distance < ShortestDistance then
                ClosestPlayer = Player
                ShortestDistance = Distance
            end
        end
    end

    return ClosestPlayer
end

local function Aimbot()
    local ClosestPlayer = GetClosestPlayer()
    if ClosestPlayer then
        local Head = ClosestPlayer.Character.Head
        local Position = Camera:WorldToScreenPoint(Head.Position)
        mousemoverel((Position.X - Mouse.X), (Position.Y - Mouse.Y))
    end
end

-- FOV
local FOV = Drawing.new("Circle")
FOV.Transparency = 0.5
FOV.Thickness = 2
FOV.NumSides = 12
FOV.Color = Color3.fromRGB(255, 0, 0)
FOV.Visible = true
FOV.Radius = 300

-- Keybind
local Keybind = Enum.KeyCode.F

-- Main
ESP:AddESP()
game:GetService("UserInputService").InputBegan:Connect(function(Input, GameProcessed)
    if Input.KeyCode == Keybind and not GameProcessed then
        ESP:Toggle()
        FOV.Visible = not FOV.Visible
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    Aimbot()
    FOV.Position = Vector2.new(Mouse.X, Mouse.Y)
end)
