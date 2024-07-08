local v0 = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React);
local v1 = require(script.Parent.getFirstFocusableDescendant);
local function _(v2)
    if v2 then
        v2:Disconnect();
    end;
end;
return function(v4)
    local v5 = v0.useRef(nil);
    v0.useEffect(function()
        local v6 = nil;
        local v7 = nil;
        local v8 = nil;
        local function v9(v10)
            local l_v6_0 = v6;
            if l_v6_0 then
                l_v6_0:Disconnect();
            end;
            l_v6_0 = v8;
            if l_v6_0 then
                l_v6_0:Disconnect();
            end;
            l_v6_0 = v1(v10);
            if l_v6_0 then
                v6 = l_v6_0:GetPropertyChangedSignal("Selectable"):Connect(function()
                    v9(v10);
                end);
                v8 = l_v6_0.AncestryChanged:Connect(function()
                    v9(v10);
                end);
            end;
            v5.current = l_v6_0;
        end;
        if not v4 then
            v5.current = nil;
        else
            v9(v4);
            v7 = v4.DescendantAdded:Connect(function()
                v9(v4);
            end);
        end;
        return function()
            local l_v6_1 = v6;
            if l_v6_1 then
                l_v6_1:Disconnect();
            end;
            l_v6_1 = v7;
            if l_v6_1 then
                l_v6_1:Disconnect();
            end;
            l_v6_1 = v8;
            if l_v6_1 then
                l_v6_1:Disconnect();
            end;
        end;
    end, {
        v4
    });
    return v5;
end;
