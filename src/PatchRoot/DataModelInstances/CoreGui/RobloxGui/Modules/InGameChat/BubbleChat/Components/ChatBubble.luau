local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local l_TextChatService_0 = game:GetService("TextChatService");
local v3 = require(l_CorePackages_0.Packages.Otter);
local v4 = require(l_CorePackages_0.Packages.Roact);
local v5 = require(l_CorePackages_0.Packages.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.Packages.Cryo);
local l_Parent_0 = script.Parent.Parent;
local v9 = require(l_Parent_0.Types);
local v10 = require(l_Parent_0.Helpers.getSizeSpringFromSettings);
local v11 = require(l_Parent_0.Helpers.getTransparencySpringFromSettings);
local l_CoreGui_0 = game:GetService("CoreGui");
local v13 = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.Flags.FFlagEnableRichTextForBubbleChat);
local v14 = game:DefineFastFlag("FixMockSizingLabelMemoryLeak", false);
local v15 = game:DefineFastFlag("FixMockSizingLabelMemoryLeak2", false);
local v16 = v4.PureComponent:extend("ChatBubble");
v16.validateProps = v6.strictInterface({
    messageId = v6.string, 
    fadingOut = v6.optional(v6.boolean), 
    onFadeOut = v6.optional(v6.callback), 
    isMostRecent = v6.optional(v6.boolean), 
    theme = v6.optional(v6.string), 
    renderInsert = v6.optional(v6.callback), 
    insertSize = v6.optional(v6.Vector2), 
    chatSettings = v9.IChatSettings, 
    text = v6.string, 
    timestamp = v6.number
});
v16.defaultProps = {
    theme = "Light", 
    isMostRecent = true
};
local function _()
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Enabled = false;
    l_ScreenGui_0.Name = "RichTextSizingLabel";
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.TextWrapped = true;
    l_TextLabel_0.RichText = true;
    l_TextLabel_0.Parent = l_ScreenGui_0;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    return l_TextLabel_0;
end;
v16.init = function(v20)
    local v21, v22 = v4.createBinding(0);
    v20.width = v21;
    v20.updateWidth = v22;
    v20.widthMotor = v3.createSingleMotor(0);
    v20.widthMotor:onStep(function(v23)
        v20.updateWidth((math.round(v23)));
    end);
    v21, v22 = v4.createBinding(0);
    v20.height = v21;
    v20.updateHeight = v22;
    v20.heightMotor = v3.createSingleMotor(0);
    v20.heightMotor:onStep(function(v24)
        v20.updateHeight((math.round(v24)));
    end);
    v21, v22 = v4.createBinding(1);
    v20.transparency = v21;
    v20.updateTransparency = v22;
    v20.transparencyMotor = v3.createSingleMotor(1);
    v20.transparencyMotor:onStep(v20.updateTransparency);
    v20.size = v4.joinBindings({
        v20.width, 
        v20.height
    }):map(function(v25)
        return UDim2.fromOffset(v25[1], v25[2]);
    end);
    if not v14 then
        v22 = Instance.new("ScreenGui");
        v22.Enabled = false;
        v22.Name = "RichTextSizingLabel";
        local l_TextLabel_1 = Instance.new("TextLabel");
        l_TextLabel_1.TextWrapped = true;
        l_TextLabel_1.RichText = true;
        l_TextLabel_1.Parent = v22;
        v22.Parent = l_CoreGui_0;
        v20.mockSizingLabel = l_TextLabel_1;
    else
        v20.mockSizingLabel = nil;
    end;
    v20.isRichTextEnabled = l_TextChatService_0.ChatVersion == Enum.ChatVersion.TextChatService and (v13 and true or false);
end;
v16.getBoundsFromSizingLabel = function(v27, v28, v29, v30, v31)
    if not v14 then
        v27.mockSizingLabel.Text = v28;
        v27.mockSizingLabel.TextSize = v29;
        v27.mockSizingLabel.Font = v30;
        v27.mockSizingLabel.Size = UDim2.fromOffset(v31.X, v31.Y);
        return v27.mockSizingLabel.TextBounds;
    else
        local l_ScreenGui_1 = Instance.new("ScreenGui");
        l_ScreenGui_1.Enabled = false;
        l_ScreenGui_1.Name = "RichTextSizingLabel";
        local l_TextLabel_2 = Instance.new("TextLabel");
        l_TextLabel_2.TextWrapped = true;
        l_TextLabel_2.RichText = true;
        l_TextLabel_2.Parent = l_ScreenGui_1;
        l_ScreenGui_1.Parent = l_CoreGui_0;
        local l_l_TextLabel_2_0 = l_TextLabel_2;
        l_l_TextLabel_2_0.Text = v28;
        l_l_TextLabel_2_0.TextSize = v29;
        l_l_TextLabel_2_0.Font = v30;
        l_l_TextLabel_2_0.Size = UDim2.fromOffset(v31.X, v31.Y);
        l_ScreenGui_1 = l_l_TextLabel_2_0.TextBounds;
        if not v15 then
            l_l_TextLabel_2_0:Destroy();
            return l_ScreenGui_1;
        else
            l_l_TextLabel_2_0.Parent:Destroy();
            return l_ScreenGui_1;
        end;
    end;
end;
v16.getTextBounds = function(v35)
    local l_chatSettings_0 = v35.props.chatSettings;
    local v37 = Vector2.new(l_chatSettings_0.Padding * 4, l_chatSettings_0.Padding * 2);
    local _ = Vector2.new(0, 0);
    return if not v35.isRichTextEnabled then l_TextService_0:GetTextSize(v35.props.text, l_chatSettings_0.TextSize, l_chatSettings_0.Font, Vector2.new(l_chatSettings_0.MaxWidth, 10000)) else v35:getBoundsFromSizingLabel(v35.props.text, l_chatSettings_0.TextSize, l_chatSettings_0.Font, Vector2.new(l_chatSettings_0.MaxWidth, 10000)) + v37;
