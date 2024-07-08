local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v2 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v3 = require(l_Flags_0.getEnablePerBubbleCustomization);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_Parent_0.Roact);
local v6 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local v8 = require(l_script_FirstAncestor_0.Config);
local v9 = require(l_script_FirstAncestor_0.memoize);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v11 = require(l_Helpers_0.getSpringFromSettings);
local v12 = require(l_Helpers_0.getTextBounds);
local v13 = require(l_Helpers_0.getDictFromBubbleChatMessageProperties);
local v14 = require(l_script_FirstAncestor_0.GlobalFlags);
local v15 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagFixBubbleChatTailVisible);
local v17 = v5.Component:extend("ChatBubble");
v17.defaultProps = {
    isMostRecent = true, 
    text = "", 
    timestamp = 0
};
local v20 = v9(function(v18, v19)
    if not v19 then
        return v18;
    else
        return l_Dictionary_0.join(v18, v13(v19));
    end;
end);
v17.init = function(v21)
    local v22, v23 = v5.createBinding(0);
    v21.width = v22;
    v21.updateWidth = v23;
    v21.widthMotor = v6.createSingleMotor(0);
    v21.widthMotor:onStep(function(v24)
        v21.updateWidth((math.round(v24)));
    end);
    v22, v23 = v5.createBinding(0);
    v21.height = v22;
    v21.updateHeight = v23;
    v21.heightMotor = v6.createSingleMotor(0);
    v21.heightMotor:onStep(function(v25)
        v21.updateHeight((math.round(v25)));
    end);
    v22, v23 = v5.createBinding(1);
    v21.transparency = v22;
    v21.updateTransparency = v23;
    v21.transparencyMotor = v6.createSingleMotor(1);
    v21.transparencyMotor:onStep(v21.updateTransparency);
    if v2() then
        v22, v23 = v5.createBinding(1);
        v21.backgroundTransparency = v22;
        v21.updateBackgroundTransparency = v23;
        v21.backgroundTransparencyMotor = v6.createSingleMotor(1);
        v21.backgroundTransparencyMotor:onStep(v21.updateBackgroundTransparency);
    end;
    v21.size = v5.joinBindings({
        v21.width, 
        v21.height
    }):map(function(v26)
        return UDim2.fromOffset(v26[1], v26[2]);
    end);
end;
v17.render = function(v27)
    local l_chatSettings_0 = v27.props.chatSettings;
    if v3() then
        l_chatSettings_0 = v20(v27.props.chatSettings, v27.props.bubbleChatMessageProperties);
    end;
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    if not v27.props.isTextChatServiceOn then
        if v14.ConsolidateBubbleChat then
            v29 = l_chatSettings_0.BackgroundImage;
            v30 = l_chatSettings_0.BackgroundGradient;
            if not l_chatSettings_0.CornerEnabled then
                if l_chatSettings_0.CornerEnabled == false then
                    v31 = {
                        CornerRadius = UDim.new(0, 0)
                    };
                end;
            else
                v31 = {
                    CornerRadius = l_chatSettings_0.CornerRadius
                };
            end;
            v32 = not not l_chatSettings_0.Padding and {
                PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
            } or nil;
        end;
    else
        v29 = l_chatSettings_0.ImageLabel;
        v30 = l_chatSettings_0.UIGradient;
        v31 = l_chatSettings_0.UICorner;
        v32 = l_chatSettings_0.UIPadding;
        v33 = l_chatSettings_0.FontFace;
    end;
    local l_CornerRadius_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_0 = v8.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v36 = not not v27.props.renderInsert and v27.props.insertSize.X + l_chatSettings_0.Padding or 0;
    local v37 = nil;
    v37 = if not v16() then (v27.props.isMostRecent and l_chatSettings_0.TailVisible) and (not v14.AvatarChatEnabled or v27.props.showCaret) else (v27.props.isMostRecent and l_chatSettings_0.TailVisible) and v27.props.showCaret;
    local l_createElement_0 = v5.createElement;
    local v39 = "Frame";
    local v40 = {
        LayoutOrder = v27.props.timestamp, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = v27.size, 
        Position = UDim2.fromScale(1, 0.5), 
        Transparency = 1
    };
    local v41 = {
        Layout = v5.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, -1)
        })
    };
    local l_createElement_1 = v5.createElement;
    local v43 = "ImageLabel";
    local v44 = l_Dictionary_0.join(v29, {
        LayoutOrder = 1, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Size = UDim2.fromScale(1, 1), 
        BorderSizePixel = 0, 
        Position = UDim2.new(0.5, 0, 0, 0), 
        BackgroundTransparency = (not not v29 and v29.Image ~= "") and 1 or (v27.backgroundTransparency or v27.transparency), 
        ClipsDescendants = true, 
        ImageTransparency = v27.backgroundTransparency or v27.transparency
    });
    local v45 = {
        UICorner = not not v31 and v5.createElement("UICorner", {
            CornerRadius = v31.CornerRadius
        }) or v5.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        UIListLayout = v5.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Padding = UDim.new(0, l_chatSettings_0.Padding)
        }), 
        Padding = not not v32 and v5.createElement("UIPadding", v32) or v5.createElement("UIPadding", l_UIPadding_0), 
        Insert = v27.props.renderInsert and v27.props.renderInsert(), 
        Text = v5.createElement("TextLabel", {
            Text = if (not not v27.props.useTranslation and v27.props.translation) and v27.props.translation ~= "" then v27.props.translation else v27.props.text, 
            Size = UDim2.new(1, -v36, 1, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            BackgroundTransparency = 1, 
            FontFace = v33 or nil, 
            Font = if v33 then nil else l_chatSettings_0.Font, 
            TextColor3 = l_chatSettings_0.TextColor3, 
            TextSize = l_chatSettings_0.TextSize, 
            TextTransparency = v27.transparency, 
            TextWrapped = true, 
            AutoLocalize = false, 
            LayoutOrder = 2, 
            RichText = not v14.ConsolidateBubbleChat and true or v27.props.isTextChatServiceOn
        })
    };
    local v46 = false;
    if v30 ~= nil then
        v46 = v5.createElement("UIGradient", v30);
    end;
    v45.Gradient = v46;
    v41.ChatBubbleFrame = l_createElement_1(v43, v44, v45);
    if not v37 then
        l_createElement_1 = nil;
    else
        l_createElement_1 = v5.createElement;
        v43 = "ImageLabel";
        v44 = {
            LayoutOrder = 2, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromOffset(9, 6), 
            Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
            ImageColor3 = l_chatSettings_0.BackgroundColor3, 
            ImageTransparency = not not v2() and v27.backgroundTransparency or v27.transparency
        };
        v45 = {};
        v46 = false;
        if v30 ~= nil then
            v46 = v5.createElement("UIGradient", v30);
        end;
        v45.Gradient = v46;
        l_createElement_1 = l_createElement_1(v43, v44, v45);
    end;
    v41.Caret = l_createElement_1;
    return l_createElement_0(v39, v40, v41);
