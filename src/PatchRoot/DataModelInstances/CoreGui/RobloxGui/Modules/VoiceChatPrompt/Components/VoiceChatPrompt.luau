local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Roact);
local v2 = require(l_CorePackages_0.Packages.t);
local v3 = require(script.Parent.Parent.Parent.InGameMenu.InGameMenuPolicy);
local v4 = require(script.Parent.VoiceChatPromptFrame);
local v5 = v1.PureComponent:extend("VoiceChatPrompt");
v5.validateProps = v2.strictInterface({
    promptSignal = v2.optional(v2.RBXScriptSignal), 
    errorText = v2.optional(v2.string), 
    bannedUntil = v2.optional(v2.string), 
    onContinueFunc = v2.optional(v2.callback), 
    onPrimaryActivated = v2.optional(v2.callback), 
    onSecondaryActivated = v2.optional(v2.callback), 
    onReadyForSignal = v2.optional(v2.callback), 
    Analytics = v2.optional(v2.table), 
    VoiceChatServiceManager = v2.optional(v2.table), 
    policyMapper = v2.optional(v2.callback)
});
v5.render = function(v6)
    return v1.createElement("ScreenGui", {
        AutoLocalize = false, 
        DisplayOrder = 9, 
        IgnoreGuiInset = true, 
        OnTopOfCoreBlur = true, 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    }, {
        PolicyProvider = v1.createElement(v3.Provider, {
            policy = {
                v6.props.policyMapper or v3.Mapper
            }
        }, {
            Content = v1.createElement(v4, v6.props)
        })
    });
end;
return v5;
