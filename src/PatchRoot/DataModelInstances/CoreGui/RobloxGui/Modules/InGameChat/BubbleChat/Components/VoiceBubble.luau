local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v8 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v10 = v2.PureComponent:extend("VoiceBubble");
v10.validateProps = v3.strictInterface({
    fadingOut = v3.optional(v3.boolean), 
    onFadeOut = v3.optional(v3.callback), 
    chatSettings = v6.IChatSettings, 
    renderInsert = v3.optional(v3.callback), 
    insertSize = v3.optional(v3.Vector2), 
    isDistant = v3.optional(v3.boolean)
});
v10.init = function(v11, v12)
    local v13, v14 = v2.createBinding(0);
    v11.width = v13;
    v11.updateWidth = v14;
    v11.widthMotor = v1.createSingleMotor(0);
    v11.widthMotor:onStep(function(v15)
        v11.updateWidth((math.round(v15)));
    end);
    v11.frameSize = v11.width:map(function(v16)
        if not v11.props.insertSize then
            return UDim2.fromOffset(v16, 0);
        else
            return UDim2.fromOffset(v16, v11.props.insertSize.Y + v11.props.chatSettings.Padding * 2);
        end;
    end);
    v13, v14 = v2.createBinding(1);
    v11.transparency = v13;
    v11.updateTransparency = v14;
    v11.transparencyMotor = v1.createSingleMotor(1);
    v11.transparencyMotor:onStep(v11.updateTransparency);
    if v12.fadingOut then
        v11:fadeOut();
    end;
end;
v10.getDerivedStateFromProps = function(v17, v18)
    local l_chatSettings_0 = v17.chatSettings;
    local v20 = 0;
    if v17.insertSize then
        v20 = v17.insertSize.X + l_chatSettings_0.Padding * 2;
    end;
    if v20 ~= v18.fullWidth then
        return {
            fullWidth = v20
        };
    else
        return nil;
    end;
end;
v10.render = function(v21)
    local l_chatSettings_1 = v21.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    local v25 = 0;
    if v21.props.insertSize then
        v25 = v21.props.insertSize.Y + l_chatSettings_1.Padding * 2;
    end;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v21.state.fullWidth, v25), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    }, {
        Scale = v2.createElement("UIScale", {
            Scale = not v21.props.isDistant and 1 or 0.75
        }), 
        Carat = l_chatSettings_1.TailVisible and v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v21.transparency
        }), 
        RoundedFrame = v2.createElement("ImageLabel", v4.Dictionary.join(l_BackgroundImage_0, {
            Size = v21.frameSize, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            BackgroundTransparency = l_BackgroundImage_0.Image == "" and v21.transparency or 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            ClipsDescendants = true, 
            ImageTransparency = v21.transparency
        }), {
            UICorner = l_chatSettings_1.CornerEnabled and v2.createElement("UICorner", {
                CornerRadius = l_chatSettings_1.CornerRadius
            }), 
            Contents = v2.createElement("Frame", {
                Size = UDim2.fromScale(1, 1), 
                BackgroundTransparency = 1
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingRight = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingBottom = UDim.new(0, l_chatSettings_1.Padding), 
                    PaddingLeft = UDim.new(0, l_chatSettings_1.Padding)
                }), 
                Insert = v21.props.renderInsert and v21.props.renderInsert()
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v2.createElement("UIGradient", l_BackgroundGradient_0)
        })
    });
end;
v10.fadeOut = function(v26)
    if not v26.isFadingOut then
        v26.isFadingOut = true;
        v26.transparencyMotor:onComplete(function()
            if v26.props.onFadeOut then
                v26.props.onFadeOut();
            end;
        end);
        v26.transparencyMotor:setGoal(v8(v26.props.chatSettings)(1));
    end;
end;
v10.didUpdate = function(v27, _, v29)
    if not v27.props.fadingOut then
        if v27.state.fullWidth ~= v29.fullWidth then
            v27.widthMotor:setGoal(v7(v27.props.chatSettings)(v27.state.fullWidth));
        end;
        return ;
    else
        v27:fadeOut();
        return ;
    end;
end;
v10.didMount = function(v30)
    if not v30.props.fadingOut then
        local l_chatSettings_2 = v30.props.chatSettings;
        local v32 = v7(l_chatSettings_2);
        v30.transparencyMotor:setGoal(v8(l_chatSettings_2)(v30.props.chatSettings.Transparency));
        v30.widthMotor:setGoal(v32(v30.state.fullWidth));
    end;
end;
v10.willUnmount = function(v33)
    v33.transparencyMotor:destroy();
    v33.widthMotor:destroy();
end;
return v10;
