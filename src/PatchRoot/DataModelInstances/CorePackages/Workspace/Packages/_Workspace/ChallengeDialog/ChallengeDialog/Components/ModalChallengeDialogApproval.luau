local l_script_FirstAncestor_0 = script:FindFirstAncestor("ChallengeDialog");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.UIBlox);
local v4 = require(l_Parent_0.RoactRodux);
local v5 = require(l_Parent_0.HttpRequest);
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_NavigateDown_0 = require(l_Parent_0.NavigationRodux).Thunks.NavigateDown;
local l_useLocalization_0 = require(l_Parent_0.Localization).Hooks.useLocalization;
local v9 = require(l_script_FirstAncestor_0.Common.FullPageModalWrapper);
local v10 = require(l_script_FirstAncestor_0.Common.Lock);
local v11 = require(l_script_FirstAncestor_0.Common.ModalTextComponent);
local v12 = require(l_script_FirstAncestor_0.Common.ModalErrorText);
local v13 = require(l_script_FirstAncestor_0.Common.ModalButtonConfig);
local v14 = require(l_script_FirstAncestor_0.Common.ModalFooter);
local v15 = require(l_script_FirstAncestor_0.Thunks.FinishDialog);
local v16 = require(l_script_FirstAncestor_0.Enum.ModalState);
local v17 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogAction);
local v18 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogError);
local v19 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogType);
local v20 = require(l_script_FirstAncestor_0.Enum.ChallengeDialogState);
local l_getFormattedDeviceType_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedDeviceType;
local l_getFormattedRegionalLocation_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedRegionalLocation;
local l_getFormattedIPAddress_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedIPAddress;
local l_getFormattedDateTime_0 = require(l_script_FirstAncestor_0.Common.Utils).getFormattedDateTime;
local v25 = require(l_script_FirstAncestor_0.Analytics.EventService);
local v26 = require(l_script_FirstAncestor_0.Analytics.MetricsService);
local v27 = require(l_script_FirstAncestor_0.Common.ModalTextSizes);
local l_DEFAULT_PADDING_0 = require(l_script_FirstAncestor_0.Common.Constants).DEFAULT_PADDING;
local l_X_BUTTON_SIZE_0 = require(l_script_FirstAncestor_0.Common.Constants).X_BUTTON_SIZE;
local l_ButtonType_0 = v3.App.Button.Enum.ButtonType;
local l_useStyle_0 = v3.Core.Style.useStyle;
local function v35(v32, v33, v34)
    return {
        approve = "Authentication.TwoStepVerification.Action.Approve", 
        deny = "Authentication.TwoStepVerification.Action.Deny", 
        description = "Authentication.TwoStepVerification.Description.LoginToNewDevice", 
        deviceTypeLabel = "Authentication.TwoStepVerification.Label.DeviceTypeLabel", 
        locationLabel = "Authentication.TwoStepVerification.Label.LocationLabel", 
        ipAddressLabel = "Authentication.TwoStepVerification.Label.IPAddressLabel", 
        dateTimeLabel = "Authentication.TwoStepVerification.Label.DateTimeLabel", 
        unknownDeviceType = "Authentication.TwoStepVerification.Label.UnknownDevice", 
        unknownLocation = "Authentication.TwoStepVerification.Label.UnknownLocation", 
        unknownIPAddress = "Authentication.TwoStepVerification.Label.UnknownIPAddress", 
        location = {
            "Authentication.TwoStepVerification.Label.Location"; 
            city = v32, 
            subdivision = v33, 
            country = v34
        }, 
        locationWithoutCity = {
            "Authentication.TwoStepVerification.Label.LocationWithoutCity"; 
            subdivision = v33, 
            country = v34
        }, 
        locationWithoutSubdivision = {
            "Authentication.TwoStepVerification.Label.LocationWithoutSubdivision"; 
            city = v32, 
            country = v34
        }, 
        locationWithoutCountry = {
            "Authentication.TwoStepVerification.Label.LocationWithoutCountry"; 
            city = v32, 
            subdivision = v33
        }, 
        errorMessage = "Authentication.TwoStepVerification.Response.DefaultError", 
        helpMessage = "Authentication.TwoStepVerification.Label.NeedHelpMessage"
    };
