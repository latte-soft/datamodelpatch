local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local _ = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.Lock);
local v5 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBase);
local v6 = require(l_Modules_0.LuaApp.Components.AccountSecurity.Common.ModalBodyText);
local v7 = require(l_Modules_0.LuaApp.withLocalization);
local v8 = {
    description = "Feature.AccountSecurityPrompt.Description.ChangeYourPasswordSuccess", 
    header = "Feature.AccountSecurityPrompt.Header.Success"
};
local v9 = v3.PureComponent:extend("ChangePassword" .. script.Name);
v9.render = function(_)
    return v7(v8)(function(v11)
        return v3.createElement(v5, {
            title = v11.header, 
            makeBodyFragment = function(v12)
                return v3.createFragment({
                    Lock = v3.createElement(v4, {
                        layoutOrder = 1
                    }), 
                    ModalBodyText = v3.createElement(v6, {
                        layoutOrder = 2, 
                        contentWidth = v12, 
                        text = v11.description
                    })
                });
            end
        });
    end);
end;
return v9;
