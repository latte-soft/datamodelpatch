local l_GuiService_0 = game:GetService("GuiService");
local v1 = require(script:FindFirstAncestor("FocusNavigationUtils").Parent.React);
local function _(v2)
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    if not (v2 and l_SelectedCoreObject_0) then
        return false;
    else
        local v4 = true;
        if l_SelectedCoreObject_0 ~= v2 then
            v4 = l_SelectedCoreObject_0:IsDescendantOf(v2);
        end;
        return v4 and l_SelectedCoreObject_0:FindFirstAncestorOfClass("CoreGui") ~= nil;
    end;
end;
return function(v6)
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    local v8;
    if not (v6 and l_SelectedCoreObject_1) then
        v8 = false;
    else
        local v9 = true;
        if l_SelectedCoreObject_1 ~= v6 then
            v9 = l_SelectedCoreObject_1:IsDescendantOf(v6);
        end;
        v8 = v9 and l_SelectedCoreObject_1:FindFirstAncestorOfClass("CoreGui") ~= nil;
    end;
    local v10;
    l_SelectedCoreObject_1, v10 = v1.useState(v8);
    v1.useEffect(function()
        local v11 = nil;
        local v12 = nil;
        if not v6 then
            v10(false);
        else
            local l_v10_0 = v10;
            local l_v6_0 = v6;
            local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
            local v16;
            if not (l_v6_0 and l_SelectedCoreObject_2) then
                v16 = false;
            else
                local v17 = true;
                if l_SelectedCoreObject_2 ~= l_v6_0 then
                    v17 = l_SelectedCoreObject_2:IsDescendantOf(l_v6_0);
                end;
                v16 = v17 and l_SelectedCoreObject_2:FindFirstAncestorOfClass("CoreGui") ~= nil;
            end;
            l_v10_0(v16);
            v11 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
                if v12 then
                    v12:Disconnect();
                end;
                local l_v6_1 = v6;
                local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
                local v20;
                if not (l_v6_1 and l_SelectedCoreObject_3) then
                    v20 = false;
                else
                    local v21 = true;
                    if l_SelectedCoreObject_3 ~= l_v6_1 then
                        v21 = l_SelectedCoreObject_3:IsDescendantOf(l_v6_1);
                    end;
                    v20 = v21 and l_SelectedCoreObject_3:FindFirstAncestorOfClass("CoreGui") ~= nil;
                end;
                l_v6_1 = l_GuiService_0.SelectedCoreObject;
                if not (not v20 or not l_v6_1) then
                    v12 = l_v6_1.AncestryChanged:Connect(function()
                        if l_v6_1:FindFirstAncestorOfClass("CoreGui") == nil then
                            v12:Disconnect();
                            local l_v10_1 = v10;
                            local l_v6_2 = v6;
                            local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                            local v25;
                            if not (l_v6_2 and l_SelectedCoreObject_4) then
                                v25 = false;
                            else
                                local v26 = true;
                                if l_SelectedCoreObject_4 ~= l_v6_2 then
                                    v26 = l_SelectedCoreObject_4:IsDescendantOf(l_v6_2);
                                end;
                                v25 = v26 and l_SelectedCoreObject_4:FindFirstAncestorOfClass("CoreGui") ~= nil;
                            end;
                            l_v10_1(v25);
                        end;
                    end);
                end;
                v10(v20);
            end);
        end;
        return function()
            if v11 then
                v11:Disconnect();
            end;
            if v12 then
                v12:Disconnect();
            end;
        end;
    end, {
        v6
    });
    return l_SelectedCoreObject_1;
end;
