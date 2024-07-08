local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local v2 = require(l_script_FirstAncestor_0.Common.Constants);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_Button_0 = l_UIBlox_0.App.Button.Button;
local l_ButtonType_0 = l_UIBlox_0.App.Button.Enum.ButtonType;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_withStyle_0 = l_UIBlox_0.Style.withStyle;
local l_LoadableImage_0 = l_UIBlox_0.App.Loading.LoadableImage;
local v11 = l_Roact_0.PureComponent:extend("ContactsListEntry");
local v12 = require(l_script_FirstAncestor_0.Flags.getFFlagContactsListEntryUpdatedTruncationFix);
local v13 = require(l_script_FirstAncestor_0.Flags.FFlagContactImporterUIRefactor);
v11.defaultProps = {
    contextualInfo = "", 
    contactName = "", 
    hasDivider = false
};
v11.init = function(v14)
    v14:setState({
        clicked = false, 
        contactNameOffset = 0
    });
    v14.addButtonSizeChanged = function(v15)
        v14:setState({
            contactNameOffset = 0 - (v15.AbsoluteSize.X + 10)
        });
    end;
    v14.requestContactFriendship = function()
        local l_props_0 = v14.props;
        l_props_0.requestFriendship(l_props_0.contactId);
    end;
    v14.openProfilePeekView = function()
        local l_props_1 = v14.props;
        v14.props.openProfilePeekView(l_props_1.contactId, {
            profileType = v2.CONTACTS_PROFILE_TYPE, 
            contactProps = {
                contactId = l_props_1.contactId, 
                contactName = l_props_1.contactName, 
                avatarImageUrl = l_props_1.avatarThumbnailUrl
            }
        });
    end;
end;
v11.render = function(v18)
    local l_props_2 = v18.props;
    local v20 = not l_props_2.hasSentRequest;
    local v21;
    if not (not v13 or not v18.props.showNewUI) then
        v21 = true;
        if not (l_props_2.headshotThumbnailUrl == nil) then
            goto label0;
        end;
    end;
    v21 = false;
    ::label0::;
    local v22 = not not v13 and (v18.props.showNewUI or false);
    return l_withStyle_0(function(v23)
        return l_Roact_0.createElement("Frame", {
            Name = l_props_2.deviceContactId, 
            Size = UDim2.new(1, 0, 0, 72), 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v18.props.layoutOrder
        }, {
            entryContent = l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1
            }, {
                layout = l_Roact_0.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    Padding = UDim.new(0, 1)
                }), 
                headshotThumbnailContainer = if not v21 then nil else l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 64, 0, 64), 
                    LayoutOrder = 1, 
                    BackgroundTransparency = 1
                }, {
                    l_Roact_0.createElement("ImageButton", {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundTransparency = 1, 
                        [l_Roact_0.Event.Activated] = v18.openProfilePeekView
                    }, {
                        headshotThumbnailImage = l_Roact_0.createElement(l_LoadableImage_0, {
                            Size = UDim2.new(0, 64, 0, 64), 
                            Image = l_props_2.headshotThumbnailUrl, 
                            onLoaded = function()
                            end, 
                            BackgroundTransparency = 1, 
                            useShimmerAnimationWhileLoading = true, 
                            showFailedStateWhenLoadingFailed = true
                        })
                    })
                }), 
                headshotPadding = if not v21 then nil else l_Roact_0.createElement("Frame", {
                    Size = UDim2.new(0, 12, 1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }), 
                middleTextGroup = l_Roact_0.createElement("TextButton", {
                    Size = if not v21 then UDim2.new(1, -47, 1, 0) else UDim2.new(1, -123, 1, 0), 
                    Text = "", 
                    BackgroundTransparency = 1, 
                    [l_Roact_0.Event.Activated] = if not v21 then nil else v18.openProfilePeekView, 
                    LayoutOrder = not v21 and 2 or 3
                }, {
                    layout = l_Roact_0.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    contactNameLabel = if not v12() then l_Roact_0.createElement(l_StyledTextLabel_0, {
                        automaticSize = Enum.AutomaticSize.Y, 
                        colorStyle = v23.Theme.TextEmphasis, 
                        fontStyle = v23.Font.Header2, 
                        lineHeight = 1, 
                        text = l_props_2.contactName, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        layoutOrder = 1
                    }) else l_Roact_0.createElement(l_StyledTextLabel_0, {
                        size = UDim2.new(1, v18.state.contactNameOffset, 0, 20), 
                        colorStyle = v23.Theme.TextEmphasis, 
                        fontStyle = v23.Font.Header2, 
                        lineHeight = 1, 
                        text = l_props_2.contactName, 
                        fluidSizing = false, 
                        richText = false, 
                        textWrapped = false, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Bottom, 
                        textTruncate = Enum.TextTruncate.AtEnd, 
                        layoutOrder = 1
                    }), 
                    contactContextual = if not v22 then l_Roact_0.createElement(l_StyledTextLabel_0, {
                        colorStyle = v23.Theme.TextDefault, 
                        fontStyle = v23.Font.CaptionBody, 
                        lineHeight = 1, 
                        size = UDim2.new(1, 0, 0, 20), 
                        text = l_props_2.contextualInfo, 
                        richText = false, 
                        textXAlignment = Enum.TextXAlignment.Left, 
                        textYAlignment = Enum.TextYAlignment.Center, 
                        layoutOrder = 2
                    }) else nil
                }), 
                requestContactButton = if not v20 then l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.Secondary, 
                    icon = l_Images_0["icons/actions/friends/friendpending"], 
                    size = UDim2.fromOffset(44, 36), 
                    onActivated = function()
                    end, 
                    isDisabled = true, 
                    layoutOrder = not v21 and 3 or 4, 
                    [l_Roact_0.Change.AbsoluteSize] = if not v12() then nil else v18.addButtonSizeChanged
                }) else l_Roact_0.createElement(l_Button_0, {
                    buttonType = l_ButtonType_0.PrimarySystem, 
                    icon = l_Images_0["icons/actions/friends/friendAdd"], 
                    size = UDim2.fromOffset(44, 36), 
                    onActivated = v18.requestContactFriendship, 
                    layoutOrder = not v21 and 3 or 4, 
                    [l_Roact_0.Change.AbsoluteSize] = if not v12() then nil else v18.addButtonSizeChanged
                })
            }), 
            divider = if not l_props_2.hasDivider then nil else l_Roact_0.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.new(0, 0, 1, 0), 
                BorderSizePixel = 0, 
                BackgroundColor3 = v23.Theme.Divider.Color, 
                BackgroundTransparency = v23.Theme.Divider.Transparency
            })
        });
    end);
end;
return v11;
