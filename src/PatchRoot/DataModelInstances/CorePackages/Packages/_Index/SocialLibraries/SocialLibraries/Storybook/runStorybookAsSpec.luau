return function(v0, v1, v2)
    local l_storyRoots_0 = v0.storyRoots;
    local l_mapStory_0 = v0.mapStory;
    v1("SHOULD run all stories with no issue", function()
        for _, v6 in ipairs(l_storyRoots_0) do
            for _, v8 in ipairs(v6:GetDescendants()) do
                if not (not v8:IsA("ModuleScript") or not v8.Name:find(".story$")) then
                    v2("SHOULD mount: " .. v8:GetFullName(), function(v9)
                        local v10 = require(v8);
                        local _, v12 = v9.UnitTestHelpers.mountFrame((l_mapStory_0(function()
                            return v10;
                        end)()));
                        v12();
                    end);
                end;
            end;
        end;
    end);
end;
