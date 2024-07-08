local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GamepadService_0 = game:GetService("GamepadService");
local l_VRService_0 = game:GetService("VRService");
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.InGameServices.MouseIconOverrideService);
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Actions_0 = l_Parent_1.Actions;
local l_Thunks_0 = l_Parent_1.Thunks;
local l_Utility_0 = l_Parent_1.Utility;
local v13 = require(l_Parent_1.Constants);
local v14 = require(l_Utility_0.GetSegmentFromPosition);
local v15 = require(l_Parent_0.EmotesButtons);
local v16 = require(l_Parent_0.SlotNumbers);
local v17 = require(l_Parent_0.WheelBackground);
local v18 = require(l_Actions_0.FocusSegment);
local v19 = require(l_Actions_0.HideMenu);
local v20 = require(l_Thunks_0.PlayEmote);
local l_Value_0 = Enum.ContextActionPriority.High.Value;
local v22 = v5.PureComponent:extend("EmotesWheel");
local function _(v23)
    if #v23 == 0 then
        return ;
    else
        return v23[math.random(1, #v23)];
    end;
end;
v22.bindActions = function(v25)
    if not v25.actionsBound then
        l_ContextActionService_0:BindActionAtPriority(v13.EmoteSelectionAction, function(_, _, v28)
            local v29 = Vector2.new(v28.Position.X, v28.Position.Y);
            if v29.Magnitude < v13.ThumbstickThreshold then
                return ;
            else
                local v30 = v14(v29);
                if v30 == v25.props.emotesWheel.focusedSegmentIndex then
                    return ;
                elseif not v25.props.emotesPage.currentEmotes[v30] then
                    v25.props.focusSegment(0);
                    return ;
                else
                    v25.props.focusSegment(v30);
                    return ;
                end;
            end;
        end, false, l_Value_0, v13.SelectionThumbstick);
        l_ContextActionService_0:BindActionAtPriority(v13.PlaySelectedAction, function(_, v32, _)
            if v32 == Enum.UserInputState.Begin then
                local l_focusedSegmentIndex_0 = v25.props.emotesWheel.focusedSegmentIndex;
                local v35 = v25.props.emotesPage.currentEmotes[l_focusedSegmentIndex_0];
                if v35 then
                    local v36 = v25.props.emotesPage.emotesInfo[v35];
                    if v36 then
                        v25.props.playEmote(v35, l_focusedSegmentIndex_0, if #v36 == 0 then nil else v36[math.random(1, #v36)]);
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end;
        end, false, l_Value_0, v13.PlayEmoteButton);
        l_ContextActionService_0:BindActionAtPriority(v13.CloseMenuAction, function(_, v38, _)
            if v38 == Enum.UserInputState.Begin then
                v25.props.hideMenu();
            end;
        end, false, l_Value_0, unpack({
            v13.EmoteMenuCloseKey, 
            v13.EmoteMenuCloseButton, 
            v13.EmoteMenuCloseButtonSecondary
        }));
        l_ContextActionService_0:BindActionAtPriority(v13.LeaveMenuDontSinkInputAction, function(_, v41, _)
            if v41 == Enum.UserInputState.Begin then
                v25.props.hideMenu();
            end;
            return Enum.ContextActionResult.Pass;
        end, false, l_Value_0, unpack(v13.LeaveMenuNoSinkInputs));
        l_ContextActionService_0:BindActionAtPriority(v13.ActivateEmoteSlotAction, function(_, v44, v45)
            if v44 ~= Enum.UserInputState.Begin then
                return ;
            else
                local v46 = nil;
                for v47, v48 in ipairs(v13.EmoteSlotKeys) do
                    if v48 == v45.KeyCode then
                        v46 = v47;
                        break;
                    end;
                end;
                if v46 then
                    local v49 = v25.props.emotesPage.currentEmotes[v46];
                    if v49 then
                        local v50 = v25.props.emotesPage.emotesInfo[v49];
                        if v50 then
                            v25.props.playEmote(v49, v46, if #v50 == 0 then nil else v50[math.random(1, #v50)]);
                            return ;
                        else
                            return ;
                        end;
                    else
                        return ;
                    end;
                else
                    return ;
                end;
            end;
        end, false, l_Value_0, unpack(v13.EmoteSlotKeys));
        l_ContextActionService_0:BindCoreActionAtPriority(v13.VirtualCursorSinkAction, function(_, _, _)
            return Enum.ContextActionResult.Sink;
        end, false, l_Value_0, Enum.KeyCode.ButtonSelect);
        v25.actionsBound = true;
        return ;
    else
        return ;
    end;
end;
v22.unbindActions = function(v54)
    if v54.actionsBound then
        l_ContextActionService_0:UnbindAction(v13.CloseMenuAction);
        l_ContextActionService_0:UnbindAction(v13.EmoteSelectionAction);
        l_ContextActionService_0:UnbindAction(v13.PlaySelectedAction);
        l_ContextActionService_0:UnbindAction(v13.LeaveMenuDontSinkInputAction);
        l_ContextActionService_0:UnbindAction(v13.ActivateEmoteSlotAction);
        l_ContextActionService_0:UnbindCoreAction(v13.VirtualCursorSinkAction);
        v54.actionsBound = false;
    end;
end;
v22.addCursorOverride = function(v55)
    if not l_VRService_0.VREnabled then
        if not (not v55.isUsingGamepad or v55.isCursorHidden) then
            v7.push(v13.CursorOverrideName, Enum.OverrideMouseIconBehavior.ForceHide);
            l_GamepadService_0.GamepadCursorEnabled = false;
            v55.isCursorHidden = true;
        end;
        return ;
    else
        return ;
    end;
end;
v22.removeCursorOverride = function(v56)
    if v56.isCursorHidden then
        v7.pop(v13.CursorOverrideName);
        v56.isCursorHidden = false;
    end;
end;
v22.connectListeners = function(v57)
    v57.inputTypeChangedListener = l_UserInputService_0.LastInputTypeChanged:Connect(function(v58)
        if not v13.GamepadInputTypes[v58] then
            v57.isUsingGamepad = false;
            v57:removeCursorOverride();
        else
            v57.isUsingGamepad = true;
            if v57.props.displayOptions.menuVisible then
                v57:addCursorOverride();
                return ;
            end;
        end;
    end);
end;
v22.disconnectListeners = function(v59)
    v59.inputTypeChangedListener:Disconnect();
end;
v22.didUpdate = function(v60)
    if not v60.props.displayOptions.menuVisible then
        v60:unbindActions();
        v60:removeCursorOverride();
        return ;
    else
        v60:bindActions();
        v60:addCursorOverride();
        return ;
    end;
end;
v22.didMount = function(v61)
    if v61.props.displayOptions.menuVisible then
        v61:bindActions();
    end;
    v61:connectListeners();
end;
v22.willUnmount = function(v62)
    v62:unbindActions();
    v62:disconnectListeners();
end;
v22.render = function(v63)
    return v5.createElement("Frame", {
        Active = true, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = v63.props.displayOptions.menuVisible
    }, {
        MouseUnlock = v5.createElement("TextButton", {
            Modal = true, 
            Size = UDim2.new(0, 0, 0, 0), 
            Text = "", 
            Transparency = 1
        }), 
        Back = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 1
        }, {
            Background = v5.createElement(v17)
        }), 
        Front = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            ZIndex = 2
        }, {
            EmotesButtons = v5.createElement(v15), 
            SlotNumbers = v5.createElement(v16)
        })
    });
end;
return v6.connect(function(v64)
    return {
        displayOptions = v64.displayOptions, 
        emotesWheel = v64.emotesWheel, 
        emotesPage = v64.emotesPage
    };
end, function(v65)
    return {
        playEmote = function(v66, v67, v68)
            return v65(v20(v66, v67, v68));
        end, 
        focusSegment = function(v69)
            return v65(v18(v69));
        end, 
        hideMenu = function()
            return v65(v19());
        end
    };
end)(v22);
