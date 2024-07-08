local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.Components.FacePile);
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_NetworkingSquads_0 = v2.NetworkingSquads;
local l_CentralOverlayType_0 = v2.RobloxAppEnums.CentralOverlayType;
local l_React_0 = v2.React;
local l_SetCentralOverlay_0 = v2.CentralOverlay.Actions.SetCentralOverlay;
local l_UIBlox_0 = v2.UIBlox;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_useDispatch_0 = v2.Hooks.useDispatch;
local l_useLocalization_0 = v2.Hooks.useLocalization;
local l_useSelector_0 = v2.Hooks.useSelector;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
return function(v15)
    local v16 = l_useLocalization_0({
        joinButtonText = "Feature.Squads.Action.Join"
    });
    local v17 = l_useDispatch_0();
    local v18 = l_useStyle_0();
    local v20 = l_useSelector_0((l_React_0.useCallback(function(v19)
        if not v19.Squad or not v19.Squad.Squad then
            return nil;
        else
            return v19.Squad.Squad.currentSquad;
        end;
    end, {})));
    local v21 = l_React_0.useMemo(function()
        return v20 and v20.channelId == v15.conversationId;
    end, l_dependencyArray_0(v20, v15.conversationId));
    local v24 = l_React_0.useMemo(function()
        if not v20 then
            return {};
        else
            local v22 = {};
            for v23 = 1, math.min(#v20.members, 2) do
                table.insert(v22, (tostring(v20.members[v23].userId)));
            end;
            return v22;
        end;
    end, {
        v20
    });
    return l_React_0.createElement("TextButton", {
        AutomaticSize = Enum.AutomaticSize.X, 
        Size = UDim2.fromOffset(0, 32), 
        BackgroundColor3 = if not v21 then Color3.fromRGB(208, 217, 251) else Color3.fromRGB(247, 247, 248), 
        BackgroundTransparency = not v21 and 0.92 or 0, 
        Text = "", 
        [l_React_0.Event.Activated] = l_React_0.useCallback(function()
            if v21 or not v20 then
                v15.onActivated();
                return ;
            else
                v17(l_SetCentralOverlay_0(l_CentralOverlayType_0.SquadLeavePrompt, {
                    isJoiningSquad = true, 
                    onLeave = function()
                        v17(l_NetworkingSquads_0.LeaveSquad.API({
                            squadId = v20.squadId
                        }));
                        v15.onActivated();
                    end
                }));
                return ;
            end;
        end, l_dependencyArray_0(v20, v21, v15.onActivated))
    }, {
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        UIListLayout = l_React_0.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        UIPadding = l_React_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, 4), 
            PaddingRight = UDim.new(0, 12)
        }), 
        GroupIcon = l_React_0.createElement(l_ImageSetLabel_0, {
            Size = UDim2.fromOffset(28, 28), 
            BackgroundTransparency = 1, 
            Image = l_Images_0["icons/menu/groups"], 
            ImageColor3 = if not v21 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(39, 41, 48), 
            LayoutOrder = 1
        }), 
        JoinTextLabel = if v21 then nil else l_React_0.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Size = UDim2.fromOffset(0, 0), 
            BackgroundTransparency = 1, 
            Font = v18.Font.CaptionHeader.Font, 
            LayoutOrder = 2, 
            Text = v16.joinButtonText, 
            TextColor3 = Color3.fromRGB(247, 247, 248), 
            TextSize = v18.Font.CaptionHeader.RelativeSize * v18.Font.BaseSize, 
            TextTransparency = 0, 
            TextWrapped = false
        }), 
        FacePile = if not v21 then nil else l_React_0.createElement(v1, {
            avatarSize = 24, 
            faceCount = #v24, 
            facePileWidth = UDim.new(0, (l_React_0.useMemo(function()
                return 24 * #v24 - 10 * (#v24 - 1);
            end, {
                v24
            }))), 
            layoutOrder = 2, 
            overlapOffset = 10, 
            reverse = true, 
            users = v24
        })
    });
end;
