local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_CorePackages_0.Roact);
local l_withStyle_0 = require(l_CorePackages_0.UIBlox).Style.withStyle;
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.RoactGamepad);
local v7 = require(l_CorePackages_0.Cryo);
local v8 = require(l_Modules_0.Common.Immutable);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v11 = require(l_Modules_0.LuaApp.Themes.Colors);
local v12 = require(l_Modules_0.LuaApp.Constants);
local v13 = require(l_CorePackages_0.Packages.React);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local l_getSafeAreaSize_0 = require(l_CorePackages_0.Workspace.Packages.InputUi).getSafeAreaSize;
local v17 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v17.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v17.FocusNavigableSurfaceIdentifierEnum;
local v22 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v17.FocusNavigationEventNameEnum;
local v24 = require(l_Modules_0.LuaApp.Components.ScreenGuiWithBlurControl);
local v25 = require(l_Modules_0.LuaApp.Thunks.CloseCentralOverlay);
local v26 = require(l_Modules_0.LuaApp.Components.CrossPlatformCompatibility.VRCentralOverlay);
local v27 = {
    [v10.PlacesList] = true, 
    [v10.PeopleList] = true, 
    [v10.ExperienceGuidelinesExplained] = true, 
    [v10.PurchaseGame] = true, 
    [v10.PurchaseGameRobuxShortfall] = true, 
    [v10.LeaveRobloxAlert] = true, 
    [v10.ReportLogsOverlay] = true, 
    [v10.ConfirmSignOut] = true, 
    [v10.UpdateRequiredPrompt] = true, 
    [v10.AgreeToPhoneNumberVerification] = true, 
    [v10.DevSubMore] = true, 
    [v10.DevSubConfirmCancel] = true, 
    [v10.TencentNoticePopup] = true, 
    [v10.SignUpBirthdayPickerOverlay] = true, 
    [v10.LoginPasswordResetPrompt] = true, 
    [v10.LoginEmailVerificationPrompt] = true, 
    [v10.EmailVerificationUpsellOverlay] = true, 
    [v10.PhoneVerificationUpsellOverlay] = true, 
    [v10.PhoneVerificationUpsellOverlayWrapper] = true, 
    [v10.VoicePhoneVerificationUpsellOverlayWrapper] = true, 
    [v10.ContactMethodPromptModalOverlay] = true, 
    [v10.CrossDeviceCodePrompt] = true, 
    [v10.CrossDeviceLoginConfirmation] = true, 
    [v10.VerifiedEnableVoice] = true, 
    [v10.UserAgreementsUpdatedPopup] = true, 
    [v10.VNGUserAgreementsPopup] = true, 
    [v10.VerifyPhoneNumber] = true, 
    [v10.AccountSecurityPromptOverlay] = true, 
    [v10.CameraPermissionPrompt] = true, 
    [v10.AccountAuthenticationFailureOverlay] = true, 
    [v10.UserAgreementsPrompt] = true, 
    [v10.UserAgreementsSecondPrompt] = true, 
    [v10.SimpleTextAlertPrompt] = true, 
    [v10.FindFriendsModal] = true, 
    [v10.ContactsList] = true, 
    [v10.PurchasePass] = true, 
    [v10.PurchasePassInsufficientRobux] = true, 
    [v10.IapExperienceAnimator] = true, 
    [v10.DiscoverabilityUpsell] = not not require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP.SetupEnabled() or nil, 
    [v10.SurveyPrompt] = true, 
    [v10.GamepadDisconnected] = true, 
    [v10.AccountSelector] = not not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableLoginAccountSelector)() or nil, 
    [v10.EmailOtp] = not not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableOtpEmailLogin)() or nil, 
    [v10.NewAppAvailableModal] = not not require(l_Modules_0.LuaApp.Flags.GetFFlagEnableVNGNewAppAvailableModal)() or nil, 
    [v10.AccountSwitchingErrorOverlay] = not not require(l_Modules_0.LuaApp.Flags.FFlagEnableLuaAccountSwitch) or nil, 
    [v10.CloseOnlyInteractiveAlert] = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppSortTooltipEnableVR() or nil, 
    [v10.SquadLeavePrompt] = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagLuaAppEnableSquadPage() or nil, 
    [v10.VngContactInfoFormWebviewPopup] = true, 
    [v10.VngComplianceLoadingPopup] = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow() or nil, 
    [v10.KISAPopUpAgreements] = not not require(l_Modules_0.LuaApp.Flags.FFlagEnableKoreaKISACompliance) or nil, 
    [v10.ItemsReceivedAlert] = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagItemsReceivedAlert() or nil, 
    [v10.VngAppUpsell] = not not require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppHomeVngAppUpsell or nil
};
local l_OverlayComponent_0 = require(l_Modules_0.LuaApp.Components.CentralOverlayUtils).OverlayComponent;
local v29 = v3.PureComponent:extend("CentralOverlay");
v29.defaultProps = {
    hideCentralOverlay = false
};
v29.init = function(v30)
    v30.focusController = v6.createFocusController();
    v30.defaultChildRef = v3.createRef();
