local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Common.Constants);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_AppPage_0 = v2.RobloxAppEnums.AppPage;
local l_NetworkingSquads_0 = v2.NetworkingSquads;
local l_CentralOverlayType_0 = v2.RobloxAppEnums.CentralOverlayType;
local l_React_0 = v2.React;
local l_SetCentralOverlay_0 = v2.CentralOverlay.Actions.SetCentralOverlay;
local l_UIBlox_0 = v2.UIBlox;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useNavigation_0 = v2.useNavigation;
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local function v16()
    return l_React_0.createElement(l_ShimmerPanel_0, {
        Size = UDim2.fromOffset(40, 40), 
        cornerRadius = UDim.new(1, 0)
    });
end;
local function _()
    return l_React_0.createElement("UICorner", {
        CornerRadius = UDim.new(1, 0)
    });
end;
local function v20(v18, v19)
    return l_React_0.createElement("ImageButton", {
        Size = UDim2.fromOffset(40, 40), 
        BackgroundColor3 = v18.Theme.Alert.Color, 
        BackgroundTransparency = v18.Theme.Alert.Transparency, 
        LayoutOrder = 3, 
        [l_React_0.Event.Activated] = v19
    }, {
        EndCallButtonUICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        EndCallButtonIcon = l_React_0.createElement("ImageLabel", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = UDim2.fromOffset(24, 24), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/LuaApp/graphic/phone-hang-up.png"
        })
    });
end;
local function v28(v21, v22, v23)
    local v24 = {
        ActionBarFrameUICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(1, 0)
        }), 
        ActionBarFrameListLayout = l_React_0.createElement("UIListLayout", {
            Padding = UDim.new(0, 24), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder
        })
    };
    local v25 = 0;
    for v26, v27 in v23, nil, nil do
        v25 = v25 + 1;
        v24[v26] = v27;
    end;
    return l_React_0.createElement("Frame", {
        AnchorPoint = v22.anchorPoint, 
        Position = v22.position, 
        Size = UDim2.fromOffset((40 * v25 + 24 * (v25 - 1)) + 24, v1.SQUAD_LOBBY_ACTION_BAR_HEIGHT), 
        BackgroundColor3 = v21.Theme.UIMuted.Color, 
        BackgroundTransparency = v21.Theme.UIMuted.Transparency
    }, v24);
end;
local function v32(v29, v30, v31)
    return v28(v29, v30, {
        LoadingChatButton = v16(), 
        LoadingPickExperienceButton = v16(), 
        LoadingEndCallButton = v20(v29, v31)
    });
end;
local function v38(v33, v34, v35, v36, v37)
    return v28(v33, v34, {
        ChatButton = l_React_0.createElement("ImageButton", {
            Size = UDim2.fromOffset(40, 40), 
            BackgroundColor3 = v33.Theme.UIEmphasis.Color, 
            BackgroundTransparency = v33.Theme.UIEmphasis.Transparency, 
            LayoutOrder = 1, 
            [l_React_0.Event.Activated] = v35
        }, {
            ChatButtonUICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            ChatButtonIcon = l_React_0.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/chat-center.png"
            })
        }), 
        PickExperienceButton = l_React_0.createElement("ImageButton", {
            Size = UDim2.fromOffset(40, 40), 
            BackgroundColor3 = v33.Theme.UIEmphasis.Color, 
            BackgroundTransparency = v33.Theme.UIEmphasis.Transparency, 
            LayoutOrder = 2, 
            [l_React_0.Event.Activated] = v36
        }, {
            PickExperienceButtonUICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(1, 0)
            }), 
            PickExperienceButtonIcon = l_React_0.createElement("ImageLabel", {
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/rocket_icon.png"
            })
        }), 
        EndCallButton = v20(v33, v37)
    });
end;
return function(v39)
    local v40 = l_useDispatch_0();
    local v41 = l_useNavigation_0();
    local v42 = l_useStyle_0();
    local v43 = l_React_0.useCallback(function()
        v41.navigate(l_AppPage_0.Games);
    end, {
        v41
    });
    local v44 = l_React_0.useCallback(function()
        v41.pop();
    end, {
        v41
    });
    local v45 = l_React_0.useCallback(function()
        v40(l_SetCentralOverlay_0(l_CentralOverlayType_0.SquadLeavePrompt, {
            isJoiningSquad = false, 
            onLeave = function()
                v41.pop();
                v40(l_NetworkingSquads_0.LeaveSquad.API({
                    squadId = v39.squadId
                }));
            end
        }));
    end, l_dependencyArray_0(v40, v41, v39.squadId));
    return l_React_0.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v39.actionBarLoadingStatus), 
        renderOnLoaded = function()
            return v38(v42, v39, v44, v43, v45);
        end, 
        renderOnLoading = function()
            return v32(v42, v39, v45);
        end, 
        renderOnFailed = function()
            return v32(v42, v39, v45);
        end
    });
end;
