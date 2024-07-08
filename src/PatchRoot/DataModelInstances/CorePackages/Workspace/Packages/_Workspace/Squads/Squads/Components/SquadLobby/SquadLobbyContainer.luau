local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Common.Constants);
local v2 = require(l_script_FirstAncestor_0.Components.SquadLobbyActionBar);
local v3 = require(l_script_FirstAncestor_0.Components.SquadLobbyTopBar);
local v4 = require(l_script_FirstAncestor_0.Components.SquadLobbyUsers);
local v5 = require(l_script_FirstAncestor_0.Components.SquadUserGrid);
local v6 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingPresence_0 = v6.NetworkingPresence;
local l_NetworkingSquads_0 = v6.NetworkingSquads;
local l_React_0 = v6.React;
local l_Roact_0 = v6.Roact;
local l_UIBlox_0 = v6.UIBlox;
local l_dependencyArray_0 = v6.Hooks.dependencyArray;
local l_useDispatch_0 = v6.Hooks.useDispatch;
local l_useEffectOnce_0 = v6.Hooks.useEffectOnce;
local l_useNavigation_0 = v6.useNavigation;
local l_useSelector_0 = v6.Hooks.useSelector;
local l_RetrievalStatus_0 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_SharedFlags_0 = v6.SharedFlags;
local l_GetFFlagEnableCrossExpVoice_0 = l_SharedFlags_0.GetFFlagEnableCrossExpVoice;
local l_GetFFlagLuaAppEnableSquadNewDesign_0 = l_SharedFlags_0.GetFFlagLuaAppEnableSquadNewDesign;
local l_useCrossExperienceVoice_0 = v6.CrossExperienceVoice.Hooks.useCrossExperienceVoice;
return function()
    local v23 = l_useDispatch_0();
    local v24 = l_useStyle_0();
    local v25, v26 = l_React_0.useState(Vector2.zero);
    local v28 = l_React_0.useCallback(function(v27)
        v26(v27.AbsoluteSize);
    end, {
        v26
    });
    local v30 = l_useSelector_0((l_React_0.useCallback(function(v29)
        if (not v29.Squad or not v29.Squad.Squad) or not v29.Squad.Squad.currentSquad then
            return "";
        else
            return v29.Squad.Squad.currentSquad.squadId;
        end;
    end, {})));
    local v32 = l_useSelector_0((l_React_0.useCallback(function(v31)
        if (not v31.Squad or not v31.Squad.Squad) or not v31.Squad.Squad.currentSquad then
            return {};
        else
            return v31.Squad.Squad.currentSquad.members;
        end;
    end, {})));
    local v33 = l_useNavigation_0().getParam("conversationId");
    l_useEffectOnce_0(function()
        if v30 == "" then
            v23(l_NetworkingSquads_0.CreateOrJoinSquad.API({
                channelId = v33
            }));
        end;
    end, v33);
    l_useEffectOnce_0(function()
        local v34 = {};
        for v35, v36 in pairs(v32) do
            v34[v35] = v36.userId;
        end;
        v23(l_NetworkingPresence_0.GetPresencesFromUserIds.API(v34));
    end, #v32 > 0);
    if l_GetFFlagEnableCrossExpVoice_0() then
        l_useCrossExperienceVoice_0();
    end;
    return l_Roact_0.createFragment({
        SquadLobbyTopBar = l_React_0.useMemo(function()
            return l_React_0.createElement(v3, {
                numUsers = #v32
            });
        end, {
            v32
        }), 
        SquadLobbyUsersScrollingFrame = l_React_0.useMemo(function()
            local v37 = v1.SQUAD_LOBBY_ACTION_BAR_HEIGHT + 48;
            return l_React_0.createElement("ScrollingFrame", {
                Position = UDim2.fromOffset(0, v1.SQUAD_LOBBY_TITLE_BAR_HEIGHT), 
                Size = UDim2.new(1, 0, 1, -v1.SQUAD_LOBBY_TITLE_BAR_HEIGHT), 
                AutomaticCanvasSize = Enum.AutomaticSize.Y, 
                BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = v24.Theme.BackgroundDefault.Transparency, 
                BorderSizePixel = 0, 
                CanvasSize = UDim2.new(), 
                ScrollingDirection = Enum.ScrollingDirection.Y, 
                ScrollBarImageColor3 = v24.Theme.UIEmphasis.Color, 
                ScrollBarImageTransparency = v24.Theme.UIEmphasis.Transparency, 
                ScrollBarThickness = 4, 
                ZIndex = 0, 
                [l_React_0.Change.AbsoluteSize] = if not l_GetFFlagLuaAppEnableSquadNewDesign_0() then nil else v28
            }, {
                SquadLobbyUsers = if l_GetFFlagLuaAppEnableSquadNewDesign_0() then nil else l_React_0.createElement(v4, {
                    paddingBottom = UDim.new(0, v37), 
                    users = v32
                }), 
                SquadUserGrid = if not l_GetFFlagLuaAppEnableSquadNewDesign_0() then nil else l_React_0.createElement(v5, {
                    containerSize = v25 - Vector2.new(0, v37), 
                    paddingBottom = UDim.new(0, v37), 
                    users = v32
                })
            });
        end, l_dependencyArray_0(v25, v32, v28)), 
        SquadLobbyActionBar = l_React_0.useMemo(function()
            return l_React_0.createElement(v2, {
                actionBarLoadingStatus = l_RetrievalStatus_0.Done.rawValue(), 
                anchorPoint = Vector2.new(0.5, 1), 
                position = UDim2.new(0.5, 0, 1, -24), 
                squadId = v30
            });
        end, {
            v30
        })
    });
end;
