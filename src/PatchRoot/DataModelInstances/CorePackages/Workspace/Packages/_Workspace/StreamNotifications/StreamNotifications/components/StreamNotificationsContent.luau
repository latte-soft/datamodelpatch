local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamNotifications");
local l_components_0 = l_script_FirstAncestor_0.components;
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Players_0 = game:GetService("Players");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v5 = require(l_script_FirstAncestor_0.constants);
local v6 = require(l_CorePackages_0.Cryo);
local v7 = require(l_Parent_0.Analytics).AnalyticsReporters.EventIngest.new((game:GetService("EventIngestService")));
local l_SessionService_0 = game:GetService("SessionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_GuiService_0 = game:GetService("GuiService");
local v11 = require(l_components_0.EmptyNotifications);
local v12 = require(l_components_0.MetaActionsMenu);
local v13 = require(l_components_0.StreamNotificationAnimationWrapper);
local v14 = require(l_components_0.StreamNotificationBundleWrapper);
local v15 = require(l_Parent_0.React);
local v16 = require(l_Parent_0.NotificationsCommon);
local l_JoinExperience_0 = v16.JoinExperience;
local l_type_0 = v16.type;
local l_NotificationHelper_0 = v16.NotificationHelper;
local v20 = require(l_script_FirstAncestor_0.EnumStreamNotificationsDisplayState);
local v21 = require(l_script_FirstAncestor_0.EnumStreamNotificationsLoadingMoreState);
local v22 = require(l_CorePackages_0.Packages.HttpRequest);
local v23 = v22.config({
    requestFunction = v22.requestFunctions.HttpRbxApi
});
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_useDeviceType_0 = require(l_Parent_0.RobloxAppHooks).useDeviceType;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local v27 = require(l_Parent_0.UIBlox);
local l_useStyle_0 = v27.Core.Style.useStyle;
local l_LoadingSpinner_0 = v27.App.Loading.LoadingSpinner;
local l_NavigateDown_0 = require(l_CorePackages_0.Workspace.Packages.NavigationRodux).Thunks.NavigateDown;
local v31 = require(l_script_FirstAncestor_0.utils.getStreamNotifications);
local v32 = require(l_script_FirstAncestor_0.utils.clearUnreadNotifications);
local v33 = require(l_script_FirstAncestor_0.utils.postNotificationsApi);
local v34 = require(l_script_FirstAncestor_0.utils.postReportNotification);
local v35 = require(l_script_FirstAncestor_0.utils.reportEvent);
local v36 = require(l_script_FirstAncestor_0.utils.sortNotifications);
local l_EventStream_0 = require(l_script_FirstAncestor_0.analytics.analyticsService).EventStream;
local v38 = require(l_script_FirstAncestor_0.analytics.analyticsConstants);
local v39 = game:DefineFastFlag("LuaAppNewStreamNotificationsLogFix", false);
return function(v40)
    local v41 = l_useStyle_0();
    local v42 = l_useDispatch_0();
    local v43 = l_useDeviceType_0();
    local v44, v45 = v15.useState({});
    local v46, v47 = v15.useState(nil);
    local v48, v49 = v15.useState(v20.Initializing);
    local v50 = nil;
    local v51 = nil;
    local v52 = nil;
    local v54 = v40.showOverlay or function(_)
    end;
    local v55 = v15.useRef(v21.Loading);
    local v56, v57 = v15.useState(v21.Loading);
    local v58 = v15.useRef(0);
    local v59 = v5.Modal.HeaderHeight + (not l_UserInputService_0.StatusBarSize and 0 or l_UserInputService_0.StatusBarSize.Y);
    v15.useEffect(function()
        v50();
    end, {});
    local function _(v60)
        v55.current = v60;
        v57(v60);
    end;
    v50 = function()
        if v55.current == v21.NoMoreNotifications then
            return ;
        else
            local l_Loading_0 = v21.Loading;
            v55.current = l_Loading_0;
            v57(l_Loading_0);
            v31(v23, v5.DefaultMaxRows, v58.current):andThen(function(v63)
                v63 = v36(v63);
                if v63 and #v63 > 0 then
                    v45(function(v64)
                        return (v6.List.join(v64, v63));
                    end);
                    local l_Default_0 = v21.Default;
                    v55.current = l_Default_0;
                    v57(l_Default_0);
                    for _, v67 in ipairs(v63) do
                        l_NotificationHelper_0.fireEvent(l_EventStream_0, v38.Context.fetched, v38.EventNames.notificationRetrieved, v6.Dictionary.join(v67.content.clientEventsPayload or {}, {
                            sendrVersion = v5.SENDRVersion, 
                            notificationType = v67.content.notificationType or nil, 
                            notificationId = v67.id or nil
                        }));
                    end;
                else
                    local l_NoMoreNotifications_0 = v21.NoMoreNotifications;
                    v55.current = l_NoMoreNotifications_0;
                    v57(l_NoMoreNotifications_0);
                end;
                v49(v20.Default);
                v32(v23);
                v58.current = (tonumber(v58.current) or 0) + v5.DefaultMaxRows;
                if v44 and #v44 < v5.DefaultMaxRows then
                    v50();
                end;
            end):catch(function(_)
                v49(v20.ErrorRetrieving);
            end);
            return ;
        end;
    end;
    local function v76(v70, v71)
        local function v74()
            v34(v23, v71.id):andThen(function(_)
            end):catch(function(_)
            end);
            v51(v70, v71);
            v40.setDisplayScreenGuiEnabled(true);
            v49(v20.Default);
        end;
        local function v75()
            v40.setDisplayScreenGuiEnabled(true);
            v49(v20.Default);
        end;
        v40.setDisplayScreenGuiEnabled(false);
        v42(l_NavigateDown_0({
            name = l_AppPage_0.ReportDialog, 
            reportData = {
                reportEntryPoint = "Notification", 
                assetId = v71.id, 
                reportSurface = string.lower(v43), 
                submissionEntryPoint = string.lower(v43), 
                submitterUserId = if not l_Players_0.LocalPlayer then nil else tostring(l_Players_0.LocalPlayer.UserId), 
                onSubmitReportCallback = v74, 
                onCloseCallback = v75
            }
        }));
    end;
    local function _(v77)
        v52();
        if not (not v44 or not v77) then
            v45((v6.List.map(v44, function(v78)
                if v78.id == v77 then
                    v78.dismiss = true;
                end;
                return v78;
            end)));
        end;
    end;
    local v83 = v15.useCallback(function(v80)
        if not (not v44 or not v80) then
            v45((v6.List.filter(v44, function(v81)
                local v82 = false;
                if v81.id ~= v80 then
                    v82 = v81.dismiss ~= true;
                end;
                return v82;
            end)));
        end;
    end);
    local v93 = v15.useCallback(function(v84, v85)
        local v86 = v85 or v46;
        v47(v86);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v38.Context.click, v84.eventName or "", v6.Dictionary.join(v84.clientEventsPayload or {}, {
            notifType = if not v39 then nil else (v86 and v86.content) and v86.content.notificationType, 
            notifId = if not v39 then nil else v86 and v86.id, 
            visualItemType = v84.visualItemType or nil, 
            visualItemName = v84.visualItemName or nil, 
            sendrVersion = v5.SENDRVersion
        }));
        if not (not (v84.actions and #v84.actions > 0) or not v86) then
            for _, v88 in ipairs(v84.actions) do
                if v88.actionType then
                    if v88.actionType == l_type_0.ActionTypeEnum.Deeplink then
                        if l_JoinExperience_0(v88.path, false) then
                            v40.displayStream(false);
                            l_SessionService_0:SetSession(v5.StreamSessionStructuralIdentifier.Level1, v5.StreamSessionStructuralIdentifier.StreamNotification, v5.StreamSessionStructuralIdentifier.StreamNotification);
                            l_SessionService_0:SetMetadata(v5.StreamSessionStructuralIdentifier.StreamNotification, v5.StreamSessionStructuralIdentifier.DeleteOnGameLeave, "True");
                            v35(v7, {
                                action_type = v88.actionType, 
                                delivery_channel = v5.DeliveryChannel, 
                                notification_type = v86.notificationSourceType, 
                                notification_id = v86.id
                            });
                        end;
                    elseif v88.actionType == l_type_0.ActionTypeEnum.NotificationApi then
                        v33(v23, not not v86 and v86.id or nil, v88.path or nil):andThen(function(_)
                            if v88.nextState ~= nil and v88.nextState ~= "" then
                                v51(v88.nextState, v86);
                            end;
                        end):catch(function(_)
                        end);
                        v52();
                    elseif v88.actionType == l_type_0.ActionTypeEnum.Report then
                        v49(v20.AbuseReport);
                        v76(v88.nextState, v86);
                    elseif v88.actionType == l_type_0.ActionTypeEnum.Dismiss then
                        local l_id_0 = v86.id;
                        v52();
                        if not (not v44 or not l_id_0) then
                            v45((v6.List.map(v44, function(v92)
                                if v92.id == l_id_0 then
                                    v92.dismiss = true;
                                end;
                                return v92;
                            end)));
                        end;
                    end;
                end;
            end;
        end;
    end);
    local function v95(v94)
        v47(v94);
        v49(v20.MetaActions);
        l_NotificationHelper_0.fireEvent(l_EventStream_0, v38.Context.click, v38.EventNames.openMetaActions, {
            visualItemType = v16.type.VisualItemTypeEnum.MetaAction, 
            sendrVersion = v5.SENDRVersion
        });
    end;
    v52 = function()
        v54(true);
        v47(nil);
        if v48 == v20.MetaActions then
            l_NotificationHelper_0.fireEvent(l_EventStream_0, v38.Context.click, v38.EventNames.closeMetaActions, {
                visualItemType = v16.type.VisualItemTypeEnum.MetaAction, 
                sendrVersion = v5.SENDRVersion
            });
        end;
        v49(v20.Default);
    end;
    v51 = function(v96, v97)
        local v98 = {};
        if not (not v44 or not v97) then
            for _, v100 in ipairs(v44) do
                if v100.id == v97.id then
                    v100.content.currentState = v96;
                end;
                table.insert(v98, v100);
            end;
        end;
        v45(v98);
    end;
    local v101 = v15.useMemo(function()
        return v15.createElement(v12, {
            displayState = v48, 
            activeNotification = v46, 
            isSmallScreen = v40.isSmallScreen, 
            handleActions = v93, 
            closeNotificationDisplay = v52
        });
    end, {
        v48, 
        v46
    });
    local v111 = v15.useMemo(function()
        if v48 == v20.Initializing then
            return v15.createElement(l_LoadingSpinner_0, {
                size = UDim2.fromOffset(v5.InitializingNotifications.Size, v5.InitializingNotifications.Size), 
                position = UDim2.fromScale(0.5, 0.5), 
                anchorPoint = Vector2.new(0.5, 0.5)
            });
        else
            if v44 and #v44 > 0 then
                local v102 = {
                    UIListLayout = v15.createElement("UIListLayout", {
                        FillDirection = Enum.FillDirection.Vertical, 
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center
                    })
                };
                local v103 = false;
                local v104 = {};
                for _, v106 in ipairs(v44) do
                    if v106.notificationSourceType == "Sendr" then
                        v103 = true;
                        local l_bundleKey_0 = v106.content.bundleKey;
                        if l_bundleKey_0 and l_bundleKey_0 ~= "" then
                            if not v104[l_bundleKey_0] then
                                v104[l_bundleKey_0] = {
                                    v106
                                };
                            else
                                table.insert(v104[l_bundleKey_0], v106);
                            end;
                        end;
                    end;
                end;
                for v108, v109 in ipairs(v44) do
                    if v109.notificationSourceType == "Sendr" then
                        local l_bundleKey_1 = v109.content.bundleKey;
                        if (l_bundleKey_1 and l_bundleKey_1 ~= "") and #v104[l_bundleKey_1] > 1 then
                            if not v102[l_bundleKey_1] then
                                v102[l_bundleKey_1] = v15.createElement(v14, {
                                    layoutOrder = v108, 
                                    notifications = v104[l_bundleKey_1], 
                                    finishDismissNotification = v83, 
                                    handleActions = v93, 
                                    openMetaActions = v95
                                }, {});
                            end;
                        else
                            v102[v109.id] = v15.createElement(v13, {
                                layoutOrder = v108, 
                                notification = v109, 
                                finishDismissNotification = v83, 
                                handleActions = v93, 
                                openMetaActions = v95, 
                                collapsed = false
                            }, {});
                        end;
                    end;
                end;
                if v55.current == v21.Loading then
                    v102.LoadingMore = v15.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, v5.LoadingMoreNotifications.Size), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = math.huge
                    }, {
                        LoadingMoreSpinner = v15.createElement(l_LoadingSpinner_0, {
                            size = UDim2.fromOffset(v5.LoadingMoreNotifications.Size, v5.LoadingMoreNotifications.Size), 
                            position = UDim2.fromScale(0.5, 0.5), 
                            anchorPoint = Vector2.new(0.5, 0.5)
                        })
                    });
                end;
                if v103 then
                    return v15.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, -v59), 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundTransparency = 1
                    }, v102);
                end;
            end;
            return v15.createElement(v11);
        end;
    end, {
        v44, 
        v48, 
        v56
    });
    local function v116(v112)
        local l_Y_0 = v112.AbsoluteCanvasSize.Y;
        local l_Y_1 = v112.AbsoluteWindowSize.Y;
        local l_Y_2 = v112.CanvasPosition.Y;
        if not (l_Y_1 ~= 0 and l_Y_0 ~= 0) or v48 ~= v20.Default then
            return ;
        else
            if (l_Y_0 - l_Y_1) - v5.LoadingMoreNotifications.TriggerDistance <= l_Y_2 and v55.current == v21.Default then
                v50();
            end;
            return ;
        end;
    end;
    local v117 = not v40.isSmallScreen and 0 or math.max(not l_UserInputService_0.BottomBarSize and 0 or l_UserInputService_0.BottomBarSize.Y, not l_GuiService_0:GetSafeZoneOffsets() and 0 or l_GuiService_0:GetSafeZoneOffsets().bottom);
    return v15.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        BackgroundTransparency = 1
    }, {
        MetaActionsOpen = v15.createElement("TextButton", {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Visible = v48 == v20.MetaActions, 
            BackgroundTransparency = v41.Theme.Overlay.Transparency, 
            BackgroundColor3 = v41.Theme.Overlay.Color, 
            Text = "", 
            AutoButtonColor = false, 
            ZIndex = 2, 
            [v15.Event.Activated] = v52, 
            BorderSizePixel = 0
        }, {
            v101
        }), 
        NotificationsList = v15.createElement("ScrollingFrame", {
            Size = UDim2.new(1, 0, 1, -((v59 + v5.DefaultPadding) + v117)), 
            CanvasSize = UDim2.new(1, 0, 1, -((v59 + v5.DefaultPadding) + v117)), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, v59), 
            AnchorPoint = Vector2.new(0, 0), 
            ScrollBarThickness = 4, 
            BorderSizePixel = 0, 
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
            VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Right, 
            ScrollBarImageColor3 = v41.Theme.UIEmphasis.Color, 
            AutomaticCanvasSize = Enum.AutomaticSize.XY, 
            ElasticBehavior = Enum.ElasticBehavior.Always, 
            ScrollingEnabled = v48 == v20.Default, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            [v15.Change.CanvasPosition] = v116
        }, v111)
    });
end;
