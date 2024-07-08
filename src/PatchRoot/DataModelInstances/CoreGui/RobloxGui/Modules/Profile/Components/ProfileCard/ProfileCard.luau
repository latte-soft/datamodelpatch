local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_t_0 = v1.t;
local l_withLocalization_0 = v1.withLocalization;
local v5 = require(l_Parent_0.Common.TextKeys);
local v6 = require(l_Parent_0.Components.AvatarImage);
local v7 = require(l_Parent_0.Components.ViewUserProfile);
local v8 = require(l_Parent_0.Common.ContextPropsTypes);
local v9 = require(l_Parent_0.Components.ProfileSocialCircle);
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_LoadingStateContainer_0 = l_UIBlox_0.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = l_UIBlox_0.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = l_UIBlox_0.App.Indicator.EmptyState;
local l_ExpandableTextArea_0 = l_UIBlox_0.App.Text.ExpandableTextArea;
local l_LoadingSkeleton_0 = v1.LoadingSkeleton;
local v17 = require(l_Parent_0.Components.CurrentlyWearingCarousel);
local l_FFlagInvisibleModeSetupEnabled_0 = v1.InvisibleMode.Flags.FFlagInvisibleModeSetupEnabled;
local _ = require(script.Parent.profileCardMapStateToProps);
local _ = require(script.Parent.profileCardMapDispatchToProps);
local function _(v21)
    if v21 < 600 then
        return 20;
    else
        return 40;
    end;
end;
local v23 = l_Roact_0.PureComponent:extend("ProfileCard");
v23.validateProps = l_t_0.strictInterface({
    fetchProfilePageData = l_t_0.callback, 
    profileUserId = l_t_0.string, 
    profilePageDataStatus = l_RetrievalStatus_0.fromRawValue, 
    isDeleted = l_t_0.boolean, 
    isCurrentlyWearingAnything = l_t_0.boolean, 
    description = l_t_0.string, 
    width = l_t_0.number, 
    height = l_t_0.number, 
    wideMode = l_t_0.boolean, 
    peekViewProps = l_t_0.optional(v8.validatePeekViewProps), 
    disableWebViewSupport = l_t_0.optional(l_t_0.boolean), 
    supportsWebViews = l_t_0.optional(l_t_0.boolean), 
    navigation = l_t_0.optional(l_t_0.table)
});
v23.renderOnLoading = function(v24)
    local l_props_0 = v24.props;
    local v26 = if not l_props_0.wideMode then l_props_0.width < 600 and 20 or 40 else 48;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 12), 
            PaddingLeft = UDim.new(0, v26), 
            PaddingRight = UDim.new(0, v26)
        }), 
        Skeleton = l_Roact_0.createElement(l_LoadingSkeleton_0, {
            Size = UDim2.new(1, -v26, 1, 0), 
            createLayout = function()
                return l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 15)
                });
            end, 
            panels = {
                {
                    Size = UDim2.new(0, l_props_0.width - v26 * 2, 0, l_props_0.width - v26 * 2)
                }, 
                {
                    Size = UDim2.new(1, -v26 * 2, 0, 44)
                }, 
                {
                    Size = UDim2.new(0.6, -v26 * 2, 0, 19)
                }
            }
        })
    });
end;
v23.renderOnLoaded = function(v27)
    local l_props_1 = v27.props;
    local l_profileUserId_0 = l_props_1.profileUserId;
    local l_isDeleted_0 = l_props_1.isDeleted;
    local v31 = not l_props_1.wideMode and 24 or 48;
    return l_withStyle_0(function(_)
        return l_Roact_0.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            ListLayout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            AvatarImage = l_Roact_0.createElement(v6, {
                profileUserId = l_profileUserId_0, 
                width = l_props_1.width, 
                layoutOrder = 1, 
                padding = v31, 
                navigation = l_props_1.navigation, 
                ZIndex = if not l_FFlagInvisibleModeSetupEnabled_0 then nil else 2
            }), 
            Content = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 2
            }, {
                ListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 0)
                }), 
                SocialCircleFrame = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 1
                }, {
                    ListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, v31)
                    }), 
                    PagePadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v31), 
                        PaddingRight = UDim.new(0, v31), 
                        PaddingTop = UDim.new(0, 0), 
                        PaddingBottom = UDim.new(0, v31)
                    }), 
                    SocialCircle = not l_isDeleted_0 and l_Roact_0.createElement(v9, {
                        layoutOrder = 1, 
                        profileUserId = l_profileUserId_0
                    })
                }), 
                DescriptionFrame = #l_props_1.description > 0 and l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    LayoutOrder = 2
                }, {
                    ListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 0)
                    }), 
                    PagePadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v31), 
                        PaddingRight = UDim.new(0, v31), 
                        PaddingTop = UDim.new(0, 0), 
                        PaddingBottom = UDim.new(0, v31)
                    }), 
                    Description = l_Roact_0.createElement(l_ExpandableTextArea_0, {
                        LayoutOrder = 1, 
                        Text = l_props_1.description, 
                        compactNumberOfLines = 3, 
                        padding = Vector2.new(0, 0)
                    })
                }) or nil, 
                CurrentlyWearing = (not l_isDeleted_0 and l_props_1.isCurrentlyWearingAnything) and l_Roact_0.createElement(v17, {
                    profileUserId = l_props_1.profileUserId, 
                    layoutOrder = 3
                }), 
                ViewUserProfileFrame = if not (v27.props.supportsWebViews ~= false) or l_isDeleted_0 then nil else l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 4
                }, {
                    PagePadding = l_Roact_0.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, v31), 
                        PaddingRight = UDim.new(0, v31), 
                        PaddingTop = UDim.new(0, 0), 
                        PaddingBottom = UDim.new(0, 48 + v31)
                    }), 
                    ViewUserProfile = l_Roact_0.createElement(v7)
                })
            })
        });
    end);
end;
v23.renderOnFailed = function(v33, v34)
    local l_props_2 = v33.props;
    return l_Roact_0.createElement(l_EmptyState_0, {
        position = UDim2.new(0.5, 0, 0.5, -48), 
        onActivated = function()
            l_props_2.fetchProfilePageData();
        end, 
        text = v34.failedMessage
    });
end;
v23.render = function(v36)
    local l_props_3 = v36.props;
    local l_profilePageDataStatus_0 = l_props_3.profilePageDataStatus;
    return l_Roact_0.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        ClipsDescendants = true
    }, {
        ProfileDetails = l_Roact_0.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1
        }, {
            Background = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, l_props_3.height), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }), 
            LoadingState = l_withLocalization_0({
                failedMessage = v5.NoInternet
            })(function(v39)
                return l_Roact_0.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    ZIndex = 2, 
                    BackgroundTransparency = 1
                }, {
                    LoadingStateContainer = l_Roact_0.createElement(l_LoadingStateContainer_0, {
                        dataStatus = l_RetrievalStatus_0.fromRawValue(l_profilePageDataStatus_0), 
                        renderOnFailed = function()
                            return v36:renderOnFailed(v39);
                        end, 
                        renderOnLoading = function()
                            return v36:renderOnLoading();
                        end, 
                        renderOnLoaded = function()
                            return v36:renderOnLoaded();
                        end
                    })
                });
            end)
        })
    });
end;
return v23;