end;
v17.fadeOut = function(v47)
    local l_chatSettings_1 = v47.props.chatSettings;
    if v3() then
        l_chatSettings_1 = v20(v47.props.chatSettings, v47.props.bubbleChatMessageProperties);
    end;
    if not v47.isFadingOut then
        v47.isFadingOut = true;
        v47.transparencyMotor:onComplete(function()
            if v47.props.onFadeOut then
                v47.props.onFadeOut(v47.props.messageId);
            end;
        end);
        local v49 = v11(l_chatSettings_1, "transparency");
        v47.transparencyMotor:setGoal(v49(1));
        if v2() then
            v47.backgroundTransparencyMotor:setGoal(v49(1));
        end;
    end;
end;
v17.didUpdate = function(v50, v51)
    if v50.props.fadingOut then
        v50:fadeOut();
    end;
    local l_chatSettings_2 = v50.props.chatSettings;
    if v3() then
        l_chatSettings_2 = v20(v50.props.chatSettings, v50.props.bubbleChatMessageProperties);
    end;
    if not ((((v51.text == v50.props.text and v51.useTranslation == v50.props.useTranslation) and v51.translation == v50.props.translation) and v51.chatSettings == v50.props.chatSettings) and v51.renderInsert == v50.props.renderInsert) or v51.insertSize ~= v50.props.insertSize then
        local v53 = if (not not v50.props.useTranslation and v50.props.translation) and v50.props.translation ~= "" then v12(v50.props.translation, l_chatSettings_2) else v12(v50.props.text, l_chatSettings_2);
        local v54 = v11(l_chatSettings_2, "size");
        local l_Padding_0 = l_chatSettings_2.Padding;
        local l_X_0 = v53.X;
        local l_Y_0 = v53.Y;
        if v50.props.renderInsert then
            l_X_0 = l_X_0 + (v50.props.insertSize.X + l_Padding_0);
            l_Y_0 = math.max(l_Y_0, v50.props.insertSize.Y + l_Padding_0 * 2);
        end;
        v50.heightMotor:setGoal(v54(l_Y_0));
        v50.widthMotor:setGoal(v54(l_X_0));
    end;
end;
v17.didMount = function(v58)
    v58.isMounted = true;
    local l_chatSettings_3 = v58.props.chatSettings;
    if v3() then
        l_chatSettings_3 = v20(v58.props.chatSettings, v58.props.bubbleChatMessageProperties);
    end;
    local v60 = if (not not v58.props.useTranslation and v58.props.translation) and v58.props.translation ~= "" then v12(v58.props.translation, l_chatSettings_3) else v12(v58.props.text, l_chatSettings_3);
    local v61 = v11(l_chatSettings_3, "size");
    local v62 = v11(l_chatSettings_3, "transparency");
    local l_X_1 = v60.X;
    local l_Y_1 = v60.Y;
    if v58.props.renderInsert then
        l_X_1 = l_X_1 + (v58.props.insertSize.X + l_chatSettings_3.Padding);
        l_Y_1 = math.max(l_Y_1, v58.props.insertSize.Y + l_chatSettings_3.Padding * 2);
    end;
    if not v58.props.isMostRecent then
        v58.heightMotor:setGoal(v61(l_Y_1));
        v58.widthMotor:setGoal(v61(l_X_1));
    else
        v58.heightMotor:setGoal(v61(l_Y_1));
        v58.widthMotor:setGoal(v6.instant(l_X_1));
    end;
    v58.transparencyMotor:setGoal(v62(l_chatSettings_3.Transparency));
    if v2() then
        local v65 = v15.getBackgroundTransparency(l_chatSettings_3, v58.props.clientSettings);
        if v3() then
            local l_bubbleChatMessageProperties_0 = v58.props.bubbleChatMessageProperties;
            if not (not l_bubbleChatMessageProperties_0 or not l_bubbleChatMessageProperties_0.BackgroundTransparency) then
                v65 = v15.getBackgroundTransparency({
                    BackgroundTransparency = l_bubbleChatMessageProperties_0.BackgroundTransparency
                }, v58.props.clientSettings);
            end;
        end;
        v58.backgroundTransparencyMotor:setGoal(v62(v65));
    end;
end;
v17.willUnmount = function(v67)
    v67.isMounted = false;
    v67.transparencyMotor:destroy();
    if v2() then
        v67.backgroundTransparencyMotor:destroy();
    end;
    v67.heightMotor:destroy();
    v67.widthMotor:destroy();
end;
return v17;
