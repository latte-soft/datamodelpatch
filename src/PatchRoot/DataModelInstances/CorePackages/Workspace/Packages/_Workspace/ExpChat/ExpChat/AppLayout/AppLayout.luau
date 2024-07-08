local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Otter);
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_script_FirstAncestor_0.ChatInput);
local v5 = require(l_script_FirstAncestor_0.ChatWindow);
local v6 = require(l_script_FirstAncestor_0.Config);
local v7 = require(l_script_FirstAncestor_0.Timer);
local v8 = require(l_script_FirstAncestor_0.ClientSettings.ClientSettingsUtility);
local v9 = v3.Component:extend("AppLayout");
v9.defaultProps = {
    addTopPadding = true, 
    canLocalUserChat = false, 
    isChatInputBarVisible = true, 
    isChatWindowVisible = true, 
    LayoutOrder = 1, 
    mutedUserIds = nil, 
    onSendChat = nil, 
    textTimer = v7.new(v6.ChatWindowTextFadeOutTime), 
    timer = v7.new(v6.ChatWindowBackgroundFadeOutTime)
};
local v10 = {
    frequency = 1.25, 
    dampingRatio = 1
};
v9.init = function(v11)
    local v12, v13 = v3.createBinding(0);
    v11.transparencyValue = v12;
    v11.updateBackgroundTransparency = v13;
    v11.backgroundTransparencyMotor = v2.createSingleMotor(0);
    v11.backgroundTransparencyMotor:onStep(v11.updateBackgroundTransparency);
    v12, v13 = v3.createBinding(0);
    v11.textTransparencyValue = v12;
    v11.updateTextTransparencyValue = v13;
    v11.textTransparencyMotor = v2.createSingleMotor(0);
    v11.textTransparencyMotor:onStep(v11.updateTextTransparencyValue);
    v11.resetBackgroundTransparency = function()
        v11.backgroundTransparencyMotor:setGoal(v2.instant(0));
        v11.props.timer:stop();
        if v11.props.isTextBoxFocused == false then
            v11.props.timer:start():andThen(function()
                v11.backgroundTransparencyMotor:setGoal(v2.spring(1, v10));
            end);
        end;
    end;
    v11.resetTextTransparency = function()
        v11.textTransparencyMotor:setGoal(v2.instant(0));
        v11.props.textTimer:stop();
        if v11.props.isTextBoxFocused == false then
            v11.props.textTimer:start():andThen(function()
                v11.textTransparencyMotor:setGoal(v2.spring(1, v10));
            end);
        end;
    end;
    v11.onAbsolutePositionChanged = function(v14, v15)
        v15.AbsolutePositionWrite = v14.AbsolutePosition;
    end;
    v11.onAbsoluteSizeChanged = function(v16, v17)
        v17.AbsoluteSizeWrite = v16.AbsoluteSize;
    end;
end;
v9.didMount = function(v18)
    v18.props.timer:start():andThen(function()
        v18.backgroundTransparencyMotor:setGoal(v2.spring(1, v10));
    end);
    v18.props.textTimer:start():andThen(function()
        v18.textTransparencyMotor:setGoal(v2.spring(1, v10));
    end);
end;
v9.didUpdate = function(v19, v20, _)
    if v20.lastGeneralActivityTimestamp ~= v19.props.lastGeneralActivityTimestamp then
        v19.resetBackgroundTransparency();
        v19.resetTextTransparency();
        return ;
    else
        if v20.lastMessageActivityTimestamp ~= v19.props.lastMessageActivityTimestamp then
            v19.resetTextTransparency();
        end;
        return ;
    end;
