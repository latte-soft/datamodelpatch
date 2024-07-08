local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local v1 = require(l_script_FirstAncestor_0.GlobalFlags);
local l_Flags_0 = l_script_FirstAncestor_0.Flags;
local v3 = require(l_Flags_0.getEnableChatInputBarConfigurationStyleCustomizations);
local v4 = require(l_Flags_0.getFFlagReplicateUIPaddingChildProperties);
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v6 = require(l_Parent_0.Roact);
local v7 = require(l_Parent_0.Otter);
local l_Dictionary_0 = require(l_Parent_0.llama).Dictionary;
local l_Config_0 = require(l_Parent_0.UIBlox).Config;
local v10 = require(l_script_FirstAncestor_0.Config);
local l_Helpers_0 = l_script_FirstAncestor_0.BubbleChat.Helpers;
local v12 = require(l_Helpers_0.getSpringFromSettings);
local v13 = require(l_Helpers_0.getAbsolutePaddingbyDimension);
local v14 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagFixBubbleChatTailVisible);
local v16 = v6.Component:extend("ChatBubbleDistant");
v16.defaultProps = {
    width = 32, 
    height = 16
};
local function v22(v17)
    local l_height_0 = v17.height;
    if v17.renderInsert then
        l_height_0 = math.max(l_height_0, v17.insertSize.Y);
    end;
    if not v4() or not v17.chatSettings.UIPadding then
        if v17.renderInsert then
            l_height_0 = math.max(l_height_0, v17.insertSize.Y);
        end;
        return l_height_0 + v17.chatSettings.Padding * 2;
    else
        local l_UIPadding_0 = v17.chatSettings.UIPadding;
        local v20 = v13(l_UIPadding_0.PaddingTop, l_height_0);
        local v21 = v13(l_UIPadding_0.PaddingBottom, l_height_0);
        if v17.renderInsert then
            l_height_0 = math.max(l_height_0, v17.insertSize.Y);
        end;
        return l_height_0 + (v20 + v21);
    end;
end;
v16.init = function(v23)
    v23.state = {};
    local v24, v25 = v6.createBinding(0);
    v23.width = v24;
    v23.updateWidth = v25;
    v23.widthMotor = v7.createSingleMotor(0);
    v23.widthMotor:onStep(function(v26)
        v23.updateWidth((math.round(v26)));
    end);
    v24, v25 = v6.createBinding((v22(v23.props)));
    v23.height = v24;
    v23.updateHeight = v25;
    v23.frameSize = v6.joinBindings({
        v23.width, 
        v23.height
    }):map(function(v27)
        return UDim2.fromOffset(v27[1], v27[2]);
    end);
    v24, v25 = v6.createBinding(1);
    v23.transparency = v24;
    v23.updateTransparency = v25;
    v23.transparencyMotor = v7.createSingleMotor(1);
    v23.transparencyMotor:onStep(v23.updateTransparency);
    if v3() then
        v24, v25 = v6.createBinding(1);
        v23.backgroundTransparency = v24;
        v23.updateBackgroundTransparency = v25;
        v23.backgroundTransparencyMotor = v7.createSingleMotor(1);
        v23.backgroundTransparencyMotor:onStep(v23.updateBackgroundTransparency);
    end;
    if v23.props.fadingOut then
        v23:fadeOut();
    end;
end;
v16.getDerivedStateFromProps = function(v28, v29)
    local v30 = nil;
    if not v4() or not v28.chatSettings.UIPadding then
        v30 = if not v28.renderInsert then v28.width + v28.chatSettings.Padding * 2 else (v28.width + v28.insertSize.X) + v28.chatSettings.Padding * 2;
    else
        v30 = v28.width;
        if v28.renderInsert then
            v30 = v30 + v28.insertSize.X;
        end;
        local l_UIPadding_1 = v28.chatSettings.UIPadding;
        v30 = v30 + (v13(l_UIPadding_1.PaddingLeft, v30) + v13(l_UIPadding_1.PaddingRight, v30));
    end;
    local v32 = v22(v28);
    if not (v30 == v29.fullWidth) or v32 ~= v29.fullHeight then
        return {
            fullWidth = v30, 
            fullHeight = v32
        };
    else
        return nil;
    end;