end;
v16.render = function(v39)
    local l_chatSettings_1 = v39.props.chatSettings;
    local l_BackgroundImage_0 = l_chatSettings_1.BackgroundImage;
    local l_BackgroundGradient_0 = l_chatSettings_1.BackgroundGradient;
    return v4.createElement("Frame", {
        LayoutOrder = v39.props.timestamp, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v39.size, 
        Position = UDim2.fromScale(1, 0.5), 
        Transparency = 1
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, -1)
        }), 
        Frame = v4.createElement("ImageLabel", v7.Dictionary.join(l_BackgroundImage_0, {
            LayoutOrder = 1, 
            BackgroundColor3 = l_chatSettings_1.BackgroundColor3, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.fromScale(1, 1), 
            BorderSizePixel = 0, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            BackgroundTransparency = l_BackgroundImage_0.Image ~= "" and 1 or v39.transparency, 
            ClipsDescendants = true, 
            ImageTransparency = v39.transparency
        }), {
            UICorner = l_chatSettings_1.CornerEnabled and v4.createElement("UICorner", {
                CornerRadius = l_chatSettings_1.CornerRadius
            }), 
            UIListLayout = v4.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Padding = UDim.new(0, l_chatSettings_1.Padding)
            }), 
            Padding = v4.createElement("UIPadding", {
                PaddingTop = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingRight = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingBottom = UDim.new(0, l_chatSettings_1.Padding), 
                PaddingLeft = UDim.new(0, l_chatSettings_1.Padding)
            }), 
            Insert = v39.props.renderInsert and v39.props.renderInsert(), 
            Text = v4.createElement("TextLabel", {
                Text = v39.props.text, 
                Size = UDim2.new(1, -(not not v39.props.renderInsert and v39.props.insertSize.X + l_chatSettings_1.Padding or 0), 1, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Font = l_chatSettings_1.Font, 
                TextColor3 = l_chatSettings_1.TextColor3, 
                TextSize = l_chatSettings_1.TextSize, 
                TextTransparency = v39.transparency, 
                TextWrapped = true, 
                AutoLocalize = false, 
                LayoutOrder = 2, 
                RichText = v39.isRichTextEnabled
            }), 
            Gradient = l_BackgroundGradient_0.Enabled and v4.createElement("UIGradient", l_BackgroundGradient_0)
        }), 
        Carat = ((v39.props.isMostRecent and l_chatSettings_1.TailVisible) and v39.props.showCarat) and v4.createElement("ImageLabel", {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(9, 6), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_1.BackgroundColor3, 
            ImageTransparency = v39.transparency
        })
    });
end;
v16.fadeOut = function(v43)
    if not v43.isFadingOut then
        v43.isFadingOut = true;
        v43.transparencyMotor:onComplete(function()
            if v43.props.onFadeOut then
                v43.props.onFadeOut(v43.props.messageId);
            end;
        end);
        v43.transparencyMotor:setGoal(v11(v43.props.chatSettings)(1));
    end;
end;
v16.didUpdate = function(v44, v45)
    if v44.props.fadingOut then
        v44:fadeOut();
    end;
    if not ((v45.text == v44.props.text and v45.chatSettings == v44.props.chatSettings) and v45.renderInsert == v44.props.renderInsert) or v45.insertSize ~= v44.props.insertSize then
        local v46 = v44:getTextBounds();
        local v47 = v10(v44.props.chatSettings);
        local l_Padding_0 = v44.props.chatSettings.Padding;
        local l_X_0 = v46.X;
        local l_Y_0 = v46.Y;
        if v44.props.renderInsert then
            l_X_0 = l_X_0 + (v44.props.insertSize.X + l_Padding_0);
            l_Y_0 = math.max(l_Y_0, v44.props.insertSize.Y + l_Padding_0 * 2);
        end;
        v44.heightMotor:setGoal(v47(l_Y_0));
        v44.widthMotor:setGoal(v47(l_X_0));
    end;
end;
v16.didMount = function(v51)
    v51.isMounted = true;
    local v52 = v51:getTextBounds();
    local l_chatSettings_2 = v51.props.chatSettings;
    local v54 = v10(l_chatSettings_2);
    local v55 = v11(l_chatSettings_2);
    local l_X_1 = v52.X;
    local l_Y_1 = v52.Y;
    if v51.props.renderInsert then
        l_X_1 = l_X_1 + (v51.props.insertSize.X + l_chatSettings_2.Padding);
        l_Y_1 = math.max(l_Y_1, v51.props.insertSize.Y + l_chatSettings_2.Padding * 2);
    end;
    if not v51.props.isMostRecent then
        v51.heightMotor:setGoal(v54(l_Y_1));
        v51.widthMotor:setGoal(v54(l_X_1));
    else
        v51.heightMotor:setGoal(v54(l_Y_1));
        v51.widthMotor:setGoal(v3.instant(l_X_1));
    end;
    v51.transparencyMotor:setGoal(v55(l_chatSettings_2.Transparency));
end;
v16.willUnmount = function(v58)
    v58.isMounted = false;
    v58.transparencyMotor:destroy();
    v58.heightMotor:destroy();
    v58.widthMotor:destroy();
end;
return v5.connect(function(v59, v60)
    local v61 = v59.messages[v60.messageId];
    return {
        text = not not v61 and v61.text or "", 
        timestamp = not not v61 and v61.timestamp or 0
    };
end)(v16);
