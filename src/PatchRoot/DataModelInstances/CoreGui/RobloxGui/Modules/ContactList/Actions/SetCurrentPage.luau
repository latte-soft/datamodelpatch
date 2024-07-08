local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local _ = require(l_CoreGui_0:WaitForChild("RobloxGui").Modules.ContactList.Enums.Pages);
return require(l_CorePackages_0.Rodux).makeActionCreator(script.Name, function(v3)
    return {
        page = v3
    };
end);
