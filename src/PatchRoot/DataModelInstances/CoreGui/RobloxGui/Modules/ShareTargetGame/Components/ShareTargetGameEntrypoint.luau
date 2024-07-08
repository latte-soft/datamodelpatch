local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ShareTargetGame");
local v2 = require(l_script_FirstAncestor_0.analytics);
local v3 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v3.Roact;
local l_EventStream_0 = v3.EventStream;
local l_Diag_0 = v3.Diag;
local l_request_0 = v3.request;
local v8 = require(script.Parent.ShareTargetGameContainer);
local v9 = l_Roact_0.PureComponent:extend("ShareTargetGameEntrypoint");
v9.defaultProps = {
    placeId = nil, 
    eventStream = l_EventStream_0.new(l_RbxAnalyticsService_0), 
    diag = l_Diag_0.new(l_RbxAnalyticsService_0), 
    isVisible = false
};
v9.render = function(v10)
    return l_Roact_0.createElement(v8, {
        placeId = v10.props.placeId, 
        analytics = v2(v10.props.eventStream, v10.props.diag), 
        networkImpl = l_request_0
    });
end;
return v9;
