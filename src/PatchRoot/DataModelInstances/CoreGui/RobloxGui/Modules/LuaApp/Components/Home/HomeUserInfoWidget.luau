local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_Modules_0.Common.memoize);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v7 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v8 = require(l_Modules_0.LuaApp.Services.RoactAnalyticsSocialProfileShare);
local l_RoactAppPolicy_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy;
local v10 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v11 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v12 = require(l_Modules_0.LuaApp.AppPage);
local v13 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
local v14 = require(l_Modules_0.LuaApp.Components.Home.UserInfoWidget);
local v15 = require(l_Modules_0.LuaApp.Thunks.OpenProfilePeekView);
local v16 = require(l_Modules_0.LuaApp.Http.UrlBuilder);
local v17 = require(l_Modules_0.LuaApp.EventStreamConstants);
local v18 = require(l_Modules_0.Profile.Analytics.ProfileAnalytics);
local v19 = require(l_Modules_0.Profile.Analytics.EntryPoints);
local l_EntryPoints_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Analytics.EntryPoints;
local v21 = require(l_Modules_0.LuaApp.Components.DiscoverabilityModal.useNavigateToDiscoverabilityModal);
local l_Sources_0 = require(l_CorePackages_0.Workspace.Packages.SocialLuaAnalytics).Analytics.Enums.Sources;
local v23 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaProfileShareEnabled);
local v24 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnableHomePageUpsellCard);
local l_FFlagLuaAppConsolidateProfileLogging_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagLuaAppConsolidateProfileLogging;
local l_SelfViewProfileDiscoverabilityUpsellIXP_0 = require(l_CorePackages_0.Workspace.Packages.DiscoverabilityModal).Flags.SelfViewProfileDiscoverabilityUpsellIXP;
local v27 = v2.PureComponent:extend("HomeUserInfoWidget");
v27.init = function(v28)
    v28.navigateToProfile = function()
        local l_id_0 = v28.props.localUserModel.id;
        if not l_FFlagLuaAppConsolidateProfileLogging_0 then
            v18.new({
                localUserId = v28.props.localUserId, 
                profileUserId = v28.props.profileUserId
            }):navigateToProfile(v19.HomePageSelf);
            v28.props.openProfilePeekView(l_id_0);
            return ;
        else
            v28.props.openProfilePeekView(l_id_0, {
                source = l_Sources_0.HomePageSelfWidget
            });
            return ;
        end;
    end;
    v28.onUsernameActivated = function()
        if v28.props.enableHomeProfileLink then
            local l_id_1 = v28.props.localUserModel.id;
            local l_navigateDown_0 = v28.props.navigateDown;
            if not v28.props.luaProfileEnabled then
                if not v28.props.discoverabilityUpsellOnProfileSelfViewEnabled then
                    l_navigateDown_0({
                        name = v12.ViewUserProfile, 
                        detail = l_id_1
                    });
                    return ;
                else
                    v28.props.navigateToDiscoverabilityModal({
                        isStandaloneDiscoverabilityModal = true, 
                        navigateOnActivated = function()
                            l_navigateDown_0({
                                name = v12.ViewUserProfile, 
                                detail = l_id_1
                            });
                        end, 
                        entryPoint = l_EntryPoints_0.HomePageProfile
                    });
                    return ;
                end;
            elseif not v28.props.discoverabilityUpsellOnProfileSelfViewEnabled then
                v28.navigateToProfile();
                return ;
            else
                v28.props.navigateToDiscoverabilityModal({
                    isStandaloneDiscoverabilityModal = true, 
                    navigateOnActivated = v28.navigateToProfile, 
                    entryPoint = l_EntryPoints_0.HomePageProfile
                });
                return ;
            end;
        else
            return ;
        end;
    end;
    v28.onProfileShareActivated = function()
        v28.props.profileShareAnalytics.inviterButtonClick(v17.Context.Home);
        v28.props.navigateDown({
            name = v12.ShareSheet, 
            extraProps = {
                context = "ProfileShareAtHomePage", 
                url = v16.user.appsflyer({
                    userId = v28.props.localUserModel.id, 
                    sourceType = "ProfileShare"
                })
            }
        });
    end;
end;
v27.render = function(v32)
    local l_localUserModel_0 = v32.props.localUserModel;
    local l_layoutOrder_0 = v32.props.layoutOrder;
    local l_sideMargin_0 = v32.props.sideMargin;
    if l_localUserModel_0 then
        local v36 = nil;
        if v24() then
            v36 = v32.props.homePageUpsellCardVariation;
        end;
        return v2.createElement(v14, {
            layoutOrder = l_layoutOrder_0, 
            localUserModel = l_localUserModel_0, 
            onActivated = v32.onUsernameActivated, 
            isProfileShareEnabled = v32.props.isProfileSharePolicyEnabled and (v23() or v32.props.luaProfileShareEnabled), 
            onActivatedProfileShare = v32.onProfileShareActivated, 
            sideMargin = l_sideMargin_0, 
            upsellCardVariation = v36
        });
    else
        return nil;
    end;
end;
local v39 = v5(function(v37, v38)
    return v37[v38];
end);
v27 = l_RoactServices_0.connect({
    networking = v7, 
    profileShareAnalytics = v8
})((v10.connectUserLayer({
    v11.SocialFriendsLayer, 
    v11.SocialProfileLayer
}, function(v40, _)
    local v42 = v40[v11.SocialFriendsLayer] or {};
    return {
        luaProfileShareEnabled = v42.show_profile_share == "True", 
        luaProfileEnabled = v42.show_lua_profile, 
        discoverabilityUpsellOnProfileSelfViewEnabled = l_SelfViewProfileDiscoverabilityUpsellIXP_0.experimentOrRolloutEnabled(v40)
    };
end)((l_RoactAppPolicy_0.connect(function(v43, _)
    return {
        enableHomeProfileLink = v43.getHomePageProfileLink(), 
        isProfileSharePolicyEnabled = v43.getProfileShareEnabled()
    };
end)((v3.connect(function(v45, _)
    local v47 = nil;
    if v24() then
        v47 = v45.HomePageUpsellCardVariation;
    end;
    return {
        localUserModel = v39(v45.Users, v45.LocalUserId), 
        homePageUpsellCardVariation = v47
    };
end, function(v48)
    return {
        navigateDown = function(v49)
            v48(v13(v49));
        end, 
        openProfilePeekView = function(v50, v51)
            v48(v15(v50, v51));
        end
    };
end)(v27)))))));
HomeUserInfoWidgetWrapper = function(v52)
    return v2.createElement(v27, v4.Dictionary.join({
        navigateToDiscoverabilityModal = v21()
    }, v52));
end;
return HomeUserInfoWidgetWrapper;
