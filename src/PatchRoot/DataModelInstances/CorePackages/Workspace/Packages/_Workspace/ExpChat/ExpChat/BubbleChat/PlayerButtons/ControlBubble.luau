local l_RunService_0 = game:GetService("RunService");
local l_TweenService_0 = game:GetService("TweenService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v4 = require(l_script_FirstAncestor_0.IXPServiceWrapper);
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.UIBlox);
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v9 = 0.6;
local v10 = Vector2.new(-1, 0);
local v11 = game:DefineFastFlag("EnableDarkerShimmerTransparency", false);
local v12 = game:DefineFastFlag("TCSConnectingMicStateFix", false);
local v13 = game:DefineFastInt("ExpChatMicActivityHeartbeatIncrement", 3);
if v11 then
    v9 = 0.4;
end;
local v14 = game:DefineFastFlag("EnableOptimizedExpChatMicUI2", false);
local v15 = game:DefineFastString("MicActivityFixIXPLayerValue", "MicActivityFixEnabled");
local v16 = require(l_script_FirstAncestor_0.Flags.GetFStringVoiceUIImprovementsIXPLayerName);
local v17 = require(l_script_FirstAncestor_0.BubbleChat.Helpers.getVoiceIndicatorAssetName);
local v18 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableShimmeringIcon);
local function v20(v19)
    return (l_TweenService_0:Create(v19:getValue(), TweenInfo.new(1, Enum.EasingStyle.Circular, Enum.EasingDirection.Out, -1), {
        Offset = Vector2.new(1, 0)
    }));
end;
local function v34(v21)
    local v22, v23 = v5.useState(0);
    local v24, v25 = v5.useState(false);
    local v26 = v5.useRef(0);
    local v27 = v5.useRef(nil);
    local v28 = v5.useRef(nil);
    if v18() then
        v27 = v5.useRef(nil);
        v28 = v5.useRef(nil);
        v5.useEffect(function()
            if v27.current then
                local l_FirstChildWhichIsA_0 = v27.current:FindFirstChildWhichIsA("UIGradient", true);
                if l_FirstChildWhichIsA_0 then
                    v28.current = l_FirstChildWhichIsA_0;
                end;
            end;
        end, {
            v27
        });
    end;
    if v14 then
        v5.useEffect(function()
            local l_status_0, l_result_0 = pcall(function()
                return v4:GetLayerData(v16());
            end);
            if not ((not l_status_0 or not l_result_0) or not l_result_0[v15]) then
                v25(true);
            end;
        end, {});
    end;
    v5.useEffect(function()
        if not (not v14 or not v21.voiceState) and v21.voiceState == "Talking" then
            v4:LogUserLayerExposure(v16());
        end;
        local v32 = nil;
        if not ((not v14 or not v24) or not v21.voiceState) and v21.voiceState == "Talking" then
            v32 = l_RunService_0.PostSimulation:Connect(function()
                v26.current = ((v26.current or 0) + 1) % v13;
                if v26.current == 0 then
                    v23(math.random());
                end;
            end);
            return function()
                if v32 then
                    v32:Disconnect();
                    v32 = nil;
                end;
            end;
        elseif not (v21.voiceState and v21.voiceState == "Talking") or not v21.renderStepName then
            if not (not (not v18() or not v21.voiceState) and v21.voiceState == "Connecting") or not v28 then
                return function()
                    if v21.renderStepName then
                        l_RunService_0:UnbindFromRenderStep(v21.renderStepName);
                    end;
                    if not (not v14 or not v32) then
                        v32:Disconnect();
                        v32 = nil;
                    end;
                end;
            else
                local v33 = v20(v28);
                v33:Play();
                return function()
                    v33:Cancel();
                    if not ((not v12 or not v28) or not v28.current) then
                        v28.current.Offset = v10;
                    end;
                end;
            end;
        else
            l_RunService_0:BindToRenderStep(v21.renderStepName, 1, function()
                v23(math.random());
            end);
            return function()
                l_RunService_0:UnbindFromRenderStep(v21.renderStepName);
            end;
        end;
    end, {
        v21.voiceState, 
        v24
    });
    return v5.createElement("ImageButton", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = v21.controlBubbleSize, 
        LayoutOrder = v21.LayoutOrder, 
        BorderSizePixel = 0, 
        Transparency = 1, 
        ZIndex = 2, 
        [v5.Event.Activated] = v21.onActivated, 
        BackgroundTransparency = 1, 
        ref = if not v18() then nil else v27
    }, {
        UICorner = v5.createElement("UICorner", {
            CornerRadius = UDim.new(0, v21.cornerRadiusOffset)
        }), 
        Contents = v5.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1
        }, {
            UICorner = v5.createElement("UICorner", {
                CornerRadius = UDim.new(0, v21.cornerRadiusOffset)
            }), 
            Icon = v5.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = v21.iconSize, 
                BackgroundTransparency = 1, 
                ImageTransparency = v21.iconTransparency, 
                BorderSizePixel = 0, 
                Image = l_Images_0[v21.iconAssetName or v17(v21.voiceState, v22, v21.iconStyle)]
            }, {
                ShimmerGradient = v18() and v5.createElement("UIGradient", {
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.new(v9, v9, v9)), 
                        ColorSequenceKeypoint.new(0.5, Color3.new(0.8, 0.8, 0.8)), 
                        ColorSequenceKeypoint.new(1, Color3.new(v9, v9, v9))
                    }), 
                    Enabled = v21.voiceState == "Connecting", 
                    Rotation = -45, 
                    Offset = v10
                })
            })
        })
    });
end;
if not v14 then
    return v34;
else
    return v5.memo(v34);
end;
