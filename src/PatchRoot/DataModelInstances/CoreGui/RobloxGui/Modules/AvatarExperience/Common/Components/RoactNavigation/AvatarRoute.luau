local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v3 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.RouteInfo);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_CorePackages_0.Packages.t);
local v6 = {};
v6.__index = v6;
v6.maxPreviousCount = 2;
v6.Interface = v5.strictInterface({
    current = v3.Interface, 
    previousPages = v5.optional(v5.array(v3.Interface)), 
    opaque = v3.Interface, 
    isVisible = v5.boolean, 
    isOverlayVisible = v5.boolean
});
v6.new = function(v7)
    local v8 = {
        current = v7.current or v3.EMPTY, 
        previousPages = v7.previousPages or {}, 
        opaque = v7.opaque or v3.EMPTY, 
        isVisible = v7.isVisible or false, 
        isOverlayVisible = v7.isOverlayVisible or false
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.__tostring = function(v9)
    local l_current_0 = v9.current;
    local l_opaque_0 = v9.opaque;
    local v12 = "AvatarRoute[" .. (not v9.isVisible and "Not Visible" or "Visible") .. (not v9.isOverlayVisible and "" or " *Overlay") .. ", " .. tostring(l_current_0);
    if l_current_0.name ~= l_opaque_0.name then
        v12 = v12 .. ", opaque: " .. tostring(l_opaque_0);
    end;
    return v12 .. "]";
end;
v6.__eq = function(v13, v14)
    if v13 and v14 then
        if not rawequal(v13, v14) then
            local v15 = false;
            if v13.isVisible == v14.isVisible then
                v15 = false;
                if v13.isOverlayVisible == v14.isOverlayVisible then
                    v15 = false;
                    if v13.current == v14.current then
                        v15 = v13.opaque == v14.opaque;
                    end;
                end;
            end;
            return v15;
        else
            return true;
        end;
    else
        return false;
    end;
end;
return v6;
