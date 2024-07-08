local l_CoreGui_0 = game:GetService("CoreGui");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v3 = require(l_CorePackages_0.Packages.React);
local v4 = require(l_CorePackages_0.Packages.ReactRoblox);
local v5 = require(l_CorePackages_0.Roact);
local v6 = require(l_CorePackages_0.RoactRodux);
local v7 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v8 = require(l_CorePackages_0.Logging);
local v9 = require(l_CorePackages_0.Cryo);
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local v11 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationVerificationPrompt);
local v12 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationPrompt);
local v13 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationReactivationPrompt);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v15 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local l_AppGuiService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppGuiService;
local v17 = require(l_Modules_0.LuaApp.Constants);
local v18 = require(l_Modules_0.LuaApp.mutedError);
local v19 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationState);
local v20 = require(l_Modules_0.LuaApp.Components.Moderation.ModerationType);
local v21 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local l_useSelector_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector;
local _ = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch;
local v24 = require(l_CorePackages_0.Workspace.Packages.FocusNavigationUtils);
local l_FocusNavigableSurfaceRegistry_0 = v24.FocusNavigableSurfaceRegistry;
local l_useRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useRegisterFocusNavigableSurface;
local l_useDeRegisterFocusNavigableSurface_0 = l_FocusNavigableSurfaceRegistry_0.useDeRegisterFocusNavigableSurface;
local l_FocusNavigableSurfaceIdentifierEnum_0 = v24.FocusNavigableSurfaceIdentifierEnum;
local v29 = require(l_CorePackages_0.Packages.ReactFocusNavigation);
local l_FocusNavigationEventNameEnum_0 = v24.FocusNavigationEventNameEnum;
local v31 = require(l_Modules_0.LuaApp.AppPage);
local v32 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v33 = require(l_Modules_0.LuaApp.Thunks.Moderation.ReactivateAccount);
local v34 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v35 = require(l_Modules_0.LuaApp.Actions.Moderation.SetModerationStatus);
local v36 = require(l_Modules_0.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames);
local v37 = game:DefineFastFlag("ModerationVerificationEnabled", false);
local v38 = game:DefineFastFlag("ModerationVerificationEnabled2", false);
local l_FFlagEnableDeactivatedUserReactivation_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagEnableDeactivatedUserReactivation;
local v40 = v5.PureComponent:extend("ModerationEventReceiver");
v40.init = function(v41)
    v41.reactivateAccountActivated = function()
        if v41.props.moderation.moderationDetail then
            v41.props.reactivateAccountActivated(v41.props.networking, v41.props.moderation.moderationDetail.punishmentId);
        end;
    end;
    v41.logoutCallback = function()
        v41.props.doLogout(v41.props.networking, v41.props.guiService);
    end;
    v41.communityGuidelinesActivated = function(v42)
        v41.props.navigateDown({
            name = v31.GenericWebPage, 
            detail = v21.static.about.guidelines(), 
            extraProps = {
                title = v42.CommunityGuidelines
            }
        });
    end;
    v41.dsaLearnMoreActivated = function()
        v41.props.navigateDown({
            name = v31.GenericWebPage, 
            detail = "https://en.help.roblox.com/hc/en-us/articles/360000272703-Appeal-Your-Content-Moderation", 
            extraProps = {
                title = "Appeal Your Content Moderation"
            }
        });
    end;
    v41.termsActivated = function(v43)
        v41.props.navigateDown({
            name = v31.GenericWebPage, 
            detail = v21.static.about.terms({
                useGameQQUrls = true
            }), 
            extraProps = {
                title = v43.TermsOfUse
            }
        });
    end;
    v41.parentVerificationActivated = function()
        if not v38 then
            v41.props.navigateDown({
                name = v31.ParentVerification
            });
            return ;
        else
            v41.props.navigateDown({
                name = v31.ParentVerification, 
                detail = v21.fromString("www:parents/account-setup")()
            });
            return ;
        end;
    end;
    v41.emailVerificationActivated = function()
        if not v38 then
            v41.props.navigateDown({
                name = v31.EmailVerification
            });
            return ;
        else
            v41.props.navigateDown({
                name = v31.EmailVerification, 
                detail = v21.fromString("www:")()
            });
            return ;
        end;
    end;
    v41.reportingAppealsPageActivated = function(v44)
        v41.props.navigateDown({
            name = v31.GenericWebPage, 
            detail = v21.static.appealsPortal.main(), 
            extraProps = {
                title = v44.ReportingAppeals
            }
        });
    end;
