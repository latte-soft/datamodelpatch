local v0 = UDim2.new(1.1, 0, 1.1, 0);
local v1 = UDim2.new(0.9, 0, 0.9, 0);
local l_TweenService_0 = game:GetService("TweenService");
local l_Modules_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules");
local l_AppFonts_0 = require(game:GetService("CorePackages").Workspace.Packages.Style).AppFonts;
local v5 = require(l_Modules_0.RobloxTranslator);
local v6 = require(l_Modules_0.Common.Create);
local v7 = TweenInfo.new(0.15, Enum.EasingStyle.Sine);
local v8 = TweenInfo.new(0.6, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);
local v9 = game:DefineFastFlag("LocalizeGameplayPaused", false);
local v10 = game:DefineFastFlag("NetworkPauseNotifTweenCancel", false);
local v11 = game:DefineFastFlag("NetworkPauseNoAnimation", false);
local function v13()
    local v12 = not v11 and 1 or 0;
    return v6("ImageLabel")({
        Name = "NetworkPause", 
        Image = "rbxasset://textures/ui/PurchasePrompt/LoadingBG.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(8, 8, 12, 12), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        ImageColor3 = Color3.fromRGB(122, 122, 122), 
        ImageTransparency = v12, 
        BackgroundTransparency = 1; 
        v6("UISizeConstraint")({
            MaxSize = Vector2.new(312, 251)
        }), 
        v6("UIPadding")({
            PaddingTop = UDim.new(0, 24), 
            PaddingLeft = UDim.new(0, 24), 
            PaddingRight = UDim.new(0, 24), 
            PaddingBottom = UDim.new(0, 24)
        }), 
        v6("Frame")({
            Name = "Accent", 
            BorderSizePixel = 0, 
            BackgroundColor3 = Color3.fromRGB(66, 66, 66), 
            Size = UDim2.new(1, 0, 0, 1), 
            Position = UDim2.new(0, 0, 0, 88), 
            BackgroundTransparency = v12
        }), 
        v6("Frame")({
            Name = "Upper", 
            Size = UDim2.new(1, 0, 0, 88), 
            BackgroundTransparency = 1; 
            v6("Frame")({
                Name = "IconContainer", 
                Size = UDim2.new(0, 40, 0, 37), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, 0), 
                BackgroundTransparency = 1; 
                v6("ImageLabel")({
                    Name = "Icon", 
                    BackgroundTransparency = 1, 
                    Image = "rbxasset://textures/ui/NetworkPause/no connection.png", 
                    Size = v1, 
                    Position = UDim2.new(0.5, 0, 0.88, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.88), 
                    ImageTransparency = v12
                })
            }), 
            v6("TextLabel")({
                Name = "Label", 
                Font = l_AppFonts_0.default:getBold(), 
                Text = not not v9 and v5:FormatByKey("InGame.GameplayPaused.Title") or "Gameplay Paused", 
                TextSize = 22, 
                TextWrapped = true, 
                Size = UDim2.new(1, 0, 0, 22), 
                Position = UDim2.new(0, 0, 0, 54), 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.fromRGB(255, 255, 255), 
                TextTransparency = v12
            })
        }), 
        v6("TextLabel")({
            Name = "Lower", 
            Font = l_AppFonts_0.default:getDefault(), 
            Text = not not v9 and v5:FormatByKey("InGame.GameplayPaused.Body") or "Gameplay has been paused: please wait while the game content loads.", 
            TextColor3 = Color3.fromRGB(190, 190, 190), 
            TextSize = 18, 
            TextWrapped = true, 
            Position = UDim2.new(0, 0, 0, 89), 
            Size = UDim2.new(1, 0, 1, -89), 
            BackgroundTransparency = 1, 
            TextTransparency = v12
        })
    });
end;
local v14 = {};
v14.__index = v14;
v14.new = function()
    local v15 = setmetatable({}, v14);
    local v16 = v13();
    if not v11 then
        v16:GetPropertyChangedSignal("ImageTransparency"):Connect(function()
            local l_ImageTransparency_0 = v16.ImageTransparency;
            v16.Lower.TextTransparency = l_ImageTransparency_0;
            v16.Accent.BackgroundTransparency = l_ImageTransparency_0;
            v16.Upper.Label.TextTransparency = l_ImageTransparency_0;
            v16.Upper.IconContainer.Icon.ImageTransparency = l_ImageTransparency_0;
        end);
    end;
    local v18 = l_TweenService_0:Create(v16, v7, {
        ImageTransparency = 0
    });
    local v19 = l_TweenService_0:Create(v16, v7, {
        ImageTransparency = 1
    });
    local v20 = l_TweenService_0:Create(v16.Upper.IconContainer.Icon, v8, {
        Size = v0, 
        ImageTransparency = 0.75
    });
    if not v11 then
        v18.Completed:Connect(function(v21)
            if v21 == Enum.PlaybackState.Completed then
                v16.Upper.IconContainer.Icon.ImageTransparency = 0;
                v20:Play();
            end;
        end);
    end;
    v15.__gui = v16;
    v15.__guiParent = nil;
    v15.__show = false;
    v15.__animations = {
        show = v18, 
        hide = v19, 
        pulse = v20
    };
    return v15;
end;
v14.Show = function(v22)
    v22.__gui.Upper.IconContainer.Icon.Size = v1;
    if not v11 then
        if v10 then
            v22.__animations.hide:Cancel();
        end;
        v22.__animations.show:Play();
        return ;
    else
        v22.__gui.Upper.IconContainer.Icon.ImageTransparency = 0;
        v22.__show = true;
        v22.__gui.Parent = v22.__guiParent;
        v22.__animations.pulse:Play();
        return ;
    end;
end;
v14.Hide = function(v23)
    if not v11 then
        v23.__animations.pulse:Cancel();
        if v10 then
            v23.__animations.show:Cancel();
        end;
        v23.__animations.hide:Play();
        return ;
    else
        v23.__show = false;
        v23.__gui.Parent = nil;
        v23.__animations.pulse:Cancel();
        return ;
    end;
end;
v14.SetParent = function(v24, v25)
    if not v11 then
        v24.__gui.Parent = v25;
    else
        v24.__guiParent = v25;
        if v24.__show then
            v24.__gui.Parent = v25;
            return ;
        end;
    end;
end;
return v14;
