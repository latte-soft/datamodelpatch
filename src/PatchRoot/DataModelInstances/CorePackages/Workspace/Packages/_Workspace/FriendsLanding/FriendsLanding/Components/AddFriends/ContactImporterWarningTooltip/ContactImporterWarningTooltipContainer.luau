local l_script_FirstAncestor_0 = script:FindFirstAncestor("FriendsLanding");
local l_AppStorageService_0 = game:GetService("AppStorageService");
local v2 = require(l_script_FirstAncestor_0.AddFriends.dependencies);
local l_SocialLibraries_0 = v2.SocialLibraries;
local l_Roact_0 = v2.Roact;
local l_getDeepValue_0 = l_SocialLibraries_0.Dictionary.getDeepValue;
local l_Dash_0 = v2.Dash;
local l_llama_0 = v2.llama;
local v8 = require(l_script_FirstAncestor_0.installReducer.Actions.ContactImporterWarningSeen);
local l_RoactRodux_0 = v2.RoactRodux;
local v10 = require(script.Parent.HideableTooltip);
local l_withLocalization_0 = v2.withLocalization;
local v12 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics);
local v13 = require(l_script_FirstAncestor_0.FriendsLandingAnalytics.ImpressionEvents);
local v14 = require(l_script_FirstAncestor_0.Utils.contactImporterTooltip);
local v15 = require(l_script_FirstAncestor_0.Flags.getFFlagShowContactImporterTooltipOnce);
local v16 = require(l_script_FirstAncestor_0.Flags.getFFlagMockAppStorageService);
local v17 = require(l_script_FirstAncestor_0.Common.Constants);
local v18 = require(l_script_FirstAncestor_0.Common.TextKeys);
local function v24(v19, v20)
    local v21 = l_getDeepValue_0(v19, v17.RODUX_KEY .. ".ContactImporterWarning.contactImporterFriendRequests") or {};
    local v22 = l_getDeepValue_0(v19, v17.RODUX_KEY .. ".ContactImporterWarning.seenContactImporterFriendRequest") or false;
    local v23 = not l_llama_0.isEmpty(v21);
    if v15() then
        v22 = if not v16() then v14.getKey(l_AppStorageService_0) else v14.getKey(v20.appStorageService);
    end;
    return {
        showTooltip = v23 and not v22
    };
end;
local function v26(v25)
    return {
        onClick = function()
            v25(v8());
        end
    };
end;
local v27 = l_Roact_0.PureComponent:extend("ContactImporterWarningTooltipContainer");
v27.defaultProps = {
    appStorageService = l_AppStorageService_0
};
v27.render = function(v28)
    return l_withLocalization_0({
        bodyText = v18.CONTACT_IMPORTER_TOOLTIP_BODY, 
        headerText = v18.CONTACT_IMPORTER_TOOLTIP_HEADER
    })(function(v29)
        return l_Roact_0.createElement(v10, l_Dash_0.join(v28.props, {
            bodyText = v29.bodyText, 
            headerText = v29.headerText, 
            analytics = l_Dash_0.None
        }));
    end);
end;
v27.didMount = function(v30)
    if v30.props.showTooltip then
        v30.props.analytics:impressionEvent(v13.ContactWarningSeen);
    end;
end;
v27.didUpdate = function(v31, v32)
    if v31.props.showTooltip and v32.showTooltip == false then
        v31.props.analytics:impressionEvent(v13.ContactWarningSeen);
    end;
end;
return {
    Component = v12.connect(function(v33)
        return {
            analytics = v33
        };
    end)((l_RoactRodux_0.connect(v24, v26)(v27))), 
    mapStateToProps = v24, 
    mapDispatchToProps = v26
};
