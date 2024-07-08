local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Parent_0 = script:FindFirstAncestor("FocusNavigationUtils").Parent;
local v3 = require(l_Parent_0.React);
local l_useCursor_0 = require(l_CorePackages_0.UIBlox).App.SelectionCursor.useCursor;
local l_useDesignTokens_0 = require(l_Parent_0.Style).useDesignTokens;
return function()
    local v7 = l_useDesignTokens_0(function(v6)
        return {
            width = v6.Global.Size_25, 
            radius = UDim.new(0, v6.Semantic.Radius.Medium), 
            offset = v6.Global.Space_25
        };
    end);
    local v8 = l_useCursor_0(v7.radius, v7.offset, v7.width);
    local v9 = if not v8 then nil else v8.current;
    v3.useEffect(function()
        if l_CoreGui_0.SelectionImageObject == nil and v9 ~= nil then
            l_CoreGui_0.SelectionImageObject = v9;
            return function()
                l_CoreGui_0.SelectionImageObject = nil;
            end;
        else
            return nil;
        end;
    end, {
        v9
    });
end;
