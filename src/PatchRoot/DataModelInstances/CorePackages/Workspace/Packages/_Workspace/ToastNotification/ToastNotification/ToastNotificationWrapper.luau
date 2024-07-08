local l_UserInputService_0 = game:GetService("UserInputService");
local l_Players_0 = game:GetService("Players");
local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_HttpService_0 = game:GetService("HttpService");
local l_TouchEnabled_0 = l_UserInputService_0.TouchEnabled;
local l_Parent_0 = script.Parent;
local l_Components_0 = l_Parent_0.Components;
local l_context_0 = l_Parent_0.context;
local l_utils_0 = l_Parent_0.utils;
local v10 = require(l_utils_0.toastNotificationHelper);
local v11 = require(l_utils_0.toastNotificationSessionizationHelper);
local l_Parent_1 = l_Parent_0.Parent;
local v13 = require(l_Parent_1.NotificationsCommon);
local v14 = require(l_Parent_1.React);
local v15 = require(l_Parent_1.UIBlox);
local v16 = require(l_Parent_1.Cryo);
local _ = require(l_Parent_1.Dash);
local v18 = require(l_CorePackages_0.Logging);
local l_IsVRAppBuild_0 = require(l_Parent_1.AppCommonLib).IsVRAppBuild;
local v20 = require(script.Parent.utils.LifecycleEvents);
local l_ToastNotificationProtocol_0 = require(l_Parent_1.ToastNotificationsProtocol).ToastNotificationProtocol;
local l_LinkingProtocol_0 = require(l_Parent_1.LinkingProtocol).LinkingProtocol;
local l_Images_0 = v15.App.ImageSet.Images;
local l_ImageSetLabel_0 = v15.Core.ImageSet.ImageSetLabel;
local l_useStyle_0 = v15.Core.Style.useStyle;
local l_useRoactService_0 = require(l_Parent_1.RobloxAppHooks).useRoactService;
local l_AppNotificationService_0 = require(l_Parent_1.RoactServiceTags).AppNotificationService;
local v28 = require(l_Parent_1.SharedFlags);
local v29 = require(l_Parent_0.analytics.analyticsService);
local v30 = require(l_context_0.NotificationCardProvider);
local v31 = require(l_Components_0.NotificationCard);
local l_DeeplinkConfirmationModal_0 = v13.DeeplinkConfirmationModal;
local v33 = require(l_Components_0.SwipeDetectionWrapper);
local v34 = require(l_Components_0.ToastVRWrapper);
local v35 = require(l_Parent_0.type);
local v36 = require(l_Parent_0.constants);
local l_JoinExperience_0 = v13.JoinExperience;
local l_ixpHelper_0 = v13.ixpHelper;
local l_SpringAnimatedItem_0 = v15.Utility.SpringAnimatedItem;
local v40 = l_Images_0["icons/navigation/close"];
local l_FFlagEnableToastNotificationsForMobile_0 = require(l_Parent_1.SharedFlags).FFlagEnableToastNotificationsForMobile;
local l_FFlagPackagifyJoinExperience_0 = require(l_Parent_1.SharedFlags).FFlagPackagifyJoinExperience;
local v43 = game:DefineFastFlag("FixToastTopPosition", false);
local v44 = game:DefineFastFlag("EnableToastNotificationWrapper3", false);
local v45 = game:DefineFastFlag("EnableIrisToastNotification", false);
local v46 = game:DefineFastFlag("EnableExternalPauseToastNotification2", false);
local v47 = game:DefineFastFlag("AddToastTimeToActionTimestamp", false);
local v48 = game:DefineFastFlag("EnableToastNotificationEventMissingFieldsFix", false);
local v49 = game:DefineFastFlag("EnableToastNotificationOrientationFix", false);
local l_GetFFlagEnableShareLinkInExperienceToastNotificationFix_0 = require(l_Parent_1.SharedFlags).GetFFlagEnableShareLinkInExperienceToastNotificationFix;
local v51 = game:DefineFastFlag("EnableEnableToastSession", false);
local l_getFStringDesktopToastNotificationLayer_0 = require(l_Parent_1.SharedFlags).getFStringDesktopToastNotificationLayer;
local v53 = game:DefineFastFlag("EnableDesktopToastNotificationIxp2", false);
local v54 = game:DefineFastFlag("EnableToastLifecycleEventsHandler", false);
local l_GetFFlagSupportToastInVR_0 = v28.GetFFlagSupportToastInVR;
local l_GetFFlagToastNotificationTimerChangesEnabled_0 = v28.GetFFlagToastNotificationTimerChangesEnabled;
local l_GetFFlagHideOffscreenToasts_0 = v28.GetFFlagHideOffscreenToasts;
local v58 = {
    frequency = 4, 
    damping = 1
};
local l_getDeviceOrientation_0 = v10.getDeviceOrientation;
local l_getNotificationSize_0 = v10.getNotificationSize;
local l_marshalNotificationData_0 = v10.marshalNotificationData;
local l_marshalNotificationDataV2_0 = v10.marshalNotificationDataV2;
local l_calculateToastPosition_0 = v10.calculateToastPosition;
local l_isToastToRight_0 = v10.isToastToRight;
return function(v65)
    if v44 then
        local v66 = v65.renderLocation == v35.RenderLocationEnum.CoreScript;
        local v67 = v10.isDesktopDevice();
        if not (not l_GetFFlagSupportToastInVR_0() and l_IsVRAppBuild_0()) and not l_GuiService_0:IsTenFootInterface() then
            if (not v66 or l_FFlagEnableToastNotificationsForMobile_0()) or v67 then
                local v68 = (not l_UserInputService_0.StatusBarSize and 0 or l_UserInputService_0.StatusBarSize.Y) + 20;
                if v43 then
                    v68 = if not v66 then v36.CardTopMargin.App else v36.CardTopMargin.Experience;
                end;
                local l_default_0 = l_ToastNotificationProtocol_0.default;
                local l_default_1 = l_LinkingProtocol_0.default;
                local function _()
                    return workspace.CurrentCamera.ViewportSize;
                end;
                local function _(v72)
                    return v72 and workspace.CurrentCamera.ViewportSize.X < v36.CompactCardThreashold;
                end;
                local v74, v75 = v14.useState(l_getNotificationSize_0(v66, workspace.CurrentCamera.ViewportSize.X));
                local v76, v77 = v14.useState(l_getDeviceOrientation_0(workspace.CurrentCamera.ViewportSize));
                local v78, v79 = v14.useState(false);
                local v80, v81 = v14.useState(nil);
                local v82, v83 = v14.useState(nil);
                local v84, v85 = v14.useState(l_calculateToastPosition_0(false, l_isToastToRight_0(v76), v68));
                local v86, v87 = v14.useState(nil);
                local v88, v89 = v14.useState(nil);
                local v90, v91 = v14.useState(function()
                    return v66 and workspace.CurrentCamera.ViewportSize.X < v36.CompactCardThreashold;
                end);
                local v92, v93 = v14.useState(false);
                local v94, v95 = v14.useState(false);
                local v96, v97 = v14.useState(false);
                local v98, v99 = v14.useState(false);
                local v100, v101 = v14.useState(false);
                local v102, v103 = v14.useState(false);
                local v104, v105 = v14.useState((Instance.new("BindableEvent")));
                local v106 = l_useStyle_0();
                local v107 = if not v46 then nil else l_useRoactService_0(l_AppNotificationService_0);
                local function v110()
                    local l_ViewportSize_0 = workspace.CurrentCamera.ViewportSize;
                    local v109 = l_getDeviceOrientation_0(l_ViewportSize_0);
                    v75((l_getNotificationSize_0(v66, l_ViewportSize_0.X)));
                    v91(v66 and workspace.CurrentCamera.ViewportSize.X < v36.CompactCardThreashold);
                    if not v49 then
                        if v76 ~= v109 then
                            v77(v109);
                        end;
                        return ;
                    else
                        v77(v109);
                        return ;
                    end;
                end;
                local function _(v111)
                    l_default_0:dismissNotification(v111);
                end;
                local v113 = v98 or v100;
                local v114 = (not not l_Players_0 and l_Players_0.LocalPlayer) and l_Players_0.LocalPlayer.UserId or nil;
                local function v120(v115, v116, v117)
                    if v48 and v117 == nil then
                        return ;
                    else
                        local l_EventStream_0 = v29.EventStream;
                        if v51 then
                            v11(v115);
                        end;
                        local v119 = 0;
                        if not ((not v47 or not v117) or not v117.displayTimestamp) then
                            v119 = DateTime.now().UnixTimestampMillis - v117.displayTimestamp;
                        end;
                        v10.fireEvent(l_EventStream_0, v16.Dictionary.join({
                            action_type = v115, 
                            delivery_channel = v36.DeliveryChannel, 
                            notification_type = not not v117 and v117.notificationType or nil, 
                            notification_id = not not v117 and v117.id or nil, 
                            recipient_userid = v116 or nil, 
                            recipient_universe_id = if not not v48 and v66 then game and game.GameId else nil, 
                            client_destination = if not v66 then v36.Destinations.App else v36.Destinations.Experience, 
                            deliver_timestamp = not not v117 and v117.deliverTimestamp or nil, 
                            time_to_action_timestamp = if not v47 then nil else v119
                        }, not not v117 and v117.clientEventsPayload or {}));
                        return ;
                    end;
                end;
                local function v122(v121)
                    if not v121 then
                        v120(v35.ToastNotificationActionsEnum.ModalCancel, v114, v80);
                        v95(false);
                    end;
                    if v104 then
                        v120(v35.ToastNotificationActionsEnum.ModalConfirm, v114, v80);
                        v104:Fire(v121);
                    end;
                end;
                local v123 = v14.useCallback(function()
                    if v86 then
                        task.cancel(v86);
                    end;
                    v87(nil);
                end, {
                    v86
                });
                local function _(v124)
                    l_default_0:dismissNotification(v124);
                    v83(nil);
                    v123();
                end;
                local function _(v126)
                    local v127;
                    v127 = (v126.state and v126.state.timeOnScreenMs) and v127 / 1000;
                    return (v127 or v36.DefaultNotificationDisplayTime) + 1;
                end;
                local v132 = v14.useCallback(function(v129, v130, v131)
                    v123();
                    v87((task.delay(v130, function()
                        if not v96 then
                            v120(v35.ToastNotificationActionsEnum.Ignored, v114, v131);
                            l_default_0:dismissNotification(v129);
                            v83(nil);
                            v123();
                        end;
                    end)));
                end, {
                    v96
                });
                local v133 = v14.useCallback(function()
                    if not (not v80 or not v82) and v82.id == v80.id then
                        l_default_0:dismissNotification(v80.id);
                        v83(nil);
                        v123();
                    end;
                end, {
                    v80, 
                    v82
                });
                local function v134()
                    v120(v35.ToastNotificationActionsEnum.Dismissed, v114, v80);
                    v133();
                end;
                local v135 = v14.useCallback(function()
                    if not v66 or not v104 then
                        return true;
                    else
                        v95(true);
                        return v104.Event:Wait();
                    end;
                end, {
                    v66, 
                    v104
                });
                local function v141()
                    if not ((not v80 or not v82) or v86) then
                        local l_v132_0 = v132;
                        local l_id_0 = v80.id;
                        local v138;
                        if not v45 then
                            v138 = v36.DefaultNotificationDisplayTimeOnUnpause;
                        else
                            local l_v80_0 = v80;
                            local v140;
                            v140 = (l_v80_0.state and l_v80_0.state.timeOnScreenMs) and v140 / 1000;
                            v138 = (v140 or v36.DefaultNotificationDisplayTime) + 1;
                        end;
                        l_v132_0(l_id_0, v138, v80);
                    end;
                end;
                local function _(v142, v143, v144)
                    if not v142 then
                        v144();
                        return ;
                    else
                        v143();
                        return ;
                    end;
                end;
                local v153 = v14.useCallback(function(v146)
                    if not v92 then
                        v93(true);
                        if v146.eventName then
                            v120(v146.eventName, v114, v80);
                        end;
                        if not ((not v54 or not v146.actionEventParams) or not v80) then
                            v20:DispatchEvent(v20.ToastEvents.UserAction, v80.notificationType, {
                                notificationData = v80, 
                                visualItem = v146, 
                                userActionType = "click", 
                                parameters = v146.actionEventParams
                            });
                        end;
                        if v146.actions and #v146.actions > 0 then
                            for _, v148 in ipairs(v146.actions) do
                                if v148.actionType == v35.ActionTypeEnum.Dismiss then
                                    v133();
                                elseif v148.actionType == v35.ActionTypeEnum.Deeplink then
                                    if v135() then
                                        local _ = nil;
                                        if not if not l_FFlagPackagifyJoinExperience_0() then pcall(function()
                                            if not ((not l_FFlagEnableToastNotificationsForMobile_0() or not v66) or v67) then
                                                game:Shutdown();
                                            end;
                                            l_default_1:isURLRegistered(v148.path):andThen(function(v150)
                                                if not v150 then
                                                    if not (not l_GetFFlagEnableShareLinkInExperienceToastNotificationFix_0() or not v66) then
                                                        game:Shutdown();
                                                        l_default_1:detectURL(v148.path);
                                                    end;
                                                    return ;
                                                else
                                                    l_default_1:detectURL(v148.path);
                                                    return ;
                                                end;
                                            end);
                                        end) else l_JoinExperience_0(v148.path, v66) then
                                            v120(v35.ToastNotificationActionsEnum.DeeplinkFailed, v114, v80);
                                            v133();
                                            break;
                                        else
                                            v95(false);
                                            if v80 then
                                                l_default_0:dismissNotification(v80.id);
                                                break;
                                            else
                                                break;
                                            end;
                                        end;
                                    end;
                                elseif v45 and v148.actionType == v35.ActionTypeEnum.VoltronBroadcast then
                                    local l_status_0, l_result_0 = pcall(function()
                                        return l_HttpService_0:JSONDecode(v148.parameters);
                                    end);
                                    if not l_status_0 then
                                        v18.warn("Invalid decoded payload for voltronBroadcast");
                                    else
                                        l_default_0:voltronBroadcast(v148.messageId, l_result_0);
                                    end;
                                end;
                            end;
                        end;
                        v93(false);
                        return ;
                    else
                        return ;
                    end;
                end, {
                    v133, 
                    v92, 
                    v135
                });
                local function v157(v154, v155)
                    if v47 then
                        v154.displayTimestamp = DateTime.now().UnixTimestampMillis;
                    end;
                    v81(v154);
                    v120(if v155 == "update" then v35.ToastNotificationActionsEnum.Update else v35.ToastNotificationActionsEnum.Display, v114, v154);
                    local v156;
                    v156 = (v154.state and v154.state.timeOnScreenMs) and v156 / 1000;
                    v132(v154.id, (v156 or v36.DefaultNotificationDisplayTime) + 1, v154);
                    v89(nil);
                end;
                local function _(v158)
                    if v88 then
                        task.cancel(v88);
                    end;
                    v89((task.delay(v36.DisplayNotificationDelay, function()
                        v157(v158, "display");
                        if v54 then
                            v20:DispatchEvent(v20.ToastEvents.Display, v158.notificationType, v158);
                        end;
                    end)));
                end;
                local v162 = v14.useCallback(function(v160)
                    if not ((not v67 or not v53) or not v160) and v160.notificationType ~= v35.NotificationTypeEnum.CallReceived then
                        l_ixpHelper_0.logUserLayerExposure(l_getFStringDesktopToastNotificationLayer_0());
                    end;
                    if not (not v160 or not v160.content) and v160.content.id ~= nil then
                        local v161 = nil;
                        v161 = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then l_marshalNotificationData_0(v160.content, v160.deliverTimestamp) else l_marshalNotificationDataV2_0(v160);
                        v83(v161);
                        if v54 then
                            v20:DispatchEvent(v20.ToastEvents.AttemptDisplay, v161.notificationType, v161);
                            return ;
                        end;
                    else
                        v83(nil);
                    end;
                end, {});
                v14.useEffect(function()
                    if v82 then
                        if v80 and v80.id == v82.id then
                            v157(v82, "update");
                            return ;
                        else
                            local l_v82_0 = v82;
                            if v88 then
                                task.cancel(v88);
                            end;
                            v89((task.delay(v36.DisplayNotificationDelay, function()
                                v157(l_v82_0, "display");
                                if v54 then
                                    v20:DispatchEvent(v20.ToastEvents.Display, l_v82_0.notificationType, l_v82_0);
                                end;
                            end)));
                        end;
                    end;
                end, {
                    v82
                });
                v14.useEffect(function()
                    local v164;
                    if not (not v82 or not v80) then
                        v164 = true;
                        if not (v82.id ~= v80.id) then
                            goto label0;
                        end;
                    end;
                    v164 = false;
                    ::label0::;
                    v79(v164);
                end, {
                    v82, 
                    v80
                });
                v14.useEffect(function()
                    if not v46 or not v107 then
                        return function()
                        end;
                    else
                        local v166 = v107.RobloxEventReceived:Connect(function(v165)
                            if v165.namespace == "AppInput" then
                                if v165.detailType == "Focused" then
                                    v103(false);
                                    return ;
                                elseif v165.detailType == "Unfocused" then
                                    v103(true);
                                end;
                            end;
                        end);
                        return function()
                            v166:Disconnect();
                        end;
                    end;
                end, {});
                v14.useEffect(function()
                    local _ = nil;
                    v97(if not v46 then v78 and ((v92 or v98) or v100) else v78 and (((v92 or v98) or v100) or v102));
                end, {
                    v78, 
                    v92, 
                    v98, 
                    v100, 
                    v102
                });
                v14.useEffect(function()
                    local l_v96_0 = v96;
                    local l_v123_0 = v123;
                    local l_v141_0 = v141;
                    if not l_v96_0 then
                        l_v141_0();
                        return ;
                    else
                        l_v123_0();
                        return ;
                    end;
                end, {
                    v96
                });
                v14.useEffect(function()
                    v85((l_calculateToastPosition_0(v78, l_isToastToRight_0(v76), v68)));
                end, {
                    v76, 
                    v78
                });
                v14.useEffect(function()
                    v110();
                    local v171 = workspace.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v110);
                    return function()
                        if v171 then
                            v171:Disconnect();
                        end;
                    end;
                end, {});
                v14.useEffect(function()
                    return function()
                        if v88 then
                            task.cancel(v88);
                        end;
                        if v86 then
                            task.cancel(v86);
                        end;
                        if v104 then
                            v105(nil);
                            v104:Fire(false);
                            v104:Destroy();
                        end;
                    end;
                end, {});
                v14.useEffect(function()
                    if not v67 or not v53 then
                        task.delay(0, function()
                            local v172 = if not v66 then {
                                v35.ChannelListEnum.App, 
                                v35.ChannelListEnum.Dual
                            } else {
                                v35.ChannelListEnum.Experience, 
                                v35.ChannelListEnum.Dual
                            };
                            if v67 then
                                table.insert(v172, v35.ChannelListEnum.Desktop);
                            end;
                            l_default_0:setupNotifications(v172);
                        end);
                        return ;
                    else
                        local v173 = l_ixpHelper_0.getIxpLayerData(l_getFStringDesktopToastNotificationLayer_0());
                        local v174 = v173 and v173.isDesktopToastNotificationEnabled;
                        task.delay(0, function()
                            local v175 = {
                                v35.ChannelListEnum.Desktop
                            };
                            if v174 then
                                table.insert(v175, v35.ChannelListEnum.Dual);
                                if not v66 then
                                    table.insert(v175, v35.ChannelListEnum.App);
                                else
                                    table.insert(v175, v35.ChannelListEnum.Experience);
                                end;
                            end;
                            l_default_0:setupNotifications(v175);
                        end);
                        return ;
                    end;
                end, {});
                v14.useEffect(function()
                    local v176 = l_default_0:listenToDisplayNotification(v162);
                    return function()
                        v176:Disconnect();
                    end;
                end, {
                    v162
                });
                if not l_GetFFlagSupportToastInVR_0() then
                    return v14.createElement("ScreenGui", {
                        DisplayOrder = v65.displayOrder, 
                        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                        IgnoreGuiInset = not v43
                    }, {
                        Toast = v14.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                            regularProps = {
                                ClipsDescendants = false, 
                                Size = v74, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                Active = true, 
                                [v14.Event.MouseEnter] = function()
                                    v120(v35.ToastNotificationActionsEnum.Hover, v114, v80);
                                    v99(true);
                                end, 
                                [v14.Event.MouseLeave] = function()
                                    v99(false);
                                end
                            }, 
                            animatedValues = v84, 
                            springOptions = v58, 
                            mapValuesToProps = function(v177)
                                return {
                                    Position = UDim2.new(v177.positionX, v177.positionXOffset, v177.positionY, v177.positionYOffset), 
                                    AnchorPoint = Vector2.new(v177.anchorX, v177.anchorY)
                                };
                            end
                        }, {
                            SwipeDetector = v14.createElement(v33, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                swipeEnabled = v78, 
                                swipeCallback = function(v178)
                                    if not (v178 ~= Enum.SwipeDirection.Up) or v178 == Enum.SwipeDirection.Right then
                                        v120(v35.ToastNotificationActionsEnum.Dismissed, v114, v80);
                                        v133();
                                    end;
                                end
                            }, {
                                NotificationProvider = v14.createElement(v30, {
                                    state = v80 and v80.state, 
                                    isCompact = v90, 
                                    handleActions = v153, 
                                    notificationReceivedTimestampMs = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.notificationReceivedTimestampMs, 
                                    timers = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.timers, 
                                    displayTimestampMs = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.displayTimestamp
                                }, {
                                    NotificationCard = v14.createElement(v31, {
                                        LayoutOrder = 2, 
                                        isHover = v113
                                    }), 
                                    ToastCloseButton = (v113 and not l_TouchEnabled_0) and v14.createElement("TextButton", {
                                        ZIndex = 2, 
                                        LayoutOrder = 1, 
                                        AnchorPoint = Vector2.new(0, 0), 
                                        Size = UDim2.new(0, v36.CardSizeDefault.closeButton, 0, v36.CardSizeDefault.closeButton), 
                                        Position = UDim2.new(0, -10, 0, -10), 
                                        BackgroundTransparency = v106.Theme.BackgroundUIDefault.Transparency, 
                                        BackgroundColor3 = v106.Theme.BackgroundUIDefault.Color, 
                                        Text = "", 
                                        [v14.Event.Activated] = v134, 
                                        [v14.Event.MouseEnter] = function()
                                            v101(true);
                                        end, 
                                        [v14.Event.MouseLeave] = function()
                                            v101(false);
                                        end
                                    }, {
                                        Border = v14.createElement("UIStroke", {
                                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                                            Color = v106.Theme.UIDefault.Color
                                        }), 
                                        UICorner = v14.createElement("UICorner", {
                                            CornerRadius = v36.DefaultCardCloseButtonCornerRadius
                                        }), 
                                        CloseButtonIcon = v14.createElement(l_ImageSetLabel_0, {
                                            AnchorPoint = Vector2.new(0.5, 0.5), 
                                            BackgroundTransparency = 1, 
                                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                                            Size = UDim2.new(0, v36.CardSizeDefault.closeIcon, 0, v36.CardSizeDefault.closeIcon), 
                                            Image = v40, 
                                            ImageColor3 = v106.Theme.SystemPrimaryDefault.Color
                                        })
                                    })
                                })
                            })
                        }), 
                        DeeplinkConfirmationModal = v94 and v14.createElement(l_DeeplinkConfirmationModal_0, {
                            closeCallback = v122
                        })
                    });
                else
                    local v179 = l_IsVRAppBuild_0();
                    local v180 = v78 or not v179;
                    local v181 = (v113 and not l_TouchEnabled_0) and not v179;
                    local v184 = v14.useMemo(function()
                        return v14.createElement(l_SpringAnimatedItem_0.AnimatedFrame, {
                            regularProps = {
                                ClipsDescendants = false, 
                                Size = v74, 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                BackgroundTransparency = 1, 
                                Active = true, 
                                Visible = if not l_GetFFlagHideOffscreenToasts_0() then v180 else v180 and v80 ~= nil, 
                                [v14.Event.MouseEnter] = function()
                                    v120(v35.ToastNotificationActionsEnum.Hover, v114, v80);
                                    v99(true);
                                end, 
                                [v14.Event.MouseLeave] = function()
                                    v99(false);
                                end
                            }, 
                            animatedValues = v84, 
                            springOptions = v58, 
                            mapValuesToProps = function(v182)
                                return {
                                    Position = if not v179 then UDim2.new(v182.positionX, v182.positionXOffset, v182.positionY, v182.positionYOffset) else UDim2.new(0.5, 0, 0.5, 0), 
                                    AnchorPoint = if not v179 then Vector2.new(v182.anchorX, v182.anchorY) else Vector2.new(0.5, 0.5)
                                };
                            end, 
                            onComplete = if not l_GetFFlagHideOffscreenToasts_0() then nil else function()
                                if not v78 then
                                    v81(nil);
                                end;
                            end
                        }, {
                            SwipeDetector = v14.createElement(v33, {
                                Size = UDim2.new(1, 0, 0, 0), 
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                swipeEnabled = v78, 
                                swipeCallback = function(v183)
                                    if not (v183 ~= Enum.SwipeDirection.Up) or v183 == Enum.SwipeDirection.Right then
                                        v120(v35.ToastNotificationActionsEnum.Dismissed, v114, v80);
                                        v133();
                                    end;
                                end
                            }, {
                                NotificationProvider = v14.createElement(v30, {
                                    state = v80 and v80.state, 
                                    isCompact = v90, 
                                    handleActions = v153, 
                                    notificationReceivedTimestampMs = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.notificationReceivedTimestampMs, 
                                    timers = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.timers, 
                                    displayTimestampMs = if not l_GetFFlagToastNotificationTimerChangesEnabled_0() then nil else v80 and v80.displayTimestamp
                                }, {
                                    NotificationCard = v14.createElement(v31, {
                                        LayoutOrder = 2, 
                                        isHover = v113
                                    }), 
                                    ToastCloseButton = if not v181 then nil else v14.createElement("TextButton", {
                                        ZIndex = 2, 
                                        LayoutOrder = 1, 
                                        AnchorPoint = Vector2.new(0, 0), 
                                        Size = UDim2.new(0, v36.CardSizeDefault.closeButton, 0, v36.CardSizeDefault.closeButton), 
                                        Position = UDim2.new(0, -10, 0, -10), 
                                        BackgroundTransparency = v106.Theme.BackgroundUIDefault.Transparency, 
                                        BackgroundColor3 = v106.Theme.BackgroundUIDefault.Color, 
                                        Text = "", 
                                        [v14.Event.Activated] = v134, 
                                        [v14.Event.MouseEnter] = function()
                                            v101(true);
                                        end, 
                                        [v14.Event.MouseLeave] = function()
                                            v101(false);
                                        end
                                    }, {
                                        Border = v14.createElement("UIStroke", {
                                            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                                            Color = v106.Theme.UIDefault.Color
                                        }), 
                                        UICorner = v14.createElement("UICorner", {
                                            CornerRadius = v36.DefaultCardCloseButtonCornerRadius
                                        }), 
                                        CloseButtonIcon = v14.createElement(l_ImageSetLabel_0, {
                                            AnchorPoint = Vector2.new(0.5, 0.5), 
                                            BackgroundTransparency = 1, 
                                            Position = UDim2.new(0.5, 0, 0.5, 0), 
                                            Size = UDim2.new(0, v36.CardSizeDefault.closeIcon, 0, v36.CardSizeDefault.closeIcon), 
                                            Image = v40, 
                                            ImageColor3 = v106.Theme.SystemPrimaryDefault.Color
                                        })
                                    })
                                })
                            })
                        });
                    end, {
                        v36, 
                        v106, 
                        v80, 
                        v180, 
                        v78, 
                        v90, 
                        v181, 
                        v113, 
                        v84, 
                        v134, 
                        v99, 
                        v101, 
                        v153
                    });
                    if not v179 then
                        return v14.createElement("ScreenGui", {
                            DisplayOrder = v65.displayOrder, 
                            ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                        }, {
                            Toast = v184, 
                            DeeplinkConfirmationModal = v94 and v14.createElement(l_DeeplinkConfirmationModal_0, {
                                closeCallback = v122
                            })
                        });
                    else
                        return v14.createElement(v34, {
                            isConfirmModalOpen = v94, 
                            isToastOpen = v78, 
                            isCoreScript = v66, 
                            ToastComponent = v184, 
                            ConfirmationModalComponent = v14.createElement(l_DeeplinkConfirmationModal_0, {
                                closeCallback = v122, 
                                backgroundTransparency = 1
                            })
                        });
                    end;
                end;
            else
                return nil;
            end;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
