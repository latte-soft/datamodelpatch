local l_CorePackages_0 = game:GetService("CorePackages");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Packages_0 = l_CorePackages_0.Packages;
local v3 = require(l_Packages_0.React);
local v4 = require(l_Packages_0.LuauPolyfill);
local l_setTimeout_0 = v4.setTimeout;
local l_clearTimeout_0 = v4.clearTimeout;
local function _(v7)
    local v8 = true;
    if v7.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v8 = v7.UserInputType == Enum.UserInputType.Touch;
    end;
    return v8;
end;
return function(v10)
    local v11, v12 = v3.useState("");
    local v13, v14 = v3.useState("");
    local v15, v16 = v3.useState(false);
    local v17 = v3.useRef(nil);
    local v18 = v3.useRef(nil);
    local v19 = v3.useCallback(function()
        if v18.current then
            l_clearTimeout_0(v18.current);
        end;
        if v17.current then
            v17.current:Disconnect();
            v17.current = nil;
        end;
    end, {
        v18, 
        v17
    });
    local v23 = v3.useCallback(function()
        v19();
        v16(true);
        v18.current = l_setTimeout_0(function()
            v19();
            v16(false);
        end, v10);
        v17.current = l_UserInputService_0.InputBegan:Connect(function(v20, _)
            local v22 = true;
            if v20.UserInputType ~= Enum.UserInputType.MouseButton1 then
                v22 = v20.UserInputType == Enum.UserInputType.Touch;
            end;
            if v22 then
                v19();
                v16(false);
                return ;
            else
                return ;
            end;
        end);
    end, {
        v18, 
        v17
    });
    v3.useEffect(function()
        return v19;
    end, {});
    return v11, v13, v15, (v3.useCallback(function(v24, v25)
        v12(v24);
        v14(v25);
        v23();
    end, {}));
end;
