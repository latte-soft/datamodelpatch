return function(v0, v1, v2)
    local l_storyRoot_0 = v0.storyRoot;
    local v4 = v0.middleware or function(...)
        return ...;
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    v1("SHOULD run all stories with no issue", function()
        for _, v7 in ipairs(l_storyRoot_0:GetDescendants()) do
            if not (not v7:IsA("ModuleScript") or not v7.Name:find(".story$")) then
                v2("SHOULD mount: " .. v7:GetFullName(), function()
                    v4(require(v7), l_ScreenGui_0)();
                end);
            end;
        end;
    end);
end;
