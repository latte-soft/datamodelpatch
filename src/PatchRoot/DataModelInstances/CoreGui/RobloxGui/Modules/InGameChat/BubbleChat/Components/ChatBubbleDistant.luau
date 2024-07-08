local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.Otter);
local v2 = require(l_CorePackages_0.Packages.Roact);
local v3 = require(l_CorePackages_0.Packages.t);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Types);
local v7 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v8 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local _ = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v11 = v2.PureComponent:extend("ChatBubbleDistant");
v11.validateProps = v3.strictInterface({
    width = v3.optional(v3.number), 
    height = v3.optional(v3.number), 
    fadingOut = v3.optional(v3.boolean), 
    onFadeOut = v3.optional(v3.callback), 
    chatSettings = v6.IChatSettings, 
    renderInsert = v3.optional(v3.callback), 
    insertSize = v3.optional(v3.Vector2)
});
v11.defaultProps = {
    width = 32, 
    height = 16
};
local function _(v12)
    local l_height_0 = v12.height;
    if v12.renderInsert then
        l_height_0 = math.max(l_height_0, v12.insertSize.Y);
    end;
    return l_height_0 + v12.chatSettings.Padding * 2;
end;
v11.init = function(v15, v16)
    local v17, v18 = v2.createBinding(0);
    v15.width = v17;
    v15.updateWidth = v18;
    v15.widthMotor = v1.createSingleMotor(0);
    v15.widthMotor:onStep(function(v19)
        v15.updateWidth((math.round(v19)));
    end);
    v17 = v2.createBinding;
    local l_height_1 = v16.height;
    if v16.renderInsert then
        l_height_1 = math.max(l_height_1, v16.insertSize.Y);
    end;
    v17, v18 = v17(l_height_1 + v16.chatSettings.Padding * 2);
    v15.height = v17;
    v15.updateHeight = v18;
    v15.frameSize = v2.joinBindings({
        v15.width, 
        v15.height
    }):map(function(v21)
        return UDim2.fromOffset(v21[1], v21[2]);
    end);
    v17, v18 = v2.createBinding(1);
    v15.transparency = v17;
    v15.updateTransparency = v18;
    v15.transparencyMotor = v1.createSingleMotor(1);
    v15.transparencyMotor:onStep(v15.updateTransparency);
    if v16.fadingOut then
        v15:fadeOut();
    end;
end;
v11.getDerivedStateFromProps = function(v22, v23)
    local l_chatSettings_0 = v22.chatSettings;
    local v25 = nil;
    v25 = if not v22.renderInsert then v22.width + l_chatSettings_0.Padding * 2 else (v22.width + v22.insertSize.X) + l_chatSettings_0.Padding * 2;
    local l_height_2 = v22.height;
    if v22.renderInsert then
        l_height_2 = math.max(l_height_2, v22.insertSize.Y);
    end;
    local v27 = l_height_2 + v22.chatSettings.Padding * 2;
    if not (v25 == v23.fullWidth) or v27 ~= v23.fullHeight then
        return {
            fullWidth = v25, 
            fullHeight = v27
        };
    else
        return nil;
    end;
end;
v11.render = function(v28)
    local l_chatSettings_1 = v28.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v28.state.fullWidth, v28.state.fullHeight), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    }, {
        Scale = v2.createElement("UIScale", {
            Scale = 0.75
        }), 
        Carat = l_chatSettings_1.TailVisible and v2.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 1, -1), 
            Size = UDim2.fromOffset(12, 8), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v28.transparency
        }), 
        RoundedFrame = v2.createElement("ImageLabel", v4.Dictionary.join(l_BackgroundImage_0, {
            Size = v28.frameSize, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            BackgroundTransparency = l_BackgroundImage_0.Image == "" and v28.transparency or 1, 
            BorderSizePixel = 0, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0), 
            ClipsDescendants = true, 
            ImageTransparency = v28.transparency
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
                UIListLayout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Insert = v28.props.renderInsert and v28.props.renderInsert(), 
                Ellipsis = v2.createElement("TextLabel", {
                    BackgroundTransparency = 1, 
                    Text = "\226\128\166", 
                    TextColor3 = l_chatSettings_1.TextColor3, 
                    TextTransparency = v28.transparency, 
                    Font = l_AppFonts_0.default:getBlack(), 
                    TextScaled = true, 
                    Size = UDim2.new(1, -(not not v28.props.renderInsert and v28.props.insertSize.X or 0), 1, 0), 
                    LayoutOrder = 2
                })
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v2.createElement("UIGradient", l_BackgroundGradient_0)
        })
    });
end;
v11.fadeOut = function(v32)
    if not v32.isFadingOut then
        v32.isFadingOut = true;
        v32.transparencyMotor:onComplete(function()
            if v32.props.onFadeOut then
                v32.props.onFadeOut();
            end;
        end);
        v32.transparencyMotor:setGoal(v8(v32.props.chatSettings)(1));
    end;
end;
v11.didUpdate = function(v33, _, v35)
    if not v33.props.fadingOut then
        if v33.state.fullHeight ~= v35.fullHeight then
            v33.updateHeight(v33.state.fullHeight);
        end;
        if v33.state.fullWidth ~= v35.fullWidth then
            v33.widthMotor:setGoal(v7(v33.props.chatSettings)(v33.state.fullWidth));
        end;
        return ;
    else
        v33:fadeOut();
        return ;
    end;
end;
v11.didMount = function(v36)
    if not v36.props.fadingOut then
        local l_chatSettings_2 = v36.props.chatSettings;
        local v38 = v7(l_chatSettings_2);
        v36.transparencyMotor:setGoal(v8(l_chatSettings_2)(v36.props.chatSettings.Transparency));
        v36.widthMotor:setGoal(v38(v36.state.fullWidth));
    end;
end;
v11.willUnmount = function(v39)
    v39.transparencyMotor:destroy();
    v39.widthMotor:destroy();
end;
return v11;
