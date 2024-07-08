local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_components_0 = l_script_FirstAncestor_0.components;
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local v4 = require(l_script_FirstAncestor_0.constants);
local v5 = require(l_Parent_0.ReactOtter);
local v6 = require(l_Parent_0.NotificationsCommon);
local v7 = require(l_components_0.StreamNotificationAnimationWrapper);
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local l_NotificationHelper_0 = v6.NotificationHelper;
local v10 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v10.Core.Style.useStyle;
local l_Images_0 = v10.App.ImageSet.Images;
local l_ImageSetLabel_0 = v10.Core.ImageSet.ImageSetLabel;
local v14 = l_Images_0["icons/actions/truncationExpand"];
local v15 = l_Images_0["icons/actions/truncationCollapse"];
local v16 = UDim.new(0, 12);
local v17 = UDim.new(0, 24);
local v18 = v4.DefaultPadding * 4;
local v19 = UDim2.fromOffset(24, 24);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local v21 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local v22 = {
    stiffness = 207, 
    damping = 24, 
    mass = 1
};
return function(v23)
    local v24 = l_useStyle_0();
    local l_Font_0 = v24.Font;
    local l_Font_1 = l_Font_0.Header1.Font;
    local v27 = l_Font_0.BaseSize * l_Font_0.CaptionHeader.RelativeSize;
    local v28, v29 = v3.useState(true);
    local v30, v31 = v3.useState(74);
    local v32, v33 = v3.useState(true);
    local v34, v35 = v5.useAnimatedBinding({
        shadowHeight = 0, 
        shadowWidth = 1
    });
    local v36 = l_useLocalization_0({
        moreText = v4.Text.ShowMoreKey, 
        lessText = v4.Text.ShowLessKey
    });
    local v39 = v3.useCallback(function(v37, v38)
        if not (not (v37 == 1) or not v28) then
            v31(v38);
        end;
    end);
    local function v44(v40)
        local v41 = {};
        for _, v43 in v40, nil, nil do
            if v43.id then
                table.insert(v41, v43.id);
            end;
        end;
        return v41;
    end;
    local function v48()
        v29(function(v45)
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v21.Context.click, if not v45 then v21.EventNames.bundleClosed else v21.EventNames.bundleOpened, {
                bundleKey = v23.notifications[1].content.bundleKey or nil, 
                totalNotifications = #v23.notifications or nil, 
                notificationIds = v44(v23.notifications) or nil
            });
            if v45 then
                for v46, v47 in v23.notifications, nil, nil do
                    l_NotificationHelper_0.fireEvent(l_EventStream_0, v21.Context.seen, v21.EventNames.notificationViewed, {
                        notificationId = v47.id or nil, 
                        notificationType = v47.content.notificationType or nil, 
                        bundlePosition = v46, 
                        bundleKey = v47.content.bundleKey or nil, 
                        clientEventsPayload = v47.content.clientEventsPayload or nil
                    });
                end;
            end;
            return not v45;
        end);
    end;
    v3.useEffect(function()
        v35({
            shadowHeight = v5.spring(not v28 and 1 or 0, v22), 
            shadowWidth = v5.spring(not v28 and 0 or 1, v22)
        });
    end, {
        v28
    });
    v3.useEffect(function()
        v33(#v23.notifications > 1);
    end, {
        v23.notifications
    });
    return (v3.useMemo(function()
        local v49 = {};
        for v50, v51 in ipairs(v23.notifications) do
            local v52 = false;
            if not (not v28 or not v32) then
                v52 = true;
            end;
            v49[v51.id] = v3.createElement(v7, {
                layoutOrder = v50, 
                notification = v51, 
                finishDismissNotification = v23.finishDismissNotification, 
                handleActions = v23.handleActions, 
                openMetaActions = v23.openMetaActions, 
                onHeightChange = v39, 
                collapsed = v52
            });
        end;
        v49.UIPadding = v3.createElement("UIPadding", {
            PaddingTop = if not v28 and v32 then UDim.new(0, 40) else UDim.new(0, 0)
        });
        v49.UIListLayout = v3.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        });
        v49.Shadow1 = if not not v28 and v32 then v3.createElement("Frame", {
            Size = v34:map(function(v53)
                return UDim2.new(1, 0, 0, v53.shadowHeight * v30 + v4.DefaultPadding);
            end), 
            LayoutOrder = #v23.notifications + 1, 
            ZIndex = -(#v23.notifications + 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            v3.createElement("Frame", {
                Size = v34:map(function(v54)
                    return UDim2.new(1, -((v4.DefaultPadding * 4) * v54.shadowWidth), 0, v30 - v4.DefaultPadding);
                end), 
                BackgroundColor3 = v24.Theme.BackgroundDefault.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = v16
                })
            })
        }) else nil;
        v49.Shadow2 = if not not v28 and v32 then v3.createElement("Frame", {
            Size = v34:map(function(v55)
                return UDim2.new(1, 0, 0, v55.shadowHeight * v30 + v4.DefaultPadding * 2);
            end), 
            LayoutOrder = #v23.notifications + 2, 
            BackgroundTransparency = 1, 
            ZIndex = -(#v23.notifications + 2), 
            BorderSizePixel = 0
        }, {
            v3.createElement("Frame", {
                Size = v34:map(function(v56)
                    return UDim2.new(1, -((v4.DefaultPadding * 6) * v56.shadowWidth), 0, v30 - v4.DefaultPadding);
                end), 
                BackgroundColor3 = v24.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = 0, 
                BorderSizePixel = 0, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0)
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = v16
                })
            })
        }) else nil;
        return v3.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            LayoutOrder = v23.layoutOrder
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingBottom = if not not v28 and v32 then UDim.new(0, v4.DefaultPadding) else UDim.new(0, 0)
            }), 
            ShowLessButton = if not v28 and v32 then v3.createElement("TextButton", {
                Size = UDim2.new(0, 160, 0, 40), 
                Text = "", 
                Font = l_Font_1, 
                TextSize = v27, 
                [v3.Event.Activated] = v48, 
                BackgroundTransparency = 1, 
                BackgroundColor3 = v24.Theme.BackgroundMuted.Color, 
                AutoButtonColor = false, 
                LayoutOrder = 1, 
                ZIndex = 4, 
                Position = UDim2.new(1, 0, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                BorderSizePixel = 0
            }, {
                v3.createElement("Frame", {
                    Size = UDim2.new(1, -v4.DefaultPadding, 1, -v4.DefaultPadding), 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = v24.Theme.BackgroundContrast.Color, 
                    Position = UDim2.new(1, -v4.DefaultPadding, 0, 0), 
                    AnchorPoint = Vector2.new(1, 0), 
                    ZIndex = 10, 
                    BorderSizePixel = 0
                }, {
                    UICorner = v3.createElement("UICorner", {
                        CornerRadius = v17
                    }), 
                    ShowLessTextAndIconFrame = v3.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        Position = UDim2.new(0.5, 0, 0.5, 0), 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        BorderSizePixel = 0, 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v3.createElement("UIListLayout", {
                            FillDirection = Enum.FillDirection.Horizontal, 
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center
                        }), 
                        ShowLessText = v3.createElement("TextLabel", {
                            Text = v36 and v36.lessText, 
                            LayoutOrder = 1, 
                            Font = l_Font_1, 
                            TextSize = v27, 
                            BackgroundTransparency = 1, 
                            TextColor3 = v24.Theme.TextMuted.Color, 
                            Size = UDim2.new(0, 0, 1, 0), 
                            AutomaticSize = Enum.AutomaticSize.X
                        }, {
                            v3.createElement("UIPadding", {
                                PaddingRight = UDim.new(0, v4.DefaultPadding)
                            })
                        }), 
                        CollapseIcon = v3.createElement(l_ImageSetLabel_0, {
                            LayoutOrder = 2, 
                            AnchorPoint = Vector2.new(0.5, 0.5), 
                            Position = UDim2.fromScale(0.5, 0.5), 
                            Size = v19, 
                            BackgroundTransparency = 1, 
                            BorderSizePixel = 0, 
                            Image = v15, 
                            ImageColor3 = v24.Theme.UIEmphasis.Color
                        })
                    })
                })
            }) else nil, 
            InvisibleExpandButton = v3.createElement("TextButton", {
                Size = UDim2.new(1, 0, 0, if not not v28 and v32 then v30 + v4.DefaultPadding * 2 else 0), 
                BackgroundTransparency = 1, 
                Text = "", 
                [v3.Event.Activated] = v48, 
                ZIndex = 5, 
                BorderSizePixel = 0, 
                AutoButtonColor = false
            }), 
            NumberMoreButton = if (v30 ~= 0 and v28) and #v23.notifications > 1 then v3.createElement("Frame", {
                Size = UDim2.new(0, 125, 0, v18), 
                AutomaticSize = Enum.AutomaticSize.X, 
                Position = UDim2.new(0.5, 0, 1, 0), 
                AnchorPoint = Vector2.new(0.5, 1), 
                ZIndex = 10, 
                BackgroundColor3 = v24.Theme.BackgroundContrast.Color, 
                BackgroundTransparency = 0
            }, {
                UICorner = v3.createElement("UICorner", {
                    CornerRadius = v17
                }), 
                NumberedMoreTextAndIconFrame = v3.createElement("Frame", {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BorderSizePixel = 0, 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v3.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Horizontal, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    }), 
                    NumberMoreText = v3.createElement("TextLabel", {
                        Text = (v36 and v36.moreText) and string.gsub(v36.moreText, "{notificationCount}", (tostring(#v23.notifications - 1))), 
                        LayoutOrder = 1, 
                        Font = l_Font_1, 
                        TextSize = v27, 
                        BackgroundTransparency = 1, 
                        TextColor3 = v24.Theme.TextMuted.Color, 
                        Size = UDim2.new(0, 0, 1, 0), 
                        AutomaticSize = Enum.AutomaticSize.X
                    }, {
                        v3.createElement("UIPadding", {
                            PaddingRight = UDim.new(0, v4.DefaultPadding)
                        })
                    }), 
                    ExpandIcon = v3.createElement(l_ImageSetLabel_0, {
                        LayoutOrder = 2, 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.fromScale(0.5, 0.5), 
                        Size = v19, 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Image = v14, 
                        ImageColor3 = v24.Theme.UIEmphasis.Color
                    })
                })
            }) else nil, 
            ListOfNotifications = v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1, 
                ZIndex = 3, 
                BorderSizePixel = 0
            }, v49)
        });
    end, {
        v23.notifications, 
        v28, 
        v30, 
        v32
    }));
end;
