local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_UIBlox_0 = v1.UIBlox;
local l_Roact_0 = v1.Roact;
local l_memoize_0 = v1.memoize;
local l_TextService_0 = v1.TextService;
local l_withLocalization_0 = v1.withLocalization;
local l_PartialPageModal_0 = l_UIBlox_0.App.Dialog.Modal.PartialPageModal;
local l_SmallRadioButtonGroup_0 = l_UIBlox_0.App.Cell.Small.SelectionGroup.SmallRadioButtonGroup;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Badge_0 = l_UIBlox_0.App.Indicator.Badge;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_compose_0 = v1.SocialLibraries.RoduxTools.compose;
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v14 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ButtonClickEvents);
local v15 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local v16 = require(l_script_FirstAncestor_0.FriendsLandingContext);
local v17 = require(l_script_FirstAncestor_0.Friends.makeFilterButtons);
local v18 = require(l_script_FirstAncestor_0.Friends.filterStates);
local v19 = require(script.navigationParamKeys);
local v20 = l_Roact_0.PureComponent:extend("FriendsLandingFilter");
v20.defaultProps = {
    analytics = nil, 
    navigation = nil
};
v20.init = function(v21)
    v21.state = {
        selectedValue = v21.props.filter
    };
    v21.onClose = function()
        v21.props.navigation.goBack();
    end;
    v21.onApply = l_memoize_0(function(v22)
        return function()
            v21.props.analytics:buttonClick(v14.FriendFilterApply, {
                filter = v21.state.selectedValue
            });
            v22(v21.state.selectedValue);
            v21.onClose();
            if v21.state.selectedValue == v18.Inactive then
                v21.onFewestInteractionsSelection()();
            end;
        end;
    end);
    v21.setSelectedValue = function(v23)
        v21:setState({
            selectedValue = v23
        });
    end;
    v21.onCurrentSelected = function(v24)
        return v24 == v21.state.selectedValue;
    end;
    v21.getAlertPlacement = function(v25, v26, v27, v28)
        local v29 = 0;
        local v30 = "";
        for v31, v32 in ipairs(v26) do
            if v32.id == v25 then
                v29 = v31;
                v30 = v32.text;
                break;
            end;
        end;
        assert(v29 ~= 0, "getAlertPlacement expects alertFilterId to have an entry in filterButtons");
        return UDim2.fromOffset((24 + l_TextService_0:GetTextSize(v30, v28.Header2.RelativeSize * v28.BaseSize, v28.Header2.Font, Vector2.new(10000, 10000)).X) + 12, (v29 - 1) * 57 + math.floor(28 - v27 / 2));
    end;
    v21.showFriendPruningAlert = function()
        if not v21.props.navigation.getParam then
            return nil;
        else
            return (v21.props.navigation.getParam(v19.ShowFriendPruningAlert));
        end;
    end;
    v21.showInactiveFilterOption = function()
        if not v21.props.navigation.getParam then
            return nil;
        else
            return (v21.props.navigation.getParam(v19.ShowInactiveFilterOption));
        end;
    end;
    v21.onFewestInteractionsSelection = function()
        if not v21.props.navigation.getParam then
            return nil;
        else
            return (v21.props.navigation.getParam(v19.OnFewestInteractionsSelection));
        end;
    end;
end;
v20.didMount = function(v33)
    if not (not v33.showInactiveFilterOption() or not v33.showFriendPruningAlert()) then
        v33.props.analytics:impressionEvent(v15.FriendPruningNewBadgeSeen, {
            friendCount = tostring(if not not v33.props.navigation and v33.props.navigation.getParam then v33.props.navigation.getParam(v19.FriendCount) else 0), 
            inactiveFriendCount = tostring(if not not v33.props.navigation and v33.props.navigation.getParam then v33.props.navigation.getParam(v19.InactiveFriendCount) else 0)
        });
    end;
end;
v20.render = function(v34)
    return l_withStyle_0(function(v35)
        return l_withLocalization_0({
            apply = "CommonUI.Messages.Action.Apply", 
            all = "Feature.Friends.Label.All", 
            inactive = "Feature.Friends.Label.FewestInteractions", 
            inExperience = "Feature.Friends.Label.InGame", 
            online = "Common.Presence.Label.Online", 
            offline = "Common.Presence.Label.Offline", 
            filterBy = "Feature.Friends.Heading.FilterBy", 
            upsellNew = "Feature.Catalog.Label.New"
        })(function(v36)
            local v37 = v17(v36, v34.showInactiveFilterOption());
            return l_Roact_0.createElement(l_PartialPageModal_0, {
                title = v36.filterBy, 
                screenSize = v34.props.screenSize, 
                onCloseClicked = v34.onClose, 
                marginSize = 0, 
                buttonStackProps = {
                    buttons = {
                        {
                            buttonType = l_ButtonType_0.PrimarySystem, 
                            props = {
                                isDisabled = v34.onCurrentSelected(v34.props.filter), 
                                onActivated = v34.onApply(v34.props.setFilterKeys), 
                                text = v36.apply
                            }
                        }
                    }
                }
            }, {
                ButtonContainer = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 58 * #v37 + 20), 
                    BackgroundTransparency = 1
                }, {
                    RadioButtons = l_Roact_0.createElement(l_SmallRadioButtonGroup_0, {
                        onActivated = v34.setSelectedValue, 
                        selectedValue = v34.state.selectedValue, 
                        items = v37
                    }), 
                    InactiveFriendsAlert = if not v34.showFriendPruningAlert() then nil else l_Roact_0.createElement(l_Badge_0, {
                        position = v34.getAlertPlacement(v18.Inactive, v37, 24, v35.Font), 
                        value = v36.upsellNew
                    })
                })
            });
        end);
    end);
end;
return l_compose_0(v13.connect(function(v38)
    return {
        analytics = v38
    };
end), v16.connect(function(v39, _)
    return {
        filter = v39.filter, 
        screenSize = v39.screenSize, 
        setFilterKeys = v39.setFilterKeys
    };
end))(v20);
