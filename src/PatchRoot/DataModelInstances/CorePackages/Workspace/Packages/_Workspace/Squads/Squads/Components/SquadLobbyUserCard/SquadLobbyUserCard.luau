local l_script_FirstAncestor_0 = script:FindFirstAncestor("Squads");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_React_0 = v1.React;
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_UserProfiles_0 = v1.UserProfiles;
local l_useLocalization_0 = v1.Hooks.useLocalization;
local l_useSelector_0 = v1.Hooks.useSelector;
local l_PresenceType_0 = v1.RoduxPresence.Enums.PresenceType;
local l_IconSize_0 = l_UIBlox_0.App.ImageSet.Enum.IconSize;
local l_ImageSetLabel_0 = l_UIBlox_0.Core.ImageSet.ImageSetLabel;
local l_Images_0 = l_UIBlox_0.App.ImageSet.Images;
local l_ShimmerPanel_0 = l_UIBlox_0.App.Loading.ShimmerPanel;
local l_getIconSize_0 = l_UIBlox_0.App.ImageSet.getIconSize;
local l_useStyle_0 = l_UIBlox_0.Core.Style.useStyle;
local v15 = require(l_script_FirstAncestor_0.Common.Constants);
local _ = require(l_script_FirstAncestor_0.Common.ModelTypes);
local v17 = require(l_script_FirstAncestor_0.Common.getColorFromUserId);
local l_getStandardSizeAvatarHeadShotRbxthumb_0 = v1.getStandardSizeAvatarHeadShotRbxthumb;
local v19 = UDim.new(1, 0);
local v20 = Color3.fromRGB(60, 100, 250);
return function(v21)
    local v22 = l_useStyle_0();
    local v23 = l_useLocalization_0({
        onlineText = "Feature.Squads.Label.Online"
    });
    local v24 = l_UserProfiles_0.Hooks.useUserProfilesFetch({
        userIds = {
            (tostring(v21.user.userId))
        }, 
        query = l_UserProfiles_0.Queries.userProfilesCombinedNameAndUsernameByUserIds
    });
    local v25 = "";
    if v24.data then
        v25 = l_UserProfiles_0.Selectors.getCombinedNameFromId(v24.data, v21.user.userId);
    end;
    local v27 = l_useSelector_0((l_React_0.useCallback(function(v26)
        return v26.Squad.Presence.byUserId[tostring(v21.user.userId)];
    end, {})));
    local v28 = l_getIconSize_0(l_IconSize_0.Small);
    if not v21.isLoading and v21.user then
        local v29 = l_getStandardSizeAvatarHeadShotRbxthumb_0((tostring(v21.user.userId)));
        local v30 = v27 and v27.userPresenceType == l_PresenceType_0.InGame;
        local v31 = v27 and v27.userPresenceType == l_PresenceType_0.Online;
        local v32 = not v30 and 0 or v15.SQUAD_LOBBY_IN_GAME_BORDER_SIZE;
        local v33 = "Offline";
        if v27 then
            if v27.userPresenceType == l_PresenceType_0.Online then
                v33 = v23.onlineText;
            elseif v27.userPresenceType == l_PresenceType_0.InGame then
                v33 = v27.lastLocation;
            end;
        end;
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.fromOffset(v15.SQUAD_LOBBY_USER_CARD_SIZE.X, v15.SQUAD_LOBBY_USER_CARD_SIZE.Y), 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.layoutOrder
        }, {
            AvatarContainer = l_Roact_0.createElement("Frame", {
                Size = UDim2.fromOffset(v15.SQUAD_LOBBY_AVATAR_SIZE, v15.SQUAD_LOBBY_AVATAR_SIZE), 
                BackgroundTransparency = 1
            }, {
                Avatar = l_Roact_0.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = UDim2.new(1, -v32 * 2, 1, -v32 * 2), 
                    BackgroundTransparency = 1
                }, {
                    UICorner = l_React_0.createElement("UICorner", {
                        CornerRadius = v19
                    }), 
                    UIPadding = if not v30 then nil else l_Roact_0.createElement("UIPadding", {
                        PaddingBottom = UDim.new(0, 3), 
                        PaddingLeft = UDim.new(0, 3), 
                        PaddingRight = UDim.new(0, 3), 
                        PaddingTop = UDim.new(0, 3)
                    }), 
                    UIStroke = if not v30 then nil else l_React_0.createElement("UIStroke", {
                        Color = v20, 
                        Thickness = v32
                    }), 
                    AvatarImage = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.new(1, 0, 1, 0), 
                        BackgroundColor3 = v17(v21.user.userId), 
                        Image = v29
                    }, {
                        UICorner = l_React_0.createElement("UICorner", {
                            CornerRadius = v19
                        })
                    })
                }), 
                GreenDot = if not v31 then nil else l_Roact_0.createElement("Frame", {
                    Position = UDim2.new(1, -21, 1, -21), 
                    Size = UDim2.fromOffset(14, 14), 
                    BackgroundColor3 = Color3.fromRGB(0, 180, 109), 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    UICorner = l_React_0.createElement("UICorner", {
                        CornerRadius = v19
                    }), 
                    UIStroke = l_React_0.createElement("UIStroke", {
                        Color = Color3.fromRGB(17, 19, 22), 
                        Thickness = 3
                    })
                }), 
                PlayCircleContainer = if not v30 then nil else l_Roact_0.createElement("Frame", {
                    Position = UDim2.new(1, -26, 1, -26), 
                    Size = UDim2.fromOffset(24, 24), 
                    BackgroundColor3 = v20, 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    UICorner = l_React_0.createElement("UICorner", {
                        CornerRadius = v19
                    }), 
                    UIStroke = l_React_0.createElement("UIStroke", {
                        Color = Color3.fromRGB(17, 19, 22), 
                        Thickness = 3
                    }), 
                    PlayCircle = l_Roact_0.createElement(l_ImageSetLabel_0, {
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = UDim2.fromOffset(v28, v28), 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0["icons/common/play"]
                    })
                })
            }), 
            TextContainer = l_Roact_0.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 1), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Position = UDim2.fromScale(0, 1), 
                Size = UDim2.fromScale(1, 0), 
                BackgroundTransparency = 1
            }, {
                TextContainerUIListLayout = l_Roact_0.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                NameContainer = l_Roact_0.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    NameContainerUIListLayout = l_Roact_0.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, 2), 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        VerticalAlignment = Enum.VerticalAlignment.Center
                    }), 
                    BlockedIcon = if not v21.isBlocked then nil else l_Roact_0.createElement(l_ImageSetLabel_0, {
                        Size = UDim2.fromOffset(v28, v28), 
                        BackgroundTransparency = 1, 
                        Image = l_Images_0[v15.BLOCKED_ICON_IMAGE], 
                        LayoutOrder = 1
                    }), 
                    Name = l_Roact_0.createElement("TextLabel", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        BackgroundTransparency = 1, 
                        Font = v22.Font.CaptionHeader.Font, 
                        LayoutOrder = 2, 
                        Text = v25, 
                        TextColor3 = v22.Theme.TextEmphasis.Color, 
                        TextSize = 16.8, 
                        TextTruncate = Enum.TextTruncate.AtEnd
                    }, {
                        NameUIPadding = l_Roact_0.createElement("UIPadding", {
                            PaddingTop = UDim.new(0, 2), 
                            PaddingBottom = UDim.new(0, 2)
                        }), 
                        NameUISizeConstraint = l_Roact_0.createElement("UISizeConstraint", {
                            MaxSize = Vector2.new(v15.SQUAD_LOBBY_AVATAR_SIZE - (not v21.isBlocked and 0 or v28 + 2), math.huge)
                        })
                    })
                }), 
                Status = l_Roact_0.createElement("TextLabel", {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    BackgroundTransparency = 1, 
                    Font = v22.Font.CaptionBody.Font, 
                    LayoutOrder = 2, 
                    Text = v33, 
                    TextColor3 = v22.Theme.TextDefault.Color, 
                    TextSize = 16.8, 
                    TextTruncate = Enum.TextTruncate.AtEnd
                }, {
                    StatusUIPadding = l_Roact_0.createElement("UIPadding", {
                        PaddingTop = UDim.new(0, 2), 
                        PaddingBottom = UDim.new(0, 2)
                    })
                })
            })
        });
    else
        return l_Roact_0.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = v21.layoutOrder
        }, {
            Layout = l_Roact_0.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center
            }), 
            AvatarContainer = l_Roact_0.createElement(l_ShimmerPanel_0, {
                LayoutOrder = 1, 
                Size = UDim2.fromOffset(v15.SQUAD_LOBBY_AVATAR_SIZE, v15.SQUAD_LOBBY_AVATAR_SIZE), 
                cornerRadius = v19
            }), 
            Name = l_Roact_0.createElement(l_ShimmerPanel_0, {
                Size = UDim2.fromOffset(66, 16.8), 
                LayoutOrder = 2, 
                cornerRadius = v19
            }), 
            Status = l_Roact_0.createElement(l_ShimmerPanel_0, {
                Size = UDim2.fromOffset(66, 16.8), 
                LayoutOrder = 3, 
                cornerRadius = v19
            })
        });
    end;
end;
