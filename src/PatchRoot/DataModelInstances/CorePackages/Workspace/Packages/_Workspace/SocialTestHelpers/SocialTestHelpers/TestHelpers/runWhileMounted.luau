local l_Roact_0 = require(script:FindFirstAncestor("SocialTestHelpers").dependencies).Roact;
return function(v1, v2)
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Parent = game:GetService("CoreGui");
    local v4 = l_Roact_0.mount(v1, l_ScreenGui_0);
    v2(l_ScreenGui_0);
    l_Roact_0.unmount(v4);
end;
