local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local l_TextService_0 = game:GetService("TextService");
local l_GameSettings_0 = UserSettings().GameSettings;
local v7 = require(l_RobloxGui_0.Modules.Settings.Utility);
local v8 = require(l_RobloxGui_0.Modules.RobloxTranslator);
local v9 = require(l_RobloxGui_0.Modules.Common.PolicyService);
local l_ScreenshotsPolicy_0 = require(l_CorePackages_0.Workspace.Packages.Screenshots).ScreenshotsPolicy;
local v11 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v12 = nil;
l_RobloxGui_0:WaitForChild("Modules"):WaitForChild("TenFootInterface");
local v13 = require(l_RobloxGui_0.Modules.TenFootInterface):IsEnabled();
local l_status_0, l_result_0 = pcall(function()
    return settings():GetFFlag("UseNotificationsLocalization");
end);
local v16 = l_status_0 and l_result_0;
local v17 = require(l_RobloxGui_0.Modules.Flags.GetFFlagOptimizeHelpMenuInputEvent);
local v18 = game:DefineFastFlag("FixGamepadHelpImage", false);
local v19 = game:DefineFastFlag("ShowUpdatedScreenshotHotkey", false);
v12 = (function()
    local l_NewPage_0 = require(l_RobloxGui_0.Modules.Settings.SettingsPageFactory):CreateNewPage();
    l_NewPage_0.HelpPages = {};
    l_NewPage_0.HelpPageContents = {};
    l_NewPage_0.ActiveHelpScheme = nil;
    local v21 = nil;
    l_NewPage_0.GetCurrentInputType = function(_)
        if v21 == nil then
            local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
            if not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBoxOne) or l_l_UserInputService_0_Platform_0 == Enum.Platform.WiiU then
                return "Gamepad";
            elseif not (l_l_UserInputService_0_Platform_0 ~= Enum.Platform.Windows) or l_l_UserInputService_0_Platform_0 == Enum.Platform.OSX then
                return "KeyboardMouse";
            else
                return "Touch";
            end;
        elseif not ((((v21 ~= Enum.UserInputType.Keyboard and v21 ~= Enum.UserInputType.MouseMovement) and v21 ~= Enum.UserInputType.MouseButton1) and v21 ~= Enum.UserInputType.MouseButton2) and v21 ~= Enum.UserInputType.MouseButton3) or v21 == Enum.UserInputType.MouseWheel then
            return "KeyboardMouse";
        elseif v21 == Enum.UserInputType.Touch then
            return "Touch";
        elseif not ((v21 ~= Enum.UserInputType.Gamepad1 and v21 ~= Enum.UserInputType.Gamepad2) and v21 ~= Enum.UserInputType.Gamepad3) or v21 == Enum.UserInputType.Gamepad4 then
            return "Gamepad";
        else
            return "KeyboardMouse";
        end;
    end;
    local function v47(v24)
        local function v35(v25, v26)
            local v27 = v7:Create("Frame")({
                Size = UDim2.new(0.3333333333333333, -4, 1, 0), 
                BackgroundTransparency = 1, 
                Name = "PCGroupFrame" .. tostring(v25)
            });
            local v28 = v7:Create("TextLabel")({
                Position = UDim2.new(0, 9, 0, 0), 
                Size = UDim2.new(1, -9, 0, 30), 
                BackgroundTransparency = 1, 
                Text = v25, 
                Font = v11.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                FontSize = v11.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                TextColor3 = Color3.new(1, 1, 1), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Name = "PCGroupTitle" .. tostring(v25), 
                ZIndex = 2, 
                Parent = v27
            });
            local v29 = 0;
            local l_Offset_0 = v28.Size.Y.Offset;
            for v31 = 1, #v26 do
                for v32, v33 in pairs(v26[v31]) do
                    local v34 = v7:Create("Frame")({
                        Size = UDim2.new(1, 0, 0, 42), 
                        Position = UDim2.new(0, 0, 0, l_Offset_0 + 44 * v29), 
                        BackgroundTransparency = v11.transparency("InputActionBackground", 0.65), 
                        BorderSizePixel = 0, 
                        ZIndex = 2, 
                        Name = "ActionInputBinding" .. tostring(v32), 
                        Parent = v27
                    });
                    if v11.UIBloxThemeEnabled then
                        v34.BackgroundColor3 = v11.color("InputActionBackground");
                        v7:Create("UICorner")({
                            CornerRadius = UDim.new(0, 3), 
                            Parent = v34
                        });
                    end;
                    Instance.new("UITextSizeConstraint", (v7:Create("TextLabel")({
                        Size = UDim2.new(0.4, -9, 0, 42), 
                        Position = UDim2.new(0, 9, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v32, 
                        Font = v11.font(Enum.Font.SourceSansBold, "HelpTitle"), 
                        FontSize = v11.fontSize(Enum.FontSize.Size18, "HelpTitle"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v32 .. "Label", 
                        ZIndex = 2, 
                        Parent = v34, 
                        TextWrapped = true, 
                        TextScaled = true
                    }))).MaxTextSize = v11.textSize(18, "HelpText");
                    Instance.new("UITextSizeConstraint", (v7:Create("TextLabel")({
                        Size = UDim2.new(0.5, 0, 0, 42), 
                        Position = UDim2.new(0.5, -4, 0, 0), 
                        BackgroundTransparency = 1, 
                        Text = v33, 
                        Font = v11.font(Enum.Font.SourceSans, "HelpText"), 
                        FontSize = v11.fontSize(Enum.FontSize.Size18, "HelpText"), 
                        TextColor3 = Color3.new(1, 1, 1), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        Name = v33 .. "Label", 
                        ZIndex = 2, 
                        Parent = v34, 
                        TextWrapped = true, 
                        TextScaled = true
                    }))).MaxTextSize = v11.textSize(18, "HelpText");
                    v29 = v29 + 1;
                end;
            end;
            v27.Size = UDim2.new(v27.Size.X.Scale, v27.Size.X.Offset, 0, l_Offset_0 + 44 * v29);
            return v27;
        end;
        local v36 = l_UserInputService_0:GetPlatform() == Enum.Platform.OSX;
        local v37 = v35("Character Movement", {
            [1] = {
                ["Move Forward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.W) .. "/" .. v8:FormatByKey("InGame.HelpMenu.UpArrow")
            }, 
            [2] = {
                ["Move Backward"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.S) .. "/" .. v8:FormatByKey("InGame.HelpMenu.DownArrow")
            }, 
            [3] = {
                ["Move Left"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.A) .. "/" .. v8:FormatByKey("InGame.HelpMenu.LeftArrow")
            }, 
            [4] = {
                ["Move Right"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.D) .. "/" .. v8:FormatByKey("InGame.HelpMenu.RightArrow")
            }, 
            [5] = {
                Jump = "Space"
            }
        });
        v37.Parent = v24;
        local v38 = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.One) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Two) .. "," .. l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Three) .. "...";
        local v39 = v35("Accessories", {
            [1] = {
                ["Equip Tools"] = v38
            }, 
            [2] = {
                ["Unequip Tools"] = v38
            }, 
            [3] = {
                ["Drop Tool"] = "Backspace"
            }, 
            [4] = {
                ["Use Tool"] = "Left Mouse Button"
            }
        });
        v39.Position = UDim2.new(0.3333333333333333, 4, 0, 0);
        v39.Parent = v24;
        local v40 = {};
        table.insert(v40, {
            ["UI Selection Toggle"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.BackSlash)
        });
        local v41 = not v9:IsSubjectToChinaPolicies();
        if v41 then
            local v42 = false;
            if v19 then
                local v43 = l_ScreenshotsPolicy_0.PolicyImplementation.read();
                v42 = not not v43 and l_ScreenshotsPolicy_0.Mapper(v43).eligibleForCapturesFeature();
            end;
            if not v42 then
                table.insert(v40, {
                    Screenshot = not v36 and "Print Screen" or "Cmd + Shift + 3"
                });
            else
                table.insert(v40, {
                    Screenshot = not v36 and "Ctrl + Shift + S" or "Cmd + Shift + S"
                });
            end;
            if not v36 then
                table.insert(v40, {
                    ["Record Video"] = "F12"
                });
            end;
        end;
        if v41 then
            table.insert(v40, {
                ["Dev Console"] = not v36 and "F9" or "F9/fn + F9"
            });
        end;
        table.insert(v40, {
            Mouselock = "Shift"
        });
        if v41 then
            table.insert(v40, {
                ["Graphics Level"] = not v36 and "F10" or "F10/fn + F10"
            });
            table.insert(v40, {
                Fullscreen = not v36 and "F11" or "Ctrl + Cmd + F"
            });
        end;
        if v41 then
            table.insert(v40, {
                ["Perf. Stats"] = not v36 and "Ctrl + Shift + F7" or "Fn+Opt+Cmd+F7"
            });
        end;
        local v44 = v35("Misc", v40);
        v44.Position = UDim2.new(0.6666666666666666, 8, 0, 0);
        v44.Parent = v24;
        local v45 = v35("Camera Movement", {
            [1] = {
                Rotate = "Right Mouse Button"
            }, 
            [2] = {
                ["Zoom In/Out"] = "Mouse Wheel"
            }, 
            [3] = {
                ["Zoom In"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.I)
            }, 
            [4] = {
                ["Zoom Out"] = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.O)
            }
        });
        v45.Position = UDim2.new(0, 0, v37.Size.Y.Scale, v37.Size.Y.Offset + 50);
        v45.Parent = v24;
        local v46 = v35("Menu Items", {
            [1] = {
                ["Roblox Menu"] = "Esc"
            }, 
            [2] = {
                Backpack = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Backquote)
            }, 
            [3] = {
                Playerlist = "Tab"
            }, 
            [4] = {
                Chat = l_UserInputService_0:GetStringForKeyCode(Enum.KeyCode.Slash)
            }
        });
        v46.Position = UDim2.new(0.3333333333333333, 4, v37.Size.Y.Scale, v37.Size.Y.Offset + 50);
        v46.Parent = v24;
        v24.Size = UDim2.new(v24.Size.X.Scale, v24.Size.X.Offset, 0, v46.Size.Y.Offset + v46.Position.Y.Offset);
    end;
    local function v69(v48)
        local v49 = math.max(l_NewPage_0.Page.AbsoluteSize.X * 0.58, 270);
        local v50 = if not v18 then UDim2.new(0, 700, 0, 448) else UDim2.new(0, v49, 0, v49 * 0.64);
        local v51 = v7:Create("ImageLabel")({
            Name = "GamepadImage", 
            Size = v50, 
            Position = UDim2.new(0.5, -v50.X.Offset / 2 + 30, 0.5, -v50.Y.Offset / 2 + 7), 
            Image = "rbxasset://textures/ui/Settings/Help/PlatformController.png", 
            BackgroundTransparency = 1, 
            ZIndex = 2, 
            Parent = v48
        });
        v48.Size = UDim2.new(v48.Size.X.Scale, v48.Size.X.Offset, 0, v51.Size.Y.Offset + 100);
        local v52 = not not v13 and v11.fontSize(Enum.FontSize.Size36) or v11.fontSize(Enum.FontSize.Size24);
        local v53 = v52 == v11.fontSize(Enum.FontSize.Size36) and v11.textSize(36) or v11.textSize(24);
        local function v65(v54, v55, v56, v57)
            local v58 = nil;
            v58 = if v16 == true then v7:Create("TextLabel")({
                Position = v55, 
                Size = v56, 
                BackgroundTransparency = 1, 
                Text = v54, 
                TextXAlignment = not not v57 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = not not v57 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v11.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v52, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v54 .. "Label", 
                ZIndex = 2, 
                Parent = v51, 
                TextScaled = true, 
                TextWrapped = true, 
                TextTruncate = if not v18 then nil else Enum.TextTruncate.AtEnd
            }) else v7:Create("TextLabel")({
                Position = v55, 
                Size = v56, 
                BackgroundTransparency = 1, 
                Text = v54, 
                TextXAlignment = not not v57 and Enum.TextXAlignment.Right or Enum.TextXAlignment.Left, 
                AnchorPoint = not not v57 and Vector2.new(1, 0.5) or Vector2.new(0, 0.5), 
                Font = v11.font(Enum.Font.SourceSansBold, "HelpGamepad"), 
                FontSize = v52, 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v54 .. "Label", 
                ZIndex = 2, 
                Parent = v51, 
                TextTruncate = if not v18 then nil else Enum.TextTruncate.AtEnd
            });
            v58.TextWrapped = true;
            local l_X_0 = l_TextService_0:GetTextSize(v54, v53, v11.font(Enum.Font.SourceSansBold, "Bold"), Vector2.new(0, 0)).X;
            local v60 = math.abs(v55.X.Offset);
            local v61 = l_RobloxGui_0 or v48;
            if v18 then
                v61 = v48;
            end;
            local function v63()
                local v62 = not not v57 and ((l_RobloxGui_0.AbsoluteSize.X / 2 + 30) - v60) - 20 or ((l_RobloxGui_0.AbsoluteSize.X / 2 - 30) - v60) - 20;
                if v18 then
                    v62 = not not v57 and (v61.AbsoluteSize.X / 2 + 30) - v60 or (v61.AbsoluteSize.X / 2 - 30) - v60;
                end;
                if v62 < l_X_0 then
                    v58.Size = UDim2.new(v58.Size.X.Scale, v62, v58.Size.Y.Scale, if not v18 then v53 else v53 * 2);
                    v58.TextScaled = not v18 and true or false;
                    return ;
                else
                    v58.Size = UDim2.new(v58.Size.X.Scale, v62, v58.Size.Y.Scale, v53 * 2);
                    v58.FontSize = v52;
                    v58.TextScaled = false;
                    return ;
                end;
            end;
            local _ = v61:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
                v63();
            end);
            v63();
        end;
        local v66 = not v18 and -390 or -v51.Size.X.Offset / 2 - 20;
        local v67 = not v18 and 330 or v51.Size.X.Offset / 2 - 20;
        local v68 = if not v18 then v67 + 50 else v67 + 40;
        v65("Switch Tool", UDim2.new(0.5, v66, 0, 15), UDim2.new(0, 100, 0, v53), true);
        v65("Game Menu Toggle", UDim2.new(0.5, v66, 0.15, 10), UDim2.new(0, 164, 0, v53), true);
        v65("Move", UDim2.new(0.5, v66, 0.31, 5), UDim2.new(0, 46, 0, v53), true);
        v65("Menu Navigation", UDim2.new(0.5, v66, 0.46, 0), UDim2.new(0, 164, 0, v53), true);
        v65("Use Tool", UDim2.new(0.5, v67, 0, 15), UDim2.new(0, 73, 0, v53));
        v65("Roblox Menu", UDim2.new(0.5, v67, 0.15, 10), UDim2.new(0, 122, 0, v53));
        v65("Back", UDim2.new(0.5, v67, 0.31, 5), UDim2.new(0, 43, 0, v53));
        v65("Jump", UDim2.new(0.5, v67, 0.46, 0), UDim2.new(0, 49, 0, v53));
        v65("Rotate Camera", UDim2.new(0.5, v68, 0.62, -10), UDim2.new(0, 132, 0, v53));
        v65("Camera Zoom", UDim2.new(0.5, v68, 0.77, -10), UDim2.new(0, 122, 0, v53));
    end;
    local function v81(v70)
        l_NewPage_0.ActiveHelpScheme = v70;
        local v71 = v7:IsPortrait();
        if l_NewPage_0.HelpPages.Touch then
            local l_Touch_0 = l_NewPage_0.HelpPageContents.Touch;
            local function _(v73)
                if v73 then
                    for v74, v75 in pairs(l_Touch_0) do
                        v75.Visible = not v73[v74];
                    end;
                end;
            end;
            local v77 = nil;
            if not (v70 ~= Enum.TouchMovementMode.DynamicThumbstick) or v70 == Enum.TouchMovementMode.Default then
                v77 = {
                    MoveImageCTM = true
                };
                l_Touch_0.MoveLabel.Position = not not v71 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.15, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.85, -l_Touch_0.MoveLabel.AbsoluteSize.y);
                l_Touch_0.JumpLabel.Position = not not v71 and UDim2.new(0.75, -l_Touch_0.JumpLabel.AbsoluteSize.x / 2, 0.75, -50) or UDim2.new(0.85, -60, 0.85, -l_Touch_0.JumpLabel.AbsoluteSize.y);
                l_Touch_0.RotateLabel.Position = not not v71 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.85, -l_Touch_0.RotateLabel.AbsoluteSize.x / 2, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = not not v71 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -100) or UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, -60);
                l_Touch_0.EquipLabel.Position = not not v71 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = not not v71 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            elseif v70 == Enum.TouchMovementMode.ClickToMove then
                v77 = {
                    MoveImageDTS = true, 
                    JumpLabel = true
                };
                l_Touch_0.MoveLabel.Position = not not v71 and UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.25, -l_Touch_0.MoveLabel.AbsoluteSize.x / 2, 0.5, 40);
                l_Touch_0.RotateLabel.Position = not not v71 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = not not v71 and UDim2.new(0.75, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.5, 0) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = not not v71 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = not not v71 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            else
                v77 = {
                    MoveImageDTS = true, 
                    MoveImageCTM = true, 
                    JumpImage = true
                };
                l_Touch_0.MoveLabel.Position = not not v71 and UDim2.new(0.06, 0, 1, -120) or UDim2.new(0.06, 0, 0.58, 0);
                l_Touch_0.JumpLabel.Position = not not v71 and UDim2.new(0.94, -l_Touch_0.JumpLabel.AbsoluteSize.x, 1, -120) or UDim2.new(0.8, 0, 0.58, 0);
                l_Touch_0.RotateLabel.Position = not not v71 and UDim2.new(1, -l_Touch_0.RotateLabel.AbsoluteSize.x - 20, 0.02, 0) or UDim2.new(0.5, -60, 0.02, 0);
                l_Touch_0.UseToolLabel.Position = not not v71 and UDim2.new(0.5, -l_Touch_0.UseToolLabel.AbsoluteSize.x / 2, 0.25, 50) or UDim2.new(0.85, -60, 0.02, 0);
                l_Touch_0.EquipLabel.Position = not not v71 and UDim2.new(0.5, -60, 0.75, 50) or UDim2.new(0.5, -60, 0.64, 0);
                l_Touch_0.ZoomLabel.Position = not not v71 and UDim2.new(0, 20, 0.02, 0) or UDim2.new(0.15, -60, 0.02, 0);
            end;
            local l_v77_0 = v77;
            if l_v77_0 then
                for v79, v80 in pairs(l_Touch_0) do
                    v80.Visible = not l_v77_0[v79];
                end;
            end;
        end;
    end;
    local function v101(v82)
        local v83 = {};
        local v84 = v7:IsSmallTouchScreen();
        local v85 = l_GuiService_0:GetScreenResolution().y - 350;
        if v84 then
            v85 = l_GuiService_0:GetScreenResolution().y - 100;
        end;
        v82.Size = UDim2.new(1, 0, 0, v85);
        local function v93(v86, v87, v88, v89)
            local v90 = v7:Create("TextLabel")({
                Position = v87, 
                Size = v88, 
                BackgroundTransparency = 1, 
                Name = v86 .. "Frame", 
                Parent = v89
            });
            local v91 = v7:Create("TextLabel")({
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                Text = v86, 
                Font = v11.font(Enum.Font.SourceSansBold, "HelpTouch"), 
                FontSize = v11.fontSize(Enum.FontSize.Size14, "HelpTouch"), 
                TextColor3 = Color3.new(1, 1, 1), 
                Name = v86 .. "Label", 
                ZIndex = 3, 
                Parent = v90, 
                TextScaled = true, 
                TextWrapped = true
            });
            if not v84 then
                v91.FontSize = v11.fontSize(Enum.FontSize.Size18, "HelpTitle");
                v91.Size = UDim2.new(v91.Size.X.Scale, v91.Size.X.Offset, v91.Size.Y.Scale, v91.Size.Y.Offset + 4);
            end;
            local _ = v7:Create("ImageLabel")({
                Name = v86 .. "BackgroundImage", 
                Size = UDim2.new(1.25, 0, 1.25, 0), 
                Position = UDim2.new(-0.125, 0, -0.065, 0), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/Settings/Radial/RadialLabel.png", 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(12, 2, 65, 21), 
                ZIndex = 2, 
                Parent = v90
            });
            Instance.new("UITextSizeConstraint", v91).MaxTextSize = v11.textSize(18, "HelpText");
            return v90;
        end;
        local function _(v94, v95, v96, v97, v98)
            return (v7:Create("ImageLabel")({
                Name = v94, 
                Size = v97, 
                Position = v96, 
                BackgroundTransparency = 1, 
                Image = v95, 
                ZIndex = 2, 
                Parent = v98
            }));
        end;
        local v100 = 30;
        if v84 then
            v100 = 0;
        end;
        v83.MoveLabel = v93("Move", UDim2.new(0.06, 0, 0.58, 0), UDim2.new(0, 77 + v100, 0, 25), v82);
        v83.MoveImageDTS = v7:Create("ImageLabel")({
            Name = "MoveImageDTS", 
            Size = UDim2.new(0, 65, 0, 48), 
            Position = UDim2.new(0.5, -32, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = v83.MoveLabel
        });
        v83.MoveImageCTM = v7:Create("ImageLabel")({
            Name = "MoveImageCTM", 
            Size = UDim2.new(0, 38, 0, 52), 
            Position = UDim2.new(0.5, -19, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = v83.MoveLabel
        });
        v83.JumpLabel = v93("Jump", UDim2.new(0.8, 0, 0.58, 0), UDim2.new(0, 77 + v100, 0, 25), v82);
        v83.JumpImage = v7:Create("ImageLabel")({
            Name = "JumpImage", 
            Size = UDim2.new(0, 38, 0, 52), 
            Position = UDim2.new(0.5, -19, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = v83.JumpLabel
        });
        v83.EquipLabel = v93("Equip/Unequip Tools", UDim2.new(0.5, -60, 0.64, 0), UDim2.new(0, 120 + v100, 0, 25), v82);
        v83.ZoomLabel = v93("Zoom In/Out", UDim2.new(0.15, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v82);
        v83.ZoomImage = v7:Create("ImageLabel")({
            Name = "ZoomImage", 
            Size = UDim2.new(0, 53, 0, 59), 
            Position = UDim2.new(0.5, -26, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/ZoomGesture.png", 
            ZIndex = 2, 
            Parent = v83.ZoomLabel
        });
        v83.RotateLabel = v93("Rotate Camera", UDim2.new(0.5, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v82);
        v83.RotateImage = v7:Create("ImageLabel")({
            Name = "RotateImage", 
            Size = UDim2.new(0, 65, 0, 48), 
            Position = UDim2.new(0.5, -32, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/RotateCameraGesture.png", 
            ZIndex = 2, 
            Parent = v83.RotateLabel
        });
        v83.UseToolLabel = v93("Use Tool", UDim2.new(0.85, -60, 0.02, 0), UDim2.new(0, 120, 0, 25), v82);
        v83.ToolImage = v7:Create("ImageLabel")({
            Name = "ToolImage", 
            Size = UDim2.new(0, 38, 0, 52), 
            Position = UDim2.new(0.5, -19, 1, 3), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Help/UseToolGesture.png", 
            ZIndex = 2, 
            Parent = v83.UseToolLabel
        });
        return v83;
    end;
    local function v105(v102)
        local v103 = nil;
        local v104 = v7:Create("Frame")({
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            Name = "HelpFrame" .. tostring(v102)
        });
        if v102 == "KeyboardMouse" then
            v47(v104);
        elseif v102 == "Gamepad" then
            v69(v104);
        elseif v102 == "Touch" then
            v103 = v101(v104);
        end;
        return v104, v103;
    end;
    local function v109(v106)
        for _, v108 in pairs(l_NewPage_0.HelpPages) do
            if v108 == v106 then
                v108.Parent = l_NewPage_0.Page;
                l_NewPage_0.Page.Size = v108.Size;
                if v13 then
                    l_NewPage_0.Page.Size = UDim2.new(v108.Size.X.Scale, v108.Size.X.Offset, v108.Size.Y.Scale, 0);
                end;
            else
                v108.Parent = nil;
            end;
        end;
        if l_UserInputService_0:GetPlatform() == Enum.Platform.XBoxOne then
            l_NewPage_0.HubRef.PageViewClipper.ClipsDescendants = false;
            l_NewPage_0.HubRef.PageView.ClipsDescendants = false;
        end;
    end;
    local function v110(v111)
        local v112 = l_NewPage_0.HelpPages[v111];
        if not v112 then
            local l_HelpPages_0 = l_NewPage_0.HelpPages;
            local l_HelpPageContents_0 = l_NewPage_0.HelpPageContents;
            local v115, v116 = v105(v111);
            l_HelpPages_0[v111] = v115;
            l_HelpPageContents_0[v111] = v116;
            v110(v111);
        else
            v109(v112);
            if v111 == "Touch" then
                local l_TouchMovementMode_0 = l_GameSettings_0.TouchMovementMode;
                if l_NewPage_0.ActiveHelpScheme ~= l_TouchMovementMode_0 then
                    v81(l_TouchMovementMode_0);
                    return ;
                end;
            end;
        end;
    end;
    local function _()
        v110(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageDisplayed = function(_)
        if not l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection = l_UserInputService_0.LastInputTypeChanged:Connect(function(v120)
                if v120 ~= Enum.UserInputType.Focus and v120 ~= Enum.UserInputType.None then
                    v21 = v120;
                    v110(l_NewPage_0:GetCurrentInputType());
                end;
            end);
        end;
        v21 = l_UserInputService_0:GetLastInputType();
        v110(l_NewPage_0:GetCurrentInputType());
    end;
    l_NewPage_0.PageHidden = function(_)
        if l_NewPage_0.LastInputTypeChangedConnection then
            l_NewPage_0.LastInputTypeChangedConnection:Disconnect();
            l_NewPage_0.LastInputTypeChangedConnection = nil;
        end;
    end;
    local function v127(v122)
        if l_NewPage_0:GetCurrentInputType() == "Touch" then
            local l_TouchMovementMode_1 = l_GameSettings_0.TouchMovementMode;
            local v124 = v7:IsSmallTouchScreen();
            local v125 = v122 or l_GuiService_0:GetScreenResolution();
            local v126 = v125.y - 350;
            if v124 then
                v126 = if not v11.UIBloxThemeEnabled then v125.y - 100 else v125.y - 120;
            end;
            l_NewPage_0.HelpPages.Touch.Size = UDim2.new(1, 0, 0, v126);
            v81(l_TouchMovementMode_1);
        end;
    end;
    l_NewPage_0.TabHeader.Name = "HelpTab";
    if not v11.UIBloxThemeEnabled then
        l_NewPage_0.TabHeader.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png";
        if not v16 then
            l_NewPage_0.TabHeader.Icon.Title.Text = "Help";
        else
            l_NewPage_0.TabHeader.Title.Text = "Help";
        end;
    else
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = "rbxasset://textures/ui/Settings/MenuBarIcons/HelpTab.png";
        local v128 = v11.Images["icons/menu/help"];
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectOffset = v128.ImageRectOffset;
        l_NewPage_0.TabHeader.TabLabel.Icon.ImageRectSize = v128.ImageRectSize;
        l_NewPage_0.TabHeader.TabLabel.Icon.Image = v128.Image;
        l_NewPage_0.TabHeader.TabLabel.Title.Text = "Help";
    end;
    l_NewPage_0.Page.Name = "Help";
    if not v17() then
        l_UserInputService_0.InputBegan:connect(function(v129)
            local l_UserInputType_0 = v129.UserInputType;
            if l_UserInputType_0 ~= Enum.UserInputType.Focus and l_UserInputType_0 ~= Enum.UserInputType.None then
                v21 = v129.UserInputType;
                v110(l_NewPage_0:GetCurrentInputType());
            end;
        end);
    end;
    v7:OnResized(l_NewPage_0, function(v131, _)
        if l_NewPage_0.HelpPages.Touch then
            v127(v131);
        end;
    end);
    return l_NewPage_0;
end)();
v12.Displayed.Event:connect(function()
    if v17() then
        v12:PageDisplayed();
    end;
    local v133 = v7:IsPortrait();
    if not (((not (v12:GetCurrentInputType() == "Touch") or not v12.HubRef.BottomButtonFrame) or v7:IsSmallTouchScreen()) or v133) then
        v12.HubRef.BottomButtonFrame.Visible = false;
    end;
    if v12.HubRef.VersionContainer then
        v12.HubRef.VersionContainer.Visible = true;
    end;
end);
v12.Hidden.Event:connect(function()
    if v17() then
        v12:PageHidden();
    end;
    v12.HubRef.PageViewClipper.ClipsDescendants = true;
    v12.HubRef.PageView.ClipsDescendants = true;
    v12.HubRef:ShowShield();
    local v134 = v7:IsPortrait();
    if not (((not (v12:GetCurrentInputType() == "Touch") or not v12.HubRef.BottomButtonFrame) or v7:IsSmallTouchScreen()) or v134) then
        v12.HubRef.BottomButtonFrame.Visible = true;
    end;
    if v12.HubRef.VersionContainer then
        v12.HubRef.VersionContainer.Visible = false;
    end;
end);
return v12;
