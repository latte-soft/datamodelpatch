local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_Mock_0 = v1.Mock;
local l_t_0 = v1.t;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local v10 = require(l_script_FirstAncestor_0.Components.StyledImageSetLabel);
local v11 = require(l_script_FirstAncestor_0.User);
local v12 = require(l_script_FirstAncestor_0.Components.StyledTextLabel);
local v13 = require(l_script_FirstAncestor_0.Flags.getSocialTabUserProfileApiEnabled);
local v14 = require(l_script_FirstAncestor_0.utils.calculateTextSize);
local v15 = require(l_script_FirstAncestor_0.Flags.isSocialTabAutoSizedCarouselAndTileEnabled2);
local function _(v16)
    return not not v16 and v16:gsub("^Playing%s*", "") or "";
end;
local v18 = l_Roact_0.PureComponent:extend("UserTile");
v18.defaultProps = {
    enableDisplayNamePolicy = false, 
    height = 120, 
    layoutOrder = 0, 
    onActivated = function()
    end, 
    thumbnailSize = 96, 
    absolutePosition = 1
};
v18.validateProps = l_t_0.interface({
    enableDisplayNamePolicy = l_t_0.optional(l_t_0.boolean), 
    height = l_t_0.optional(l_t_0.number), 
    layoutOrder = l_t_0.optional(l_t_0.number), 
    onActivated = l_t_0.optional(l_t_0.union(l_t_0.callback, l_Mock_0.MagicMock.is)), 
    thumbnailSize = l_t_0.optional(l_t_0.number), 
    user = v11.validateUser, 
    absolutePosition = l_t_0.optional(l_t_0.number), 
    shouldShimmerName = l_t_0.optional(l_t_0.boolean), 
    combinedName = l_t_0.optional(l_t_0.string)
});
v18.init = function(v19)
    v19.userTileRef = l_Roact_0.createRef();
    v19.onActivated = function()
        local l_user_0 = v19.props.user;
        if not (not l_user_0 or not v19.userTileRef.current) then
            v19.props.onActivated({
                user = l_user_0, 
                positionIndex = v19.props.layoutOrder, 
                absolutePosition = v19.props.absolutePosition, 
                anchorSpaceSize = v19.userTileRef.current.AbsoluteSize, 
                anchorSpacePosition = v19.userTileRef.current.AbsolutePosition, 
                source = "SocialTab"
            });
        end;
    end;
    v19.calculateTextBounds = v14();
end;
v18.render = function(v21)
    local l_user_1 = v21.props.user;
    local v23 = (not v13() and v21.props.enableDisplayNamePolicy) and l_user_1.displayName or l_user_1.username;
    if not (not v13() or not v21.props.combinedName) then
        v23 = v21.props.combinedName;
    end;
    local v24 = l_user_1.userPresenceType ~= l_PresenceType_0.Offline;
    local l_lastLocation_0 = l_user_1.lastLocation;
    local v26 = not not l_lastLocation_0 and l_lastLocation_0:gsub("^Playing%s*", "") or "";
    if l_user_1.userPresenceType ~= l_PresenceType_0.InGame then
        l_lastLocation_0 = false;
        if not (l_user_1.userPresenceType == l_PresenceType_0.InStudio) then
            goto label0;
        end;
    end;
    l_lastLocation_0 = v26;
    ::label0::;
    return l_withStyle_0(function(v27)
        local l_CaptionHeader_0 = v27.Font.CaptionHeader;
        local v29 = l_CaptionHeader_0.RelativeSize * v27.Font.BaseSize;
        local l_CaptionSubHeader_0 = v27.Font.CaptionSubHeader;
        local v31 = v21.calculateTextBounds(v26 .. "...", l_CaptionSubHeader_0, v27.Font.BaseSize);
        local v32 = v21.calculateTextBounds(v23, l_CaptionHeader_0, v27.Font.BaseSize);
        return l_Roact_0.createElement("TextButton", {
            AutomaticSize = not not v15() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
            Size = UDim2.new(0, v21.props.thumbnailSize, 0, v21.props.height + v31.Y), 
            BackgroundTransparency = 1, 
            Text = "", 
            LayoutOrder = v21.props.layoutOrder, 
            [l_Roact_0.Ref] = v21.userTileRef, 
            [l_Roact_0.Event.Activated] = v21.onActivated
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 8)
            }), 
            Thumbnail = l_Roact_0.createElement(v10, {
                BackgroundStyle = v27.Theme.PlaceHolder, 
                Image = v21.props.user.thumbnail, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, v21.props.thumbnailSize, 0, v21.props.thumbnailSize)
            }, {
                UICorner = l_Roact_0.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            UserInfo = l_Roact_0.createElement("Frame", {
                AutomaticSize = not not v15() and Enum.AutomaticSize.Y or Enum.AutomaticSize.None, 
                Size = UDim2.new(1, 0, 0, v21.props.height - v21.props.thumbnailSize), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                Layout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 4)
                }), 
                UsernameFrame = l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v29), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    Layout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Center, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = UDim.new(0, 4)
                    }), 
                    PresenceIcon = not not v24 and l_Roact_0.createElement(v10, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Image = l_Images_0["component_assets/circle_25"], 
                        ImageStyle = v27.Theme.OnlineStatus, 
                        LayoutOrder = 1, 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        ScaleType = Enum.ScaleType.Slice, 
                        Size = UDim2.new(0, 12, 0, 12), 
                        SliceCenter = Rect.new(12, 12, 13, 13)
                    }) or nil, 
                    Username = if v21.props.shouldShimmerName then nil else l_Roact_0.createElement(v12, {
                        FontStyle = l_CaptionHeader_0, 
                        LayoutOrder = 2, 
                        Size = UDim2.new(0, math.min((v21.props.thumbnailSize - 12) - 4, v32.X), 0, v32.Y), 
                        TextStyle = v27.Theme.TextEmphasis, 
                        Text = v23, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }), 
                    ShimmerName = if not v21.props.shouldShimmerName then nil else l_Roact_0.createElement(l_ShimmerPanel_0, {
                        Size = UDim2.fromScale(0.8, 0.8), 
                        LayoutOrder = 2
                    })
                }), 
                InGameOrStudioTitle = l_Roact_0.createElement(v12, {
                    FontStyle = l_CaptionSubHeader_0, 
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, v31.Y), 
                    TextStyle = v27.Theme.TextMuted, 
                    Text = not not l_lastLocation_0 and v26 or "", 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextXAlignment = Enum.TextXAlignment.Center
                })
            })
        });
    end);
end;
return v18;