end;
v9.render = function(v22)
    local l_chatWindowSettings_0 = v22.props.chatWindowSettings;
    local v24 = v8.getBackgroundTransparency(l_chatWindowSettings_0, v22.props.clientSettings);
    local v25 = v8.getBackgroundColor(l_chatWindowSettings_0, v22.props.clientSettings);
    return v3.createElement("Frame", {
        BackgroundColor3 = Color3.new(0, 0, 0), 
        BackgroundTransparency = 1, 
        Position = v22.props.chatLayoutAlignment.Position, 
        AnchorPoint = v22.props.chatLayoutAlignment.AnchorPoint, 
        Size = UDim2.fromScale(v6.ChatWindowSize.X.Scale * l_chatWindowSettings_0.WidthScale, v6.ChatWindowSize.Y.Scale * l_chatWindowSettings_0.HeightScale)
    }, {
        uiSizeConstraint = v3.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v6.ChatWindowMaxWidth, math.huge)
        }), 
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = v22.props.chatLayoutAlignment.UIListLayoutVerticalAlignment
        }), 
        topBorder = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/TopRoundedRect8px.png", 
            ImageColor3 = v25, 
            ImageTransparency = v22.transparencyValue:map(function(v26)
                local l_v24_0 = v24;
                return l_v24_0 + v26 * (1 - l_v24_0);
            end), 
            LayoutOrder = 1, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 8), 
            SliceCenter = Rect.new(8, 8, 24, 32), 
            Visible = v22.props.isChatWindowVisible or v22.props.isChatInputBarVisible, 
            [v3.Event.MouseEnter] = v22.props.onHovered, 
            [v3.Event.MouseLeave] = v22.props.onUnhovered
        }, {
            uiSizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v6.ChatWindowMaxWidth, math.huge)
            })
        }), 
        chatWindow = v3.createElement(v5, {
            LayoutOrder = 2, 
            size = UDim2.fromScale(1, 1), 
            transparencyValue = v22.transparencyValue, 
            textTransparency = v22.textTransparencyValue, 
            onHovered = v22.props.onHovered, 
            onUnhovered = v22.props.onUnhovered, 
            mutedUserIds = v22.props.mutedUserIds, 
            canLocalUserChat = v22.props.canLocalUserChat, 
            activateWhisperMode = v22.props.activateWhisperMode, 
            resetTargetChannel = v22.props.resetTargetChannel, 
            visible = v22.props.isChatWindowVisible, 
            onAbsoluteSizeChanged = v22.onAbsoluteSizeChanged, 
            onAbsolutePositionChanged = v22.onAbsolutePositionChanged, 
            chatWindowSettings = l_chatWindowSettings_0, 
            showTranslationButton = v22.props.showTranslationButton
        }), 
        chatInputBar = v3.createElement(v4, {
            LayoutOrder = 3, 
            addTopPadding = v22.props.isChatWindowVisible, 
            onSendChat = v22.props.onSendChat, 
            transparencyValue = v22.transparencyValue, 
            canLocalUserChat = v22.props.canLocalUserChat, 
            resetTargetChannel = v22.props.resetTargetChannel, 
            visible = v22.props.isChatInputBarVisible, 
            onAbsoluteSizeChanged = v22.onAbsoluteSizeChanged, 
            onAbsolutePositionChanged = v22.onAbsolutePositionChanged, 
            chatWindowSettings = l_chatWindowSettings_0
        }), 
        bottomBorder = v3.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/BottomRoundedRect8px.png", 
            ImageColor3 = v25, 
            ImageTransparency = v22.transparencyValue:map(function(v28)
                local l_v24_1 = v24;
                return l_v24_1 + v28 * (1 - l_v24_1);
            end), 
            LayoutOrder = 4, 
            ScaleType = Enum.ScaleType.Slice, 
            Size = UDim2.new(1, 0, 0, 8), 
            SliceCenter = Rect.new(8, 0, 24, 16), 
            Visible = v22.props.isChatWindowVisible or v22.props.isChatInputBarVisible, 
            [v3.Event.MouseEnter] = v22.props.onHovered, 
            [v3.Event.MouseLeave] = v22.props.onUnhovered
        }, {
            uiSizeConstraint = v3.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(v6.ChatWindowMaxWidth, math.huge)
            })
        })
    });
end;
v9.willUnmount = function(v30)
    v30.backgroundTransparencyMotor:destroy();
    v30.textTransparencyMotor:destroy();
end;
return v9;
