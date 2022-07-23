
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/Tuturial_UI_Library/main/UI_Template_1"))()

local Window = Library.CreateLib('lojkahub0.1 discord.gg/starpirates', 'RJTheme3')

local Tab = Window:NewTab('LocalPlayer')

local Section = Tab:NewSection('Local Player')

local plr = game.Players.LocalPlayer


Section:NewSlider('Speed', 'Your WalkSpeed', 500, 16, function(s)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
Section:NewSlider('JumpHeight', 'Your JumpHeight', 500, 0, function(d)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = d
end)

Section:NewButton('Inf Stamina', 'Makes Your Stamina Infinity', function(ez)
	local old
	old = hookfunction(getrenv()._G.Stamina, function(self, ...)

   		local args = {...}

   		if typeof(args[1]) == "number" then
      		args[1] = 0
   		end

   return old(self, unpack(args))
end)
end)
Section:NewButton('Muzan TP', 'Teleporting to Muzan', function()
	local cf = CFrame.new(game:GetService("Workspace").Muzan.SpawnPos.Value)
	local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(10), {CFrame = cf})
	tween:Play()
end)

Section:NewButton('Flowers ESP', 'Flowers Esp Show', function()
	local Camera = workspace.CurrentCamera
	local Player = game:GetService("Players").LocalPlayer
	local RS = game:GetService("RunService")

	local ESP = {}
	function ESP:add(object, name, col)
	    local namedrawing = Drawing.new("Text")
	    namedrawing.Text = name
	    namedrawing.Size = 16
	    namedrawing.Color = col
	    namedrawing.Center = true
	    namedrawing.Visible = true
	    namedrawing.Transparency = 1
	    namedrawing.Position = Vector2.new(0, 0)
	    namedrawing.Outline = true
	    namedrawing.OutlineColor = Color3.fromRGB(10, 10, 10)
	    namedrawing.Font = 3

	    local function Update()
	        local c
	        c = RS.RenderStepped:Connect(function()
	            if object.Parent ~= nil and object:FindFirstChild("Pick_Demon_Flower_Thing") then
	                local p, vis = Camera:WorldToViewportPoint(object.Position)
	                if vis then
	                    namedrawing.Position = Vector2.new(p.X, p.Y)
	                    namedrawing.Visible = true
	                else
	                    namedrawing.Visible = false
	                end
	            else
	                namedrawing.Visible = false
	                if object.Parent == nil  or not object:FindFirstChild("Pick_Demon_Flower_Thing") then
	                    namedrawing:Remove()
	                    c:Disconnect()
	                end
	            end
	        end)
	    end
	    coroutine.wrap(Update)()
	end

	RS.Heartbeat:Connect(function()
	    for _,v in pairs(game:GetService("Workspace")["Demon_Flowers_Spawn"]:GetDescendants()) do
	        if v:FindFirstChild('Pick_Demon_Flower_Thing') then
	            ESP:add(v, "Lilly Flower", Color3.fromRGB(13, 105, 172))
	        end
	    end
	end)

end)



local Tab1 = Window:NewTab('Teleport')

local Section1 = Tab1:NewSection('Teleport Locations')

