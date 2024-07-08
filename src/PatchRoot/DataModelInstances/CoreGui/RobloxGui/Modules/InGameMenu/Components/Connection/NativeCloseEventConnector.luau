local l_GuiService_0 = game:GetService("GuiService");
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local v2 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v2.Roact;
local l_RoactRodux_0 = v2.RoactRodux;
local l_t_0 = v2.t;
local l_Parent_0 = script.Parent.Parent.Parent;
local v7 = require(l_Parent_0.Thunks.OpenEducationalPopup);
local v8 = require(l_Parent_0.Utility.ExternalEventConnection);
local v9 = require(l_Parent_0.InGameMenuPolicy);
local v10 = require(l_Parent_0.Utility.UserLocalStore);
local v11 = require(l_Parent_0.Utility.SendAnalytics);
local v12 = require(l_Parent_0.Resources.Constants);
local v13 = l_Roact_0.PureComponent:extend("NativeCloseEventConnector");
v13.validateProps = l_t_0.strictInterface({
    isEducationalPopupEnabled = l_t_0.boolean, 
    maxDisplayCount = l_t_0.integer, 
    openEducationalPopup = l_t_0.optional(l_t_0.callback)
});
v13.init = function(v14)
    v14.onNativeCloseConnect = function()
        if v14.props.isEducationalPopupEnabled then
            l_RbxAnalyticsService_0:ReportCounter("LeaveGame_NativeClose", 1);
            v14.props.openEducationalPopup(l_GuiService_0, v10.new(), v14.props.maxDisplayCount);
        end;
        v11(v12.AnalyticsInGameMenuName, "LeaveGame_NativeClose", {});
    end;
end;
v13.render = function(v15)
    return l_Roact_0.createElement(v8, {
        event = l_GuiService_0.NativeClose, 
        callback = v15.onNativeCloseConnect
    });
end;
return l_RoactRodux_0.UNSTABLE_connect2(nil, function(v16)
    return {
        openEducationalPopup = function(v17, v18, v19)
            return v16(v7(v17, v18, v19));
        end
    };
end)((v9.connect(function(v20, _)
    return {
        isEducationalPopupEnabled = v20.enableEducationalPopup(), 
        maxDisplayCount = v20.educationalPopupMaxDisplayCount()
    };
end)(v13)));