end;
v40.render = function(v45)
    local l_moderation_0 = v45.props.moderation;
    if l_moderation_0 == nil then
        return nil;
    else
        local v47 = l_moderation_0.userModerated or false;
        local l_moderationDetail_0 = l_moderation_0.moderationDetail;
        if v47 == false then
            return nil;
        else
            local l_globalGuiInset_0 = v45.props.globalGuiInset;
            l_globalGuiInset_0.top = v45.props.statusBarHeight;
            local v50 = v5.createElement("ScreenGui", {
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                DisplayOrder = v17.DisplayOrder.AntiAddictionPrompt, 
                IgnoreGuiInset = true
            }, {
                OverlayFrame = v5.createElement("ImageButton", {
                    AutoButtonColor = false, 
                    Size = UDim2.fromScale(1, 1), 
                    ImageTransparency = 1, 
                    BackgroundColor3 = Color3.new(0, 0, 0), 
                    BackgroundTransparency = 0.5, 
                    BorderSizePixel = 0
                })
            });
            if l_moderationDetail_0 then
                local l_punishmentTypeDescription_0 = l_moderationDetail_0.punishmentTypeDescription;
                local v52 = v20[l_punishmentTypeDescription_0];
                v7.isNotNil(v52, "moderationState should not be nil");
                if v52 == nil then
                    v18("ModerationEventReceiver Got Invalid Moderation Type:`" .. tostring(l_punishmentTypeDescription_0) .. "`");
                    v52 = v19.None;
                end;
                if v52 == v19.None then
                    v45.props.setModerationStatus(false);
                    return nil;
                else
                    v50 = l_withLocalization_0({
                        CommunityGuidelines = "Feature.Moderation.Link.CommunityGuidelines", 
                        TermsOfUse = "Feature.Moderation.Link.TermsOfUse", 
                        SupportForm = "Feature.Moderation.Link.SupportForm", 
                        ReportingAppeals = "CommonUI.Features.Label.ReportAppeals"
                    })(function(v53)
                        if l_FFlagEnableDeactivatedUserReactivation_0 and l_moderationDetail_0.selfServiceDeactivated == true then
                            return v5.createElement(v13, {
                                screenSize = v45.props.screenSize, 
                                globalGuiInset = l_globalGuiInset_0, 
                                logoutCallback = v45.logoutCallback, 
                                completedCallback = function()
                                    v45.props.setModerationStatus(false);
                                end
                            });
                        elseif v37 and l_moderationDetail_0.verificationCategory ~= "" then
                            return v5.createElement(v11, {
                                screenSize = v45.props.screenSize, 
                                moderationDetails = l_moderationDetail_0, 
                                globalGuiInset = l_globalGuiInset_0, 
                                reactivateAccountActivated = v45.reactivateAccountActivated, 
                                logoutCallback = v45.logoutCallback, 
                                verificationCategory = l_moderationDetail_0.verificationCategory ~= nil and l_moderationDetail_0.verificationCategory or "", 
                                communityGuidelinesActivated = function()
                                    v45.communityGuidelinesActivated(v53);
                                end, 
                                termsActivated = function()
                                    v45.termsActivated(v53);
                                end, 
                                reportingAppealsPageActivated = function()
                                    v45.reportingAppealsPageActivated(v53);
                                end, 
                                parentVerificationActivated = l_moderationDetail_0.verificationCategory == "VPC" and function()
                                    v45.parentVerificationActivated();
                                end or function()
                                    v45.emailVerificationActivated();
                                end, 
                                dsaLearnMoreActivated = function()
                                    v45.dsaLearnMoreActivated();
                                end
                            });
                        else
                            return v5.createElement(v12, {
                                screenSize = v45.props.screenSize, 
                                moderationDetails = l_moderationDetail_0, 
                                globalGuiInset = l_globalGuiInset_0, 
                                reactivateAccountActivated = v45.reactivateAccountActivated, 
                                logoutCallback = v45.logoutCallback, 
                                communityGuidelinesActivated = function()
                                    v45.communityGuidelinesActivated(v53);
                                end, 
                                termsActivated = function()
                                    v45.termsActivated(v53);
                                end, 
                                dsaLearnMoreActivated = function()
                                    v45.dsaLearnMoreActivated();
                                end, 
                                reportingAppealsPageActivated = function()
                                    v45.reportingAppealsPageActivated(v53);
                                end
                            });
                        end;
                    end);
                end;
            end;
            return v4.createPortal({
                ModerationOverlayWrapper = v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 1), 
                    BackgroundTransparency = 1, 
                    ref = v45.props.forwardRef, 
                    Selectable = false
                }, {
                    ModerationOverlay = v50
                })
            }, l_CoreGui_0);
        end;
    end;