end;
v29.render = function(v31)
    local l_displayOrder_0 = v31.props.displayOrder;
    local l_overlayComponent_0 = v31.props.overlayComponent;
    local l_arguments_0 = v31.props.arguments;
    local l_screenSize_0 = v31.props.screenSize;
    local l_globalGuiInset_0 = v31.props.globalGuiInset;
    local l_shouldCreateBackgroundWrapper_0 = v31.props.shouldCreateBackgroundWrapper;
    local l_hideOverlay_0 = v31.props.hideOverlay;
    if not (l_screenSize_0.X > 0) or l_screenSize_0.Y <= 0 then
        return nil;
    elseif not l_hideOverlay_0 then
        local v39 = l_getSafeAreaSize_0(l_screenSize_0, l_globalGuiInset_0);
        return l_withStyle_0(function(v40)
            local l_Black_0 = v11.Black;
            local v42 = 0.3;
            if v40 then
                if v31.props.includeStatusBar then
                    v39 = UDim2.new(0, v39.X.Offset, 0, v39.Y.Offset + v12.BOTTOM_BAR_SIZE);
                end;
                l_Black_0 = v40.Theme.Overlay.Color;
                v42 = v40.Theme.Overlay.Transparency;
            end;
            l_arguments_0 = v7.Dictionary.join(l_arguments_0, {
                defaultChildRef = v31.defaultChildRef, 
                focusController = v31.focusController, 
                closeCentralOverlayThunk = v25
            });
            return v13.createElement(v3.Portal, {
                target = l_CoreGui_0
            }, {
                PortalUIForOverlay = l_overlayComponent_0 and v13.createElement(v24, {
                    ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                    DisplayOrder = l_displayOrder_0
                }, {
                    WrappingFrame = v13.createElement("Frame", {
                        Size = UDim2.fromScale(1, 1), 
                        BackgroundTransparency = 1, 
                        ref = v31.props.forwardRef, 
                        Selectable = false, 
                        SelectionGroup = true, 
                        SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorUp = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
                        SelectionBehaviorRight = Enum.SelectionBehavior.Stop
                    }, {
                        OverlayComponent = not not l_shouldCreateBackgroundWrapper_0 and v13.createElement("Frame", {
                            Position = UDim2.fromOffset(-l_globalGuiInset_0.left, -l_globalGuiInset_0.top), 
                            Size = UDim2.fromOffset(l_screenSize_0.X, l_screenSize_0.Y), 
                            BackgroundColor3 = l_Black_0, 
                            BackgroundTransparency = v42, 
                            BorderSizePixel = 0, 
                            Selectable = false, 
                            Active = true
                        }, {
                            SafeAreaFrame = v13.createElement("Frame", {
                                Position = UDim2.fromOffset(l_globalGuiInset_0.left, l_globalGuiInset_0.top), 
                                Size = v39, 
                                BackgroundTransparency = 1, 
                                ClipsDescendants = true, 
                                Selectable = false
                            }, {
                                Prompt = if not l_overlayComponent_0 then nil else v13.createElement(l_overlayComponent_0, v8.JoinDictionaries(l_arguments_0, {
                                    containerWidth = v39.X.Offset
                                }))
                            })
                        }) or if l_overlayComponent_0 then v13.createElement(l_overlayComponent_0, l_arguments_0) else nil
                    })
                })
            });
        end);
    else
        return nil;
    end;
end;
v29 = v5.connect(function(v43, _)
    local l_OverlayType_0 = v43.CentralOverlay.OverlayType;
    return {
        overlayComponent = l_OverlayComponent_0[l_OverlayType_0], 
        hideOverlay = v43.Moderation and v43.Moderation.userModerated, 
        shouldCreateBackgroundWrapper = v27[l_OverlayType_0], 
        arguments = v43.CentralOverlay.Arguments, 
        screenSize = v43.ScreenSize, 
        globalGuiInset = v43.GlobalGuiInset
    };
end, function(v46)
    return {
        closePrompt = function()
            v46(v25());
        end
    };
end)(v29);
local v49 = l_RoactAppPolicy_0.connect(function(v47)
    return {
        use3DPanels = v47.getUse3DPanels()
    };
end)(function(v48)
    if not v48.use3DPanels then
        return v13.createElement(v29, v48);
    else
        return v13.createElement(v26, v48);
    end;
end);
local v50 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v51)
    local v53 = l_useSelector_0(function(v52)
        return l_OverlayComponent_0[v52.CentralOverlay.OverlayType] ~= nil;
    end);
    local v54, v55 = v13.useState(nil);
    local v56 = l_useRegisterFocusNavigableSurface_0();
    local v57 = l_useDeRegisterFocusNavigableSurface_0();
    v13.useEffect(function()
        if not v54 or not v53 then
            v57(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v54);
            return ;
        else
            v56(l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay, v54);
            return ;
        end;
    end, {
        v54, 
        v53, 
        v56, 
        v57
    });
    local v58 = l_useDispatch_0();
    return v13.createElement(v49, v7.Dictionary.join(v51, {
        forwardRef = v22.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v13.useCallback(function(v59)
            v58(v25());
            v59:cancel();
        end, {
            v58
        }), nil, (v22.useEventMap(v50, v55)))
    }));
end;
