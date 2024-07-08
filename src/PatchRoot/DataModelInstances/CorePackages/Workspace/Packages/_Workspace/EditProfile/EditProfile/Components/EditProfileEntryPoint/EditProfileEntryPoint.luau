local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.UserLib);
local l_LoadableImage_0 = v3.App.Loading.LoadableImage;
local l_ImageSetLabel_0 = v3.Core.ImageSet.ImageSetLabel;
local l_Images_0 = v3.App.ImageSet.Images;
local l_useStyle_0 = v3.Core.Style.useStyle;
local v9 = require(l_script_FirstAncestor_0.Components.EditProfileTopBar);
local v10 = require(l_script_FirstAncestor_0.Components.EditTextButton);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v12 = require(l_script_FirstAncestor_0.Common.TextKeys);
local v13 = require(l_script_FirstAncestor_0.Hooks.useDisplayNameText);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v4.Utils.getStandardSizeAvatarHeadShotRbxthumb;
local l_useUserExperiment_0 = require(l_Parent_0.RoactAppExperiment).useUserExperiment;
local l_FFlagRealNamesInDisplayNameExperimentEnabled_0 = require(l_Parent_0.SharedFlags).FFlagRealNamesInDisplayNameExperimentEnabled;
local v17 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileNavigateToAvatar);
local v18 = require(l_script_FirstAncestor_0.Flags.FFlagEditProfileToAvatarIXPEnabled);
local v19 = require(l_script_FirstAncestor_0.Flags.FStringEditProfileToAvatarLayerName);
local v20 = utf8.char(57346);
return function(v21)
    local v22 = nil;
    if v18 then
        v22 = l_useUserExperiment_0({
            v19
        }, function(v23)
            return (v23[v19] or {}).profile_picture_on;
        end);
    end;
    local v24 = l_useStyle_0();
    local l_Theme_0 = v24.Theme;
    local v26 = l_useLocalization_0({
        About = v12.About, 
        AboutModalCaption = v12.AboutModalCaption, 
        DisplayName = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v12.DisplayName else nil, 
        DisplayNameCaption = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v12.DisplayNameCaption else nil, 
        AboutPlaceholder = v12.AboutPlaceholder, 
        Username = v12.Username, 
        UsernameCaption = {
            v12.UsernameDescription; 
            icon = v20, 
            price = l_useLocalization_0({
                thousand = v12.UsernamePrice
            }).thousand
        }
    });
    local v27 = nil;
    if l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then
        v27 = v13();
    end;
    return v2.createElement("Frame", {
        BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
        BackgroundTransparency = v24.Theme.BackgroundDefault.Transparency, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.fromScale(0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0)
    }, {
        SizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(640, math.huge)
        }), 
        Layout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        TopPadding = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }), 
        TopBar = v2.createElement(v9, {
            layoutOrder = 1, 
            onClose = v21.onClose
        }), 
        ProfilePicture = if v17 or v22 then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            Size = UDim2.new(1, 0, 0, 100), 
            LayoutOrder = 2, 
            BackgroundTransparency = 1
        }, {
            Picture = v2.createElement("ImageButton", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 100, 0, 100), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 10, 
                [v2.Event.Activated] = v21.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                }), 
                UserAvatar = v2.createElement(l_LoadableImage_0, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    useShimmerAnimationWhileLoading = true, 
                    cornerRadius = UDim.new(0.5, 0), 
                    shouldHandleReloads = true, 
                    Image = l_getStandardSizeAvatarHeadShotRbxthumb_0(v21.localUserId), 
                    BackgroundColor3 = l_Theme_0.PlaceHolder.Color, 
                    BackgroundTransparency = l_Theme_0.PlaceHolder.Transparency
                })
            }), 
            Button = v2.createElement("ImageButton", {
                Size = UDim2.new(0, 36, 0, 36), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.new(0.5, 80, 1, 0), 
                BackgroundTransparency = l_Theme_0.UIMuted.Transparency, 
                BackgroundColor3 = l_Theme_0.UIMuted.Color, 
                [v2.Event.Activated] = v21.openEditProfilePicture
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 4)
                }), 
                Icon = v2.createElement(l_ImageSetLabel_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = l_Images_0["icons/menu/profilepicture_large"], 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color, 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, 28, 0, 28), 
                    Position = UDim2.fromScale(0.5, 0.5)
                })
            })
        }) else nil, 
        Content = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, -48, 0, 0), 
            BorderSizePixel = 0, 
            LayoutOrder = 3
        }, {
            Layout = v2.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 24)
            }), 
            DisplayNameButton = v2.createElement(v10, {
                layoutOrder = 1, 
                shouldShimmerName = v21.shouldShimmerName, 
                title = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v26.DisplayName else v27.displayNameTitle, 
                description = if not l_FFlagRealNamesInDisplayNameExperimentEnabled_0 then v26.DisplayNameCaption else v27.displayNameCaption, 
                placeHolderText = v21.displayName, 
                localUserId = v21.localUserId, 
                onActivated = v21.openDisplayNameModal, 
                expandSizing = false, 
                transparentText = false
            }), 
            UsernameButton = v2.createElement(v10, {
                layoutOrder = 2, 
                shouldShimmerName = v21.shouldShimmerName, 
                title = v26.Username, 
                description = v26.UsernameCaption, 
                placeHolderText = "@" .. v21.username, 
                localUserId = v21.localUserId, 
                onActivated = v21.navigateToEditUsername, 
                expandSizing = false, 
                transparentText = false
            }), 
            Divider = v2.createElement("Frame", {
                LayoutOrder = 3, 
                BackgroundColor3 = v24.Theme.Divider.Color, 
                BackgroundTransparency = v24.Theme.Divider.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, 1)
            }), 
            AboutMeButton = v2.createElement(v10, {
                layoutOrder = 4, 
                title = v26.About, 
                description = v26.AboutModalCaption, 
                placeHolderText = if v21.description ~= nil and v21.description ~= "" then v21.description else v26.AboutPlaceholder, 
                shouldShimmerName = false, 
                localUserId = v21.localUserId, 
                expandSizing = true, 
                onActivated = v21.openEditDescription, 
                transparentText = not v21.description and true or v21.description == ""
            })
        })
    });
end;