end;
v40.didUpdate = function(v54, v55)
    if v54.props.moderation ~= nil and v55.moderation ~= v54.props.moderation then
        local l_moderation_1 = v54.props.moderation;
        local v57 = l_moderation_1.userModerated or false;
        local l_moderationDetail_1 = l_moderation_1.moderationDetail;
        if not (not v57 or not l_moderationDetail_1) then
            v8.warn("The user moderationState is:`" .. tostring(v20[l_moderationDetail_1.punishmentTypeDescription]) .. "`");
        end;
    end;
end;
v40 = l_RoactServices_0.connect({
    networking = v15, 
    guiService = l_AppGuiService_0
})((v6.connect(function(v59, _)
    return {
        screenSize = v59.ScreenSize, 
        moderation = v59.Moderation, 
        globalGuiInset = v59.GlobalGuiInset, 
        statusBarHeight = v59.TopBar.statusBarHeight
    };
end, function(v61)
    return {
        setModerationStatus = function(v62)
            v61(v35(v62));
        end, 
        reactivateAccountActivated = function(v63, v64)
            v61(v33(v63, v64));
        end, 
        doLogout = function(v65, v66)
            v61(v34(v65, v66, v36.Moderation));
        end, 
        navigateDown = function(v67)
            v61(v32(v67));
        end
    };
end)(v40)));
local v68 = {
    [Enum.KeyCode.ButtonB] = l_FocusNavigationEventNameEnum_0.NavigateBack, 
    [Enum.KeyCode.Escape] = l_FocusNavigationEventNameEnum_0.NavigateBack
};
return function(v69)
    local v72 = l_useSelector_0(function(v70)
        local l_Moderation_0 = v70.Moderation;
        return l_Moderation_0 and l_Moderation_0.userModerated;
    end);
    local v73, v74 = v3.useState(nil);
    local v75 = l_useRegisterFocusNavigableSurface_0();
    local v76 = l_useDeRegisterFocusNavigableSurface_0();
    local v77 = v73 and v72;
    v3.useEffect(function()
        if v77 then
            v75(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v73);
        end;
        return function()
            v76(l_FocusNavigableSurfaceIdentifierEnum_0.ModerationOverlay, v73);
        end;
    end, {
        v77, 
        v73, 
        v75, 
        v76
    });
    return v3.createElement(v40, v9.Dictionary.join(v69, {
        forwardRef = v29.useEventHandler(l_FocusNavigationEventNameEnum_0.NavigateBack, v3.useCallback(function(v78)
            v78:cancel();
        end, {}), nil, (v29.useEventMap(v68, v74)))
    }));
end;
