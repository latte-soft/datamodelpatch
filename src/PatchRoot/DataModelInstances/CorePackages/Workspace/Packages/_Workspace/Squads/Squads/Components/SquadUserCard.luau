local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v2 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v2.React;
local l_UIBlox_0 = v2.UIBlox;
local l_UserProfiles_0 = v2.UserProfiles;
local l_dependencyArray_0 = v2.Hooks.dependencyArray;
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v2.getStandardSizeAvatarHeadShotRbxthumb;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v14 = require(l_script_FirstAncestor_0.Common.getColorFromUserId);
return function(v15)
    local v16 = l_useStyle_0();
    local v17 = l_UserProfiles_0.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v15.user.userId))
        }, 
        query = l_UserProfiles_0.Queries.userProfilesCombinedNameByUserIds
    });
    local v18 = "";
    if v17.data then
        v18 = l_UserProfiles_0.Selectors.getCombinedNameFromId(v17.data, v15.user.userId);
    end;
    local v19 = l_getIconSize_0(l_IconSize_0.Small);
    local v20 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v15.user.userId)));
    local l_Font_0 = v16.Font.CaptionHeader.Font;
    local v22 = v16.Font.BaseSize * v16.Font.CaptionHeader.RelativeSize;
    local v23 = l_React_0.useMemo(function()
        return l_TextService_0:GetTextSize(v18, v22, l_Font_0, Vector2.new(((v15.containerWidth - 24) - 16) - (not v15.isBlocked and 0 or v19 + 8), math.huge));
    end, l_dependencyArray_0(v18, l_Font_0, v15.containerWidth, v15.isBlocked, v19, v22));
    return l_React_0.createElement("Frame", {
        Size = UDim2.fromScale(1, 1), 
        BackgroundColor3 = v14(v15.user.userId), 
        LayoutOrder = v15.layoutOrder
    }, {
        UICorner = l_React_0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 8)
        }), 
        Background = l_React_0.createElement("Frame", {
            Size = UDim2.fromScale(1, 1), 
            BackgroundColor3 = v16.Theme.Overlay.Color, 
            BackgroundTransparency = v16.Theme.Overlay.Transparency
        }, {
            UICorner = l_React_0.createElement("UICorner", {
                CornerRadius = UDim.new(0, 8)
            }), 
            UIPadding = l_React_0.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 12)
            }), 
            AvatarImage = l_React_0.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(96, 96), 
                BackgroundColor3 = v14(v15.user.userId), 
                Image = v20
            }, {
                UICorner = l_React_0.createElement("UICorner", {
                    CornerRadius = UDim.new(1, 0)
                })
            }), 
            Name = l_React_0.useMemo(function()
                if v18 ~= "" then
                    return (l_React_0.createElement("Frame", {
                        AnchorPoint = Vector2.new(0, 1), 
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Position = UDim2.fromScale(0, 1), 
                        BackgroundColor3 = v16.Theme.Overlay.Color, 
                        BackgroundTransparency = v16.Theme.Overlay.Transparency
                    }, {
                        UICorner = l_React_0.createElement("UICorner", {
                            CornerRadius = UDim.new(0, 8)
                        }), 
                        UIListLayout = l_React_0.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            Padding = UDim.new(0, 8), 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            VerticalAlignment = Enum.VerticalAlignment.Center
                        }), 
                        UIPadding = l_React_0.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, 8), 
                            PaddingLeft = UDim.new(0, 8), 
                            PaddingRight = UDim.new(0, 8), 
                            PaddingTop = UDim.new(0, 8)
                        }), 
                        UISizeConstraint = l_React_0.createElement("UISizeConstraint", {
                            MinSize = Vector2.new(0, v19)
                        }), 
                        NameTextLabel = l_React_0.createElement("TextLabel", {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            Size = UDim2.fromOffset(math.ceil(v23.X), 0), 
                            BackgroundTransparency = 1, 
                            Font = l_Font_0, 
                            LayoutOrder = 1, 
                            Text = v18, 
                            TextColor3 = v16.Theme.TextEmphasis.Color, 
                            TextSize = v22, 
                            TextTransparency = v16.Theme.TextEmphasis.Transparency, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Center, 
                            TextWrapped = false
                        }), 
                        BlockedIcon = if not v15.isBlocked then nil else l_React_0.createElement(l_ImageSetLabel_0, {
                            Size = UDim2.fromOffset(v19, v19), 
                            BackgroundTransparency = 1, 
                            Image = l_Images_0["icons/actions/block"], 
                            LayoutOrder = 2
                        })
                    }));
                else
                    return nil;
                end;
            end, l_dependencyArray_0(v18, l_Font_0, v15.isBlocked, v19, v23, v22))
        })
    });
end;