Section1:NewDropdown('Breathing Trainers', 'Breathe Teleport Location', {'Water Breathe', 'Wind Breathe', 'Thunder Breathe', 'Insect Breathe'}, function(asd)

local teleport_table = {
    thunder = Vector3.new(-323.96759, 426.857788, -2382.76562, 0.423220903, -2.37480968e-08, -0.906026542, -2.54349199e-08, 1, -3.80923595e-08, 0.906026542, 3.91661956e-08, 0.423220903),
    water = Vector3.new(709.270325, 261.426819, -2403.09521, -0.963437736, -4.75703494e-08, -0.267932236, -6.12550224e-08, 1, 4.27162199e-08, 0.267932236, 5.75666128e-08, -0.963437736),
    wind = Vector3.new(1790.81079, 334.0271, -3516.93018, 0.958623946, -5.47387522e-08, -0.284675479, 6.87623682e-08, 1, 3.92675155e-08, 0.284675479, -5.72177399e-08, 0.958623946),
    insect = Vector3.new(2876.38745, 316.192139, -3916.42114, 0.487812847, 6.09611348e-08, 0.872948229, -5.72205785e-08, 1, -3.78581468e-08, -0.872948229, -3.14829123e-08, 0.487812847),
    sabito = Vector3.new(1130.08875, 262.799438, -2816.71313, -1, 0, 0, 0, 1, 0, 0, 0, -1)
}

local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(10,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer

function bypass_teleport(v)
    if lp.Character and
        lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(v)
            local a = tween_s:Create(lp.Character.HumanoidRootPart, tweeninfo, {CFrame=cf})
            a:Play()

    end


end

    if asd == 'Water Breathe' then
        bypass_teleport(teleport_table.water)
    elseif asd == 'Wind Breathe' then
        bypass_teleport(teleport_table.wind)
    elseif asd == 'Thunder Breathe' then
        bypass_teleport(teleport_table.thunder)
    elseif asd == 'Insect Breathe' then
        bypass_teleport(teleport_table.insect)
end
end)

Section1:NewDropdown('Bosses', 'Bosses Teleport Location', {'Sabito', 'Shiron', 'Giyu', 'Kaden'}, function(qwe)

local teleport_table1 = {
    sabito = Vector3.new(1190.95947, 285.947815, -2832.96655, -0.873300374, -1.15066907e-08, -0.48718217, -3.89085653e-09, 1, -1.66442966e-08, 0.48718217, -1.2639914e-08, -0.873300374),
    kaden = Vector3.new(-601.798096, 317.136688, -2896.00122, -0.308662862, -5.2500198e-08, -0.951171517, -1.23839399e-07, 1, -1.50084105e-08, 0.951171517, 1.1315997e-07, -0.308662862),
    giyu = Vector3.new(3040.02075, 357.413666, -2943.72559, 0.999924958, 1.8787123e-08, 0.012250579, -1.86992342e-08, 1, -7.28888994e-09, -0.012250579, 7.0592665e-09, 0.999924958),
    shiron = Vector3.new(3230.42993, 370.884155, -3842.05298, 0.99990654, 1.04678307e-07, 0.0136736911, -1.05326791e-07, 1, 4.67054306e-08, -0.0136736911, -4.81412705e-08, 0.99990654)
}   

local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(10,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer


function bypass_teleport1(v)
    if lp.Character and
        lp.Character:FindFirstChild('HumanoidRootPart') then
            local cf = CFrame.new(v)
            local a = tween_s:Create(lp.Character.HumanoidRootPart, tweeninfo, {CFrame=cf})
            a:Play()

    end
end



    if qwe == 'Sabito' then
        bypass_teleport1(teleport_table1.sabito)
    elseif qwe == 'Shiron' then
        bypass_teleport1(teleport_table1.shiron)
    elseif qwe == 'Giyu' then
        bypass_teleport1(teleport_table1.giyu)
    elseif qwe =='Kaden' then 
        bypass_teleport1(teleport_table1.kaden)
end

end)


local Tab2 = Window:NewTab('AutoFarm')
local Section2 = Tab2:NewSection('AutoFarm')

local teleport_table = {
    location1 = Vector3.new(92.0377579, 354.600952, -3180.53345, 0.974391699, 2.42582421e-09, -0.22485745, -3.57667584e-09, 1, -4.71080153e-09, 0.22485745, 5.39440803e-09, 0.974391699), -- your desired position
    location2 = Vector3.new(-184.061813, 351.698669, -3051.39062, 0.707107961, -2.35411198e-06, 0.707105815, 3.30813214e-06, 1, 2.10785434e-08, -0.707105815, 2.32429488e-06, 0.707108259)  -- your desired position
}

local tween_s = game:GetService('TweenService')
local tweeninfo = TweenInfo.new(10,Enum.EasingStyle.Linear)

local lp = game.Players.LocalPlayer

function bypass_teleport(v)
    if lp.Character and 
    lp.Character:FindFirstChild('HumanoidRootPart') then
        local cf = CFrame.new(v)
        local a = tween_s:Create(lp.Character.HumanoidRootPart,tweeninfo,{CFrame=cf})
        a:Play()
        -- a.Completed:Wait()
        -- print('Teleporting Done!')
    end
end



Section2:NewButton('Auto Diamond', 'auto makes diamond quest', function()
    bypass_teleport(teleport_table.location1)
    wait(11)
    local args = {
		[1] = "AddQuest",
		[2] = "Players."..plr.Name..".PlayerGui.Npc_Dialogue.LocalScript.Functions",
		[3] = 255770.2233736,
		[4] = game:GetService("ReplicatedStorage").Player_Data[plr.Name].Quest,
		[5] = {
			["List"] = {
				[1] = {
					["Name"] = "Find Missing Gem Stone",
					["Progress"] = {
						[1] = 0,
						[2] = 1
					}
				}
			},
					["Current"] = "Find Betty's missing gem stone"
		}
	}
		game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
		wait(2)
		local args = {

			[1] = "Quest_add",
			[2] = "Players."..plr.Name..".PlayerScripts.Small_Scripts.Ouwbih_gem_stone",
			[3] = 257984.5516705,
			[4] = {},
			[5] = game:GetService("Players").LocalPlayer,
			[6] = "done_betty_gem_quest",
			}
			game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
end)


Section2:NewToggle('Auto Fist Mastery In Future', 'Auto Makes A fist Mastery', function(zxc)
	if zxc then
		local cf = CFrame.new(176.249939, 283.25769, -1768.10022, -0.0378380455, 9.29478272e-09, 0.99928391, 1.33162574e-08, 1, -8.79722162e-09, -0.99928391, 1.29738522e-08, -0.0378380455)
		local tween = game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(10), {CFrame = cf})
		tween:Play()
		wait(3)
		local args = {
			[1] = "fist_combat",
			[2] = game:GetService("Players").LocalPlayer,
			[3] = game:GetService("Workspace").LocalPlayer
		}
		game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args))
	else
		print('failed')
	end
end)

Section2:NewTextBox("Dupe Money With Health Potion", "Dupes Your Money", function(count)
	local silly1 = 300 local silly2 = 300 local silly3 = -count
	game:GetService("ReplicatedStorage").purchase_elixirs:FireServer(silly1, silly2, silly3)
end)




local Tab4 = Window:NewTab('Auto Spin')
local Section4 = Tab4:NewSection('USE ONLY IN CUSTOMIZE MENU OR GET BANNED')

Section4:NewTextBox('Auto Spin', 'Put the clan name', function(txt)
	local chosen = txt -- type the thing u want here
	print(chosen)
	repeat task.wait()
	    game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer("check_can_spin", game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Spins, game:GetService("ReplicatedStorage").Player_Data[game.Players.LocalPlayer.Name].Clan)
		until string.lower(game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Clan.Value) == string.lower(chosen)

end)
