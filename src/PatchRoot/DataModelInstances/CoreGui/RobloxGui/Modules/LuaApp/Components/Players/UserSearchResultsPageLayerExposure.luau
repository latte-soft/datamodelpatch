local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CorePackages_0.Packages.React);
local v3 = require(l_CorePackages_0.Packages.Roact);
local v4 = require(l_CorePackages_0.Packages.Cryo);
local v5 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local l_getFStringSocialUserSearchResultsPageLayer_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFStringSocialUserSearchResultsPageLayer;
local l_getFFlagPlayerSearchNewEmptyPageEnabled_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).getFFlagPlayerSearchNewEmptyPageEnabled;
local l_FFlagUserSearchUseNewEndpointIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagUserSearchUseNewEndpointIXP;
local v9 = v3.PureComponent:extend("UserSearchResultsPageLayerExposure");
v9.init = function(v10)
    v10.state = {
        layerExposedOnMount = false
    };
end;
v9.didMount = function(v11)
    v11:setState({
        layerExposedOnMount = true
    });
end;
v9.render = function(v12)
    if not v12.state.layerExposedOnMount then
        return nil;
    else
        return (v12.props.renderChild(v4.Dictionary.join(v12.props, {
            renderChild = v4.None
        })));
    end;
end;
return v5.connectUserLayer({
    l_getFStringSocialUserSearchResultsPageLayer_0()
}, function(v13, _)
    local v15 = v13[l_getFStringSocialUserSearchResultsPageLayer_0()] or {};
    return {
        enableRecommendationsSearchContext = v15.enableRecommendationsSearchContext, 
        enableNewEmptySearchUI = if not l_getFFlagPlayerSearchNewEmptyPageEnabled_0() then nil else v15.new_empty_search_ui, 
        shouldUseOmniSearchEndpoint = if not l_FFlagUserSearchUseNewEndpointIXP_0 then nil else v15.useOmniSearchEndpoint
    };
end)(v9);
