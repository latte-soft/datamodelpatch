local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local v4 = require(l_CorePackages_0.Packages.React);
local v5 = require(l_CorePackages_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_status_0, l_result_0 = pcall(function()
    return v5.Core.ImageSet.ImageSetLabel;
end);
local v9 = not not l_status_0 and l_result_0 or v5.Core.ImageSet.ImageSetLabel;
local v10 = require(script.Parent.Parent.Helpers.getVoiceIndicatorAssetName);
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v12 = require(l_Modules_0.Flags.getFFlagEnableShimmeringIconLegacyChatService);
local v13 = require(l_Modules_0.Flags.getFFlagLegacyConnectingMicStateFix);
local v14 = 0.6;
local v15 = Vector2.new(-1, 0);
if game:DefineFastFlag("EnableDarkerShimmerTransparencyLegacyChatService", false) then
    v14 = 0.4;
end;
local function v17(v16)
    return (l_TweenService_0:Create(v16:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), {
        Offset = Vector2.new(1, 0)
    }));
end;
return function(v18)
    local v19, v20 = v4.useState(0);
    local v21 = v4.useRef(nil);
    local v22 = v4.useRef(nil);
    if v12() then
        v21 = v4.useRef(nil);
        v22 = v4.useRef(nil);
        v4.useEffect(function()
            if v21.current then
                local l_FirstChildWhichIsA_0 = v21.current:FindFirstChildWhichIsA("UIGradient", true);
                if l_FirstChildWhichIsA_0 then
                    v22.current = l_FirstChildWhichIsA_0;
                end;
            end;
        end, {
            v21
        });
    end;
    v4.useEffect(function()
        if not (v18.voiceState and v18.voiceState == "Talking") or not v18.renderStepName then
            if not (not (not v12() or not v18.voiceState) and v18.voiceState == "Connecting") or not v22 then
                return function()
                    if v18.renderStepName then
                        l_RunService_0:UnbindFromRenderStep(v18.renderStepName);
                    end;
                end;
            else
                local v24 = v17(v22);
                v24:Play();
                return function()
                    v24:Cancel();
                    if not ((not v13() or not v22) or not v22.current) then
                        v22.current.Offset = v15;
                    end;
                end;
            end;
        else
            l_RunService_0:BindToRenderStep(v18.renderStepName, 1, function()
                v20(math.random());
            end);
            return function()
                l_RunService_0:UnbindFromRenderStep(v18.renderStepName);
            end;
        end;
    end, {
        v18.voiceState
    });
    return v4.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = v18.controlBubbleSize, 
        LayoutOrder = v18.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v4.Event.Activated] = v18.onActivated, 
        BackgroundTransparency = 1, 
        ref = v12() and v21
    }, {
        UICorner = v4.createElement("UICorner", {
            CornerRadius = UDim.new(0, v18.cornerRadiusOffset)
        }), 
        Contents = v4.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v4.createElement("UICorner", {
                CornerRadius = UDim.new(0, v18.cornerRadiusOffset)
            }), 
            Icon = v4.createElement(v9, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v18.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v18.iconTransparency, 
                BorderSizePixel = 0, 
                Image = l_Images_0[v18.iconAssetName or v10(v18.voiceState, v19, v18.iconStyle)]
            }, {
                ShimmerGradient = v12() and v4.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v14, v14, v14)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v14, v14, v14))
                    }), 
                    Enabled = v18.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v15
                })
            })
        })
    });
end;