end;
local v36 = v5.config({
    requestFunction = v5.requestFunctions.RequestInternal
});
return v4.connect(function(_, _)
    return {};
end, function(v39)
    return {
        navigateToPage = function(v40)
            return v39(l_NavigateDown_0(v40));
        end, 
        finishDialog = function(v41, v42, v43)
            return v39(v15(v41, v42, v43));
        end
    };
end)(function(v44)
    local v45, v46 = v2.useState(false);
    local v47, v48 = v2.useState(false);
    local v49, v50 = v2.useState(Vector2.new(0, 0));
    local v51, v52 = v2.useState(Vector2.new(0, 0));
    local v53, v54 = v2.useState(nil);
    local l_Theme_0 = l_useStyle_0().Theme;
    local v56 = l_useLocalization_0((v35(v44.dialogItem.origin.city, v44.dialogItem.origin.subdivision, v44.dialogItem.origin.country)));
    local function v58(v57)
        if v49 ~= v57.AbsoluteSize then
            v50(v57.AbsoluteSize);
        end;
    end;
    local function v60(v59)
        if v51 ~= v59.AbsoluteSize then
            v52(v59.AbsoluteSize);
        end;
    end;
    local function v62(v61)
        if v61.AbsoluteSize.Y < v61.CanvasSize.Y.Offset then
            v26.loginInfoOverflowed();
        end;
    end;
    local function v69(v63, v64, v65, v66)
        v44.finishDialog(v36, v63, v64):andThen(function(_)
            v65();
        end):catch(function(v68)
            if v68 == v18.InconsistentStateTransition then
                v44.navigateToModalState({
                    modalState = v16.ChallengeDialogAlreadyCompleted
                });
                return ;
            else
                v66(v68);
                return ;
            end;
        end):await();
    end;
    local function v71()
        v54(nil);
        v46(true);
        v69({
            type = v44.dialogItem.type, 
            typeInternalId = v44.dialogItem.typeInternalId
        }, v17.Approve, function()
            v25.sendDialogActionSelectedEvent(v19.toRawValue(v19.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v44.dialogItem.typeInternalId, v20.toRawValue(v20.DIALOG_STATE_APPROVED));
            v46(false);
            v44.closeModal();
        end, function(v70)
            v46(false);
            v54(v70);
        end);
    end;
    local function v73()
        v54(nil);
        v48(true);
        v69({
            type = v44.dialogItem.type, 
            typeInternalId = v44.dialogItem.typeInternalId
        }, v17.Deny, function()
            v25.sendDialogActionSelectedEvent(v19.toRawValue(v19.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v44.dialogItem.typeInternalId, v20.toRawValue(v20.DIALOG_STATE_DENIED));
            v48(false);
            v44.navigateToModalState({
                modalState = v16.ChallengeDialogDenied
            });
        end, function(v72)
            v48(false);
            v54(v72);
        end);
    end;
    local function v75()
        v69({
            type = v44.dialogItem.type, 
            typeInternalId = v44.dialogItem.typeInternalId
        }, v17.Deny, function()
            v25.sendDialogAbandonedEvent(v19.toRawValue(v19.DIALOG_TYPE_APPROVAL_2SV_LOGIN), v44.dialogItem.typeInternalId);
            v44.closeModal();
        end, function(_)
            v44.closeModal();
        end);
    end;
    local function v80(v76, v77, v78, v79)
        return v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Size = UDim2.fromScale(1, 0), 
            LayoutOrder = v79
        }, {
            ListLayout = v2.createElement("UIListLayout", {
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                Padding = UDim.new(0, l_DEFAULT_PADDING_0 / 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Label = v2.createElement(v11, {
                layoutOrder = 1, 
                contentWidth = v78, 
                size = v27.Footer, 
                text = v76
            }), 
            Info = v2.createElement(v11, {
                layoutOrder = 2, 
                contentWidth = v78, 
                useEmphasis = true, 
                text = v77
            })
        });
    end;
    return v2.createElement(v9, {
        title = "", 
        closeModal = v75, 
        makeBodyFragment = function(v81)
            return v2.createElement(v2.Fragment, nil, {
                Description = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Size = UDim2.fromScale(1, 0), 
                    LayoutOrder = 1, 
                    [v2.Change.AbsoluteSize] = v58
                }, {
                    ListLayout = v2.createElement("UIListLayout", {
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        Padding = UDim.new(0, l_DEFAULT_PADDING_0), 
                        SortOrder = Enum.SortOrder.LayoutOrder
                    }), 
                    ModalBodyText = v2.createElement(v11, {
                        layoutOrder = 1, 
                        contentWidth = v81 - 2 * l_X_BUTTON_SIZE_0, 
                        useBold = true, 
                        useEmphasis = true, 
                        size = v27.Header1, 
                        text = v56.description
                    }), 
                    Lock = v2.createElement(v10, {
                        layoutOrder = 2
                    })
                }), 
                LoginAttemptInfoScrollable = v2.createElement("ScrollingFrame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, -v49.Y - l_DEFAULT_PADDING_0), 
                    CanvasSize = UDim2.new(1, 0, 0, v51.Y), 
                    ScrollingDirection = Enum.ScrollingDirection.Y, 
                    ScrollBarImageColor3 = l_Theme_0.UIEmphasis.Color, 
                    LayoutOrder = 2, 
                    [v2.Change.CanvasSize] = v62
                }, {
                    LoginAttemptInfoCanvas = v2.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        LayoutOrder = 1, 
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        Size = UDim2.fromScale(1, 0), 
                        [v2.Change.AbsoluteSize] = v60
                    }, {
                        ListLayout = v2.createElement("UIListLayout", {
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            Padding = UDim.new(0, l_DEFAULT_PADDING_0 / 2), 
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }), 
                        ContentPadding = v2.createElement("UIPadding", {
                            PaddingBottom = UDim.new(0, l_DEFAULT_PADDING_0 / 2)
                        }), 
                        DeviceType = v80(v56.deviceTypeLabel, l_getFormattedDeviceType_0(v44.dialogItem.origin.deviceType, v44.dialogItem.origin.deviceOs, v56), v81, 1), 
                        RegionalLocation = v80(v56.locationLabel, l_getFormattedRegionalLocation_0(v44.dialogItem.origin.city, v44.dialogItem.origin.subdivision, v44.dialogItem.origin.country, v56), v81, 2), 
                        IPAddress = v80(v56.ipAddressLabel, l_getFormattedIPAddress_0(v44.dialogItem.origin.ipAddress, v56), v81, 3), 
                        DateTimeInfo = v80(v56.dateTimeLabel, l_getFormattedDateTime_0(v44.dialogItem.origin.timestamp, v56), v81, 4)
                    })
                })
            });
        end, 
        buttonConfig = v13({
            {
                isDisabled = v45 or v47, 
                isLoading = v45, 
                onActivated = v71, 
                text = v56.approve, 
                type = l_ButtonType_0.Secondary
            }, 
            {
                isDisabled = v47 or v45, 
                isLoading = v47, 
                onActivated = v73, 
                text = v56.deny, 
                type = l_ButtonType_0.Secondary
            }
        }), 
        footerContent = v14(function(v82)
            return v2.createElement(v2.Fragment, nil, {
                ErrorMessage = v53 and v2.createElement(v12, {
                    errorText = v56.errorMessage, 
                    contentWidth = v82, 
                    layoutOrder = 1
                }), 
                SupportLink = v2.createElement(v11, {
                    BackgroundTransparency = 0, 
                    layoutOrder = 2, 
                    text = v56.helpMessage, 
                    contentWidth = v82, 
                    size = v27.Footer, 
                    onActivated = function()
                        v44.navigateToPage({
                            name = l_AppPage_0.GenericWebPage, 
                            detail = "https://en.help.roblox.com/hc/en-us/articles/212459863-Add-2-Step-Verification-to-Your-Account", 
                            extraProps = {
                                title = ""
                            }
                        });
                    end
                })
            });
        end)
    });
end);
