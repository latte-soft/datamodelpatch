local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
return function(v9, v10)
    local v11 = {};
    local v12 = #v9;
    if not (v10 >= 1) or v12 < v10 then
        l_Utility_0.DebugLog("ImageOverlay: Invalid index to selectedThumbIndex");
        return ;
    else
        local v13 = nil;
        local l_v10_0 = v10;
        local v15 = l_Utility_0.Create("Frame")({
            Name = "Shield", 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BorderSizePixel = 0
        });
        local v16 = l_Utility_0.Create("Frame")({
            Name = "ImageOverlayContainer", 
            Size = UDim2.new(1, 0, 0, 668), 
            Position = UDim2.new(0, 0, 0, 226), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_GlobalSettings_0.OverlayColor
        });
        local v17 = l_Utility_0.Create("TextButton")({
            Name = "DummySelectionImage", 
            Size = UDim2.new(0, 0, 0, 0), 
            Visible = false
        });
        local v18 = l_Utility_0.Create("Frame")({
            Name = "imageSelection", 
            Size = UDim2.new(0, 1030, 0, 580), 
            Position = UDim2.new(0.5, -515, 0.5, -290), 
            BackgroundTransparency = 1, 
            Selectable = true, 
            SelectionImageObject = v17, 
            Parent = v16; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v19 = l_Utility_0.Create("ImageButton")({
            Name = "LeftArrowImage", 
            Size = UDim2.new(0, 26, 0, 45), 
            Position = UDim2.new(0.5, (v18.Position.X.Offset - 18) - 75, 0.5, -22.5), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Settings/Slider/Left.png", 
            SelectionImageObject = v17, 
            Parent = v16; 
            l_SoundManager_0:CreateSound("MoveSelection")
        });
        local v20 = v19:Clone();
        v20.Name = "RightArrowImage";
        v20.Position = UDim2.new(0.5, (v18.Position.X.Offset + v18.Size.X.Offset) + 75, 0.5, -22.5);
        v20.Image = "rbxasset://textures/ui/Settings/Slider/Right.png";
        v20.Parent = v16;
        local v21 = l_Utility_0.Create("TextLabel")({
            Name = "SelectedText", 
            Size = UDim2.new(), 
            Position = UDim2.new(0.5, 0, 1, -24), 
            BackgroundTransparency = 1, 
            Font = l_GlobalSettings_0.RegularFont, 
            FontSize = l_GlobalSettings_0.ButtonSize, 
            TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
            Text = "", 
            Parent = v16
        });
        local function v25()
            if not v13 then
                v13 = {};
                for v22 = 1, #v9 do
                    local v23 = l_Utility_0.Create("ImageLabel")({
                        Name = tostring(v22), 
                        Size = v18.Size, 
                        Position = v18.Position, 
                        BackgroundTransparency = 1, 
                        Parent = v16; 
                        l_SoundManager_0:CreateSound("MoveSelection")
                    });
                    local v24 = l_ThumbnailLoader_0:Create(v23, v9[v22], l_ThumbnailLoader_0.Sizes.Large, l_ThumbnailLoader_0.AssetType.Icon, false);
                    spawn(function()
                        v24:LoadAsync(true, true, {
                            ZIndex = v23.ZIndex
                        });
                    end);
                    v13[v22] = v23;
                end;
            end;
        end;
        local function v29(v26)
            for v27 = 1, #v13 do
                local v28 = v13[v27];
                v28.Position = UDim2.new(v27 == v26 and 0.5 or 1.5, -v28.Size.X.Offset / 2, 0.5, v28.Position.Y.Offset);
            end;
        end;
        local function v37(v30, v31, v32)
            if v30 == v31 then
                return ;
            else
                local v33 = v32 * 1.5;
                local v34 = -v33;
                local v35 = v13[v30];
                local v36 = v13[v31];
                v36.Position = UDim2.new(v33, -v36.Size.X.Offset / 2, 0.5, v36.Position.Y.Offset);
                l_Utility_0.SetSelectedCoreObject(v18);
                l_Utility_0.TweenPositionOrSet(v35, UDim2.new(v34, -v35.Size.X.Offset / 2, 0.5, v35.Position.Y.Offset), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true);
                l_Utility_0.TweenPositionOrSet(v36, UDim2.new(0.5, -v36.Size.X.Offset / 2, 0.5, v36.Position.Y.Offset), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.25, true);
                v21.Text = tostring(v31) .. "/" .. tostring(#v13);
                return ;
            end;
        end;
        local function _(v38)
            local v39 = nil;
            v39 = l_v10_0 + v38;
            if v39 < 1 then
                v39 = v12;
            elseif v12 < v39 then
                v39 = 1;
            end;
            if v39 then
                v37(l_v10_0, v39, v38);
                l_v10_0 = v39;
            end;
        end;
        v11.GetAnalyticsInfo = function(_)
            return {
                [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("ImageOverlayId"), 
                Selected = tostring(l_v10_0) .. "/" .. tostring(v12)
            };
        end;
        v11.GetPriority = function(_)
            return l_GlobalSettings_0.OverlayPriority;
        end;
        v11.Show = function(v43)
            v25();
            v29(l_v10_0);
            v21.Text = tostring(l_v10_0) .. "/" .. tostring(v12);
            if v12 == 1 then
                v19.Visible = false;
                v20.Visible = false;
            end;
            v15.Parent = l_ScreenManager_0:GetScreenGuiByPriority(v43:GetPriority());
            v16.Parent = v15.Parent;
            local _ = l_Utility_0.PropertyTweener(v15, "BackgroundTransparency", 1, 0.3, 0.25, l_Utility_0.EaseInOutQuad, nil);
        end;
        v11.Hide = function(_)
            local _ = l_Utility_0.PropertyTweener(v15, "BackgroundTransparency", 0.3, 1, 0.25, l_Utility_0.EaseInOutQuad, true, function()
                v15:Destroy();
            end);
            v16:Destroy();
        end;
        v11.Focus = function(_)
            l_ContextActionService_0:BindCoreAction("CloseImageOverlay", function(_, v49, _)
                if v49 == Enum.UserInputState.End then
                    l_ScreenManager_0:CloseCurrent();
                end;
            end, false, Enum.KeyCode.ButtonB);
            v19.SelectionGained:connect(function()
                local v51 = nil;
                v51 = l_v10_0 + -1;
                if v51 < 1 then
                    v51 = v12;
                elseif v12 < v51 then
                    v51 = 1;
                end;
                if v51 then
                    v37(l_v10_0, v51, -1);
                    l_v10_0 = v51;
                end;
            end);
            v20.SelectionGained:connect(function()
                local v52 = nil;
                v52 = l_v10_0 + 1;
                if v52 < 1 then
                    v52 = v12;
                elseif v12 < v52 then
                    v52 = 1;
                end;
                if v52 then
                    v37(l_v10_0, v52, 1);
                    l_v10_0 = v52;
                end;
            end);
            l_GuiService_0:AddSelectionParent("ImageOverlay", v16);
            l_Utility_0.SetSelectedCoreObject(v18);
        end;
        v11.RemoveFocus = function(_)
            l_ContextActionService_0:UnbindCoreAction("CloseImageOverlay");
            l_GuiService_0:RemoveSelectionGroup("ImageOverlay");
        end;
        return v11;
    end;
end;
