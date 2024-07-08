local l_CorePackages_0 = game:GetService("CorePackages");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_RobloxGui_0.Modules.Common.renderWithCoreScriptsStyleProvider);
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Actions.SetScreenSize);
local v8 = require(l_Parent_0.Components.ReportMenu);
local v9 = require(l_Parent_0.Components.ReportDialog);
local v10 = require(l_Parent_0.Components.ReportCategoryDialog);
local v11 = require(l_Parent_0.Components.ReportSentDialog);
local v12 = require(l_Parent_0.Components.Toast);
local v13 = require(l_RobloxGui_0.Modules.VoiceChat.VoiceStateContext);
local v14 = v2.PureComponent:extend("TrustAndSafetyApp");
v14.validateProps = v4.strictInterface({
    setScreenSize = v4.callback, 
    visible = v4.boolean
});
v14.init = function(_)
end;
v14.render = function(v16)
    return v5({
        VoiceStateContextProvider = v2.createElement(v13.Provider, {}, {
            Gui = v2.createElement("ScreenGui", {
                AutoLocalize = false, 
                DisplayOrder = 8, 
                IgnoreGuiInset = true, 
                OnTopOfCoreBlur = true, 
                ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
                [v2.Change.AbsoluteSize] = v16.props.setScreenSize
            }, {
                Content = v2.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Visible = v16.props.visible
                }, {
                    ReportCategoryDialog = v2.createElement(v10), 
                    ReportMenu = v2.createElement(v8), 
                    ReportDialog = v2.createElement(v9), 
                    ReportSentDialog = v2.createElement(v11), 
                    Toast = v2.createElement(v12)
                })
            })
        })
    });
end;
return v3.UNSTABLE_connect2(function(v17, _)
    return {
        visible = v17.displayOptions.visible
    };
end, function(v19)
    return {
        setScreenSize = function(v20)
            v19(v7(v20.AbsoluteSize));
        end
    };
end)(v14);