end;
v16.render = function(v33)
    local l_chatSettings_0 = v33.props.chatSettings;
    local v35 = nil;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    if not v33.props.isTextChatServiceOn then
        if v1.ConsolidateBubbleChat then
            v35 = l_chatSettings_0.BackgroundImage;
            v36 = l_chatSettings_0.BackgroundGradient;
            if not l_chatSettings_0.CornerEnabled then
                if l_chatSettings_0.CornerEnabled == false then
                    v37 = {
                        CornerRadius = UDim.new(0, 0)
                    };
                end;
            else
                v37 = {
                    CornerRadius = l_chatSettings_0.CornerRadius
                };
            end;
            v38 = not not l_chatSettings_0.Padding and {
                PaddingTop = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingRight = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingBottom = UDim.new(0, l_chatSettings_0.Padding), 
                PaddingLeft = UDim.new(0, l_chatSettings_0.Padding)
            } or nil;
        end;
    else
        v35 = l_chatSettings_0.ImageLabel;
        v36 = l_chatSettings_0.UIGradient;
        v37 = l_chatSettings_0.UICorner;
        v38 = l_chatSettings_0.UIPadding;
    end;
    local l_CornerRadius_0 = v10.DefaultBubbleChatChildrenCustomizationProperties.UICorner.CornerRadius;
    local l_UIPadding_2 = v10.DefaultBubbleChatChildrenCustomizationProperties.UIPadding;
    local v41 = not not v33.props.renderInsert and v33.props.insertSize.X or 0;
    local l_TailVisible_0 = v33.props.chatSettings.TailVisible;
    if v15 then
        l_TailVisible_0 = v33.props.chatSettings.TailVisible and v33.props.showCaret;
    end;
    local l_createElement_0 = v6.createElement;
    local v44 = "Frame";
    local v45 = {
        AnchorPoint = Vector2.new(0.5, 1), 
        Size = UDim2.fromOffset(v33.state.fullWidth, v33.state.fullHeight), 
        Position = UDim2.new(0.5, 0, 1, -8), 
        Transparency = 1
    };
    local v46 = {
        Scale = v6.createElement("UIScale", {
            Scale = 0.75
        })
    };
    local l_TailVisible_1 = v33.props.chatSettings.TailVisible;
    if l_TailVisible_1 then
        l_TailVisible_1 = l_TailVisible_0;
        if l_TailVisible_1 then
            l_TailVisible_1 = v6.createElement;
            local v48 = "ImageLabel";
            local v49 = {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 1, -1), 
                Size = UDim2.fromOffset(12, 8), 
                Image = "rbxasset://textures/ui/InGameChat/Caret.png", 
                ImageColor3 = l_chatSettings_0.BackgroundColor3, 
                ImageTransparency = not not v3() and v33.backgroundTransparency or v33.transparency
            };
            local v50 = {};
            local v51 = false;
            if v36 ~= nil then
                v51 = v6.createElement("UIGradient", v36);
            end;
            v50.Gradient = v51;
            l_TailVisible_1 = l_TailVisible_1(v48, v49, v50);
        end;
    end;
    v46.Carat = l_TailVisible_1;
    l_TailVisible_1 = v6.createElement;
    local v52 = "ImageLabel";
    local v53 = l_Dictionary_0.join(v35, {
        Size = v33.frameSize, 
        BackgroundColor3 = l_chatSettings_0.BackgroundColor3, 
        BackgroundTransparency = (not not v35 and v35.Image ~= "") and 1 or (v33.backgroundTransparency or v33.transparency), 
        BorderSizePixel = 0, 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        ClipsDescendants = true, 
        ImageTransparency = v33.backgroundTransparency or v33.transparency, 
        Image = not not v35 and v35.Image or ""
    });
    local v54 = {
        UICorner = not not v37 and v6.createElement("UICorner", {
            CornerRadius = v37.CornerRadius
        }) or v6.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        Contents = v6.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1
        }, {
            Padding = not not v38 and v6.createElement("UIPadding", v38) or v6.createElement("UIPadding", l_UIPadding_2), 
            UIListLayout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Insert = v33.props.renderInsert and v33.props.renderInsert(), 
            Ellipsis = v6.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                Text = "\226\128\166", 
                TextColor3 = l_chatSettings_0.TextColor3, 
                TextTransparency = v33.transparency, 
                Font = if not l_Config_0.enableFontNameMapping then Enum.Font.GothamBlack else Enum.Font.BuilderSansExtraBold, 
                TextScaled = not v4() and true or false, 
                TextSize = if not v4() then nil else l_chatSettings_0.TextSize, 
                Size = UDim2.new(1, -v41, 1, 0), 
                LayoutOrder = 2
            })
        })
    };
    local v55 = false;
    if v36 ~= nil then
        v55 = v6.createElement("UIGradient", v36);
    end;
    v54.Gradient = v55;
    v46.RoundedFrame = l_TailVisible_1(v52, v53, v54);
    return l_createElement_0(v44, v45, v46);
end;
v16.fadeIn = function(v56)
    local v57 = v12(v56.props.chatSettings, "transparency");
    v56.transparencyMotor:setGoal(v57(v56.props.chatSettings.Transparency));
    if v3() then
        v56.backgroundTransparencyMotor:setGoal(v57((v14.getBackgroundTransparency(v56.props.chatSettings, v56.props.clientSettings))));
    end;
    v56.widthMotor:setGoal(v12(v56.props.chatSettings, "size")(v56.state.fullWidth));
end;
v16.fadeOut = function(v58)
    v58.transparencyMotor:onComplete(function()
        if v58.props.onFadeOut then
            v58.props.onFadeOut();
        end;
    end);
    local v59 = v12(v58.props.chatSettings, "transparency");
    v58.transparencyMotor:setGoal(v59(1));
    if v3() then
        v58.backgroundTransparencyMotor:setGoal(v59(1));
    end;
end;
v16.didUpdate = function(v60, v61, v62)
    if v61.fadingOut ~= v60.props.fadingOut then
        if not v60.props.fadingOut then
            v60:fadeIn();
            return ;
        else
            v60:fadeOut();
            return ;
        end;
    else
        if v60.state.fullHeight ~= v62.fullHeight then
            v60.updateHeight(v60.state.fullHeight);
        end;
        if v60.state.fullWidth ~= v62.fullWidth then
            v60.widthMotor:setGoal(v12(v60.props.chatSettings, "size")(v60.state.fullWidth));
        end;
        return ;
    end;
end;
v16.didMount = function(v63)
    if not v63.props.fadingOut then
        local v64 = v12(v63.props.chatSettings, "size");
        local v65 = v12(v63.props.chatSettings, "transparency");
        v63.transparencyMotor:setGoal(v65(v63.props.chatSettings.Transparency));
        if v3() then
            v63.backgroundTransparencyMotor:setGoal(v65((v14.getBackgroundTransparency(v63.props.chatSettings, v63.props.clientSettings))));
        end;
        v63.widthMotor:setGoal(v64(v63.state.fullWidth));
    end;
end;
v16.willUnmount = function(v66)
    v66.transparencyMotor:destroy();
    if v3() then
        v66.backgroundTransparencyMotor:destroy();
    end;
    v66.widthMotor:destroy();
end;
return v16;
