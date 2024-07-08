local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Otter);
local v5 = require(l_script_FirstAncestor_0.Flags.getEnableChatInputBarConfigurationStyleCustomizations);
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(script:FindFirstAncestor("BubbleChat").Helpers.getSpringFromSettings);
local v8 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v9 = v3.PureComponent:extend("BlankBubble");
v9.init = function(v10, v11)
    v10.state = {};
    local v12, v13 = v3.createBinding(0);
    v10.width = v12;
    v10.updateWidth = v13;
    v10.widthMotor = v4.createSingleMotor(0);
    v10.widthMotor:onStep(function(v14)
        v10.updateWidth((math.round(v14)));
    end);
    v10.frameSize = v10.width:map(function(v15)
        if not v10.props.insertSize then
            return UDim2.fromOffset(v15, 0);
        else
            return UDim2.fromOffset(v15, v10.props.insertSize.Y + v10.props.chatSettings.Padding * 2);
        end;
    end);
    v12, v13 = v3.createBinding(1);
    v10.transparency = v12;
    v10.updateTransparency = v13;
    v10.transparencyMotor = v4.createSingleMotor(1);
    v10.transparencyMotor:onStep(v10.updateTransparency);
    if v5() then
        v12, v13 = v3.createBinding(1);
        v10.backgroundTransparency = v12;
        v10.updateBackgroundTransparency = v13;
        v10.backgroundTransparencyMotor = v4.createSingleMotor(1);
        v10.backgroundTransparencyMotor:onStep(v10.updateBackgroundTransparency);
    end;
    if v11.fadingOut then
        v10:fadeOut();
    end;
end;
v9.getDerivedStateFromProps = function(v16, v17)
    local v18 = 0;
    if v16.insertSize then
        v18 = v16.insertSize.X + v16.chatSettings.Padding * 2;
    end;
    if v18 ~= v17.fullWidth then
        return {
            fullWidth = v18
        };
    else
        return nil;
    end;
end;
v9.render = function(v19)
    local l_chatSettings_0 = v19.props.chatSettings;
    local l_ImageLabel_0 = l_chatSettings_0.ImageLabel;
    local l_UIGradient_0 = l_chatSettings_0.UIGradient;
    local l_UICorner_0 = l_chatSettings_0.UICorner;
    local l_CornerRadius_0 = v6.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local v25 = 0;
    if v19.props.insertSize then
        v25 = v19.props.insertSize.Y + v19.props.chatSettings.Padding * 2;
    end;
    local l_createElement_0 = v3.createElement;
    local v27 = "Frame";
    local v28 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v19.state.fullWidth, v25), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v29 = {
        Scale = v3.createElement("UIScale", {
            Scale = not v19.props.isDistant and 1 or 0.75
        })
    };
    local l_TailVisible_0 = v19.props.chatSettings.TailVisible;
    if l_TailVisible_0 then
        l_TailVisible_0 = v3.createElement;
        local v31 = "ImageLabel";
        local v32 = {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = not not v5() and v19.backgroundTransparency or v19.transparency
        };
        local v33 = {};
        local v34 = false;
        if l_UIGradient_0 ~= nil then
            v34 = v3.createElement("UIGradient", l_UIGradient_0);
        end;
        v33.Gradient = v34;
        l_TailVisible_0 = l_TailVisible_0(v31, v32, v33);
    end;
    v29.Caret = l_TailVisible_0;
    l_TailVisible_0 = v3.createElement;
    local v35 = "ImageLabel";
    local v36 = l_Dictionary_0.join(l_ImageLabel_0, {
        Size = v19.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = (not not l_ImageLabel_0 and l_ImageLabel_0.Image ~= "") and 1 or (v19.backgroundTransparency or v19.transparency), 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v19.backgroundTransparency or v19.transparency, 
        Image = not not l_ImageLabel_0 and l_ImageLabel_0.Image or ""
    });
    local v37 = {
        UICorner = not not l_UICorner_0 and v3.createElement("UICorner", {
            CornerRadius = l_UICorner_0.CornerRadius
        }) or v3.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v3.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingTop = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingRight = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingBottom = UDim.new(0, v19.props.chatSettings.Padding), 
                PaddingLeft = UDim.new(0, v19.props.chatSettings.Padding)
            }), 
            Insert = v19.props.renderInsert and v19.props.renderInsert()
        })
    };
    local v38 = false;
    if l_UIGradient_0 ~= nil then
        v38 = v3.createElement("UIGradient", l_UIGradient_0);
    end;
    v37.Gradient = v38;
    v29.RoundedFrame = l_TailVisible_0(v35, v36, v37);
    return l_createElement_0(v27, v28, v29);
end;
v9.fadeIn = function(v39)
    local v40 = v7(v39.props.chatSettings, "transparency");
    v39.transparencyMotor:setGoal(v40(v39.props.chatSettings.Transparency));
    if v5() then
        v39.backgroundTransparencyMotor:setGoal(v40((v8.getBackgroundTransparency(v39.props.chatSettings, v39.props.clientSettings))));
    end;
    v39.widthMotor:setGoal(v7(v39.props.chatSettings, "size")(v39.state.fullWidth));
end;
v9.fadeOut = function(v41)
    v41.transparencyMotor:onComplete(function()
        if v41.props.onFadeOut then
            v41.props.onFadeOut();
        end;
    end);
    local v42 = v7(v41.props.chatSettings, "transparency");
    v41.transparencyMotor:setGoal(v42(1));
    if v5() then
        v41.backgroundTransparencyMotor:setGoal(v42(1));
    end;
end;
v9.didUpdate = function(v43, v44, v45)
    if v44.fadingOut ~= v43.props.fadingOut then
        if not v43.props.fadingOut then
            v43:fadeIn();
        else
            v43:fadeOut();
        end;
    end;
    if v43.state.fullWidth ~= v45.fullWidth then
        v43.widthMotor:setGoal(v7(v43.props.chatSettings, "size")(v43.state.fullWidth));
    end;
end;
v9.didMount = function(v46)
    if not v46.props.fadingOut then
        local v47 = v7(v46.props.chatSettings, "size");
        local v48 = v7(v46.props.chatSettings, "transparency");
        v46.transparencyMotor:setGoal(v48(v46.props.chatSettings.Transparency));
        if v5() then
            v46.backgroundTransparencyMotor:setGoal(v48((v8.getBackgroundTransparency(v46.props.chatSettings, v46.props.clientSettings))));
        end;
        v46.widthMotor:setGoal(v47(v46.state.fullWidth));
    end;
end;
v9.willUnmount = function(v49)
    v49.transparencyMotor:destroy();
    if v5() then
        v49.backgroundTransparencyMotor:destroy();
    end;
    v49.widthMotor:destroy();
end;
return v9;
