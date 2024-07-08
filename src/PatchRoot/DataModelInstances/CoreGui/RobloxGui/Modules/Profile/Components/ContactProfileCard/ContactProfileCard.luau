local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.dependencies);
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Roact_0 = v1.Roact;
local v4 = require(l_Parent_0.Common.TextKeys);
local v5 = require(script.Parent.ContactAvatarImage);
local _ = require(l_Parent_0.Common.ContextPropsTypes);
local l_useLocalization_0 = v1.useLocalization;
local l_UIBlox_0 = v1.UIBlox;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local l_StyledTextLabel_0 = l_UIBlox_0.App.Text.StyledTextLabel;
local l_HorizontalPageMargin_0 = l_UIBlox_0.App.Container.HorizontalPageMargin;
local l_FFlagContactRecs_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagContactRecs;
return function(v13)
    local v14 = l_useLocalization_0({
        contactsProfileBody = {
            v4.ContactsProfileBody; 
            contactName = v13.contactName
        }, 
        failedMessage = v4.NoInternet
    });
    local v15 = l_useStyle_0();
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
                Size = UDim2.new(1, 0, 0, v13.height), 
                Position = UDim2.new(0, 0, 0, 0), 
                BackgroundTransparency = 1, 
                ZIndex = 1
            }), 
            Content = l_Roact_0.createElement(l_HorizontalPageMargin_0, {
                size = UDim2.fromScale(1, 1), 
                zIndex = 2, 
                backgroundTransparency = 1
            }, {
                ListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = UDim.new(0, 24)
                }), 
                AvatarImage = l_Roact_0.createElement(v5, {
                    contactName = v13.contactName, 
                    avatarAssetHashId = v13.avatarAssetHashId, 
                    profileUserId = v13.profileUserId, 
                    width = v13.width, 
                    layoutOrder = 1, 
                    padding = 24, 
                    avatarImageUrl = if not l_FFlagContactRecs_0 then nil else v13.avatarImageUrl
                }), 
                Description = l_Roact_0.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 3, 
                    lineHeight = 1.25, 
                    size = UDim2.new(1, 0, 0, 100), 
                    text = v14.contactsProfileBody, 
                    textXAlignment = Enum.TextXAlignment.Center, 
                    textYAlignment = Enum.TextYAlignment.Top, 
                    textTruncate = Enum.TextTruncate.AtEnd, 
                    fontStyle = v15.Font.Body, 
                    colorStyle = v15.Theme.TextDefault, 
                    fluidSizing = false, 
                    richText = false
                })
            })
        })
    });
end;
