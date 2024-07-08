local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_CoreGui_0 = v1.CoreGui;
local l_Roact_0 = v1.Roact;
local l_TextService_0 = v1.TextService;
local l_UIBlox_0 = v1.UIBlox;
local l_withLocalization_0 = v1.withLocalization;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local v8 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local l_Pill_0 = l_UIBlox_0.App.Control.Pill;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_withTooltip_0 = l_UIBlox_0.App.Dialog.TooltipV2.withTooltip;
local l_TooltipOrientation_0 = l_UIBlox_0.App.Dialog.Enum.TooltipOrientation;
local v13 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v14 = require(l_script_FirstAncestor_0.Components.PillWithAlert);
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local v17 = l_Roact_0.PureComponent:extend("FilterByButton");
v17.defaultProps = {
    analytics = nil, 
    layoutOrder = 1, 
    onActivated = function()
    end, 
    filter = v13.All, 
    friendCount = 0, 
    inactiveFriendCount = 0, 
    isDisabled = false, 
    showFriendPruningAlert = false, 
    initialShowFriendPruningTooltip = false, 
    onTooltipDismissal = function()
    end
};
v17.init = function(v18)
    v18.state = {
        showFriendPruningTooltip = v18.props.initialShowFriendPruningTooltip, 
        hasDismissedFriendPruningTooltip = false
    };
    v18.convertFilterToTranslation = function(v19, v20)
        if v19 == v13.All then
            return v20.all;
        elseif v19 == v13.Online then
            return v20.online;
        elseif v19 == v13.InExperience then
            return v20.inExperience;
        elseif v19 == v13.Offline then
            return v20.offline;
        elseif v19 == v13.Inactive then
            return v20.inactive;
        else
            return nil;
        end;
    end;
    v18.buildFilterText = function(v21, v22, v23)
        local v24 = v18.convertFilterToTranslation(v21, v22);
        if v23 == 0 then
            return v24;
        else
            return v24 .. " (" .. v23 .. ")";
        end;
    end;
    v18.isSelected = function(v25)
        if v25 == v13.All then
            return false;
        else
            return true;
        end;
    end;
    v18.dismissFriendPruningTooltip = function()
        v18:setState({
            showFriendPruningTooltip = false, 
            hasDismissedFriendPruningTooltip = true
        });
        v18.props.onTooltipDismissal();
    end;
end;
v17.didMount = function(v26)
    if not (not v26.props.initialShowFriendPruningTooltip or not v26.props.analytics) then
        v26.props.analytics:impressionEvent(v8.FriendPruningTooltipSeen, {
            friendCount = tostring(v26.props.friendCount), 
            inactiveFriendCount = tostring(v26.props.inactiveFriendCount)
        });
    end;
end;
v17.didUpdate = function(v27)
    v27:setState({
        showFriendPruningTooltip = v27.props.initialShowFriendPruningTooltip and not v27.state.hasDismissedFriendPruningTooltip
    });
end;
v17.render = function(v28)
    return l_withStyle_0(function(_)
        local v30 = l_Images_0["icons/actions/filter"];
        return l_withLocalization_0({
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            tooltipHeader = "Feature.Friends.Label.ManageFriendsList", 
            tooltipBody = "Feature.Friends.Label.ManageFriendsListCaption", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline"
        })(function(v31)
            local l_filter_0 = v28.props.filter;
            local l_friendCount_0 = v28.props.friendCount;
            local l_isDisabled_0 = v28.props.isDisabled;
            local l_onActivated_0 = v28.props.onActivated;
            local v36 = v28.buildFilterText(l_filter_0, v31, l_friendCount_0);
            local v37 = {
                headerText = v31.tooltipHeader, 
                bodyText = v31.tooltipBody
            };
            local v38 = {
                preferredOrientation = l_TooltipOrientation_0.Bottom, 
                guiTarget = l_CoreGui_0, 
                active = true, 
                DisplayOrder = 2
            };
            return l_Roact_0.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 36), 
                LayoutOrder = v28.props.layoutOrder, 
                BackgroundTransparency = 1
            }, {
                Button = if not v28.state.showFriendPruningTooltip then if v28.props.showFriendPruningAlert then l_Roact_0.createElement(v14, {
                    icon = v30, 
                    text = v36, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v28.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else l_Roact_0.createElement(l_Pill_0, {
                    icon = v30, 
                    text = v36, 
                    isDisabled = l_isDisabled_0, 
                    isSelected = v28.isSelected(l_filter_0), 
                    onActivated = l_onActivated_0
                }) else l_withStyle_0(function(v39)
                    return l_withTooltip_0(v37, v38, function(v40)
                        local l_Font_0 = v39.Font;
                        return l_Roact_0.createElement("Frame", {
                            Size = UDim2.fromOffset(((l_TextService_0:GetTextSize(v36, l_Font_0.CaptionHeader.RelativeSize * l_Font_0.BaseSize, l_Font_0.CaptionHeader.Font, Vector2.new(10000, 10000)).X + 24) + 4) + l_getIconSize_0(l_IconSize_0.Small), 28), 
                            LayoutOrder = v28.props.layoutOrder, 
                            BackgroundTransparency = 1, 
                            [l_Roact_0.Change.AbsoluteSize] = v40, 
                            [l_Roact_0.Change.AbsolutePosition] = v40
                        }, {
                            PortalToCoreGui = l_Roact_0.createElement(l_Roact_0.Portal, {
                                target = l_CoreGui_0
                            }, {
                                ScreenGui = l_Roact_0.createElement("ScreenGui", {
                                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                                    DisplayOrder = 1
                                }, {
                                    DismissFriendPruningTooltipButton = l_Roact_0.createElement("TextButton", {
                                        ZIndex = 0, 
                                        BackgroundTransparency = 1, 
                                        Size = UDim2.fromScale(1, 1), 
                                        Text = "", 
                                        [l_Roact_0.Event.Activated] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.TouchSwipe] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelForward] = v28.dismissFriendPruningTooltip, 
                                        [l_Roact_0.Event.MouseWheelBackward] = v28.dismissFriendPruningTooltip
                                    })
                                })
                            }), 
                            FilterByButtonPillPossiblyWithAlert = if not v28.props.showFriendPruningAlert then l_Roact_0.createElement(l_Pill_0, {
                                icon = v30, 
                                text = v36, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v28.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            }) else l_Roact_0.createElement(v14, {
                                icon = v30, 
                                text = v36, 
                                isDisabled = l_isDisabled_0, 
                                isSelected = v28.isSelected(l_filter_0), 
                                onActivated = l_onActivated_0
                            })
                        });
                    end);
                end)
            });
        end);
    end);
end;
return v17;
