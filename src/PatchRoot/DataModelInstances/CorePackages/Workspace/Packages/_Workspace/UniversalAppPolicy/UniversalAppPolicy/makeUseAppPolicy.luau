local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.PolicyProvider);
local l_Logger_0 = v1.Logger;
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local _ = require(script.Parent.PolicyTypes);
local function v11(v6, v7)
    local v8 = {};
    for _, v10 in ipairs(v7) do
        v8 = v4.Dictionary.join(v8, v10(v6));
    end;
    return v8;
end;
return function(v12)
    assert(v12, "expected getPolicyImpl");
    return function(v13)
        local v14 = v3.useContext(v1.AppPolicyContext);
        assert(v14, "Not a descendent of PolicyProvider");
        local v16, v17 = v3.useState(function()
            if not v14.staticExternalPolicy then
                local v15 = v12.read();
                if not v15 then
                    l_Logger_0:trace("No app policy data available");
                    return (v11({}, v14.presentationPolicy));
                else
                    return (v11(v15, v14.presentationPolicy));
                end;
            else
                return (v11(v14.staticExternalPolicy, v14.presentationPolicy));
            end;
        end);
        v3.useEffect(function()
            local v18 = nil;
            if not v14.staticExternalPolicy then
                v18 = v12.onPolicyChanged(function(v19)
                    l_Logger_0:trace("Received policy update");
                    v17((v11(v19, v14.presentationPolicy)));
                end);
            end;
            return function()
                if v18 then
                    v18:Disconnect();
                end;
            end;
        end, {
            v14
        });
        return v13(v16);
    end;
end;
