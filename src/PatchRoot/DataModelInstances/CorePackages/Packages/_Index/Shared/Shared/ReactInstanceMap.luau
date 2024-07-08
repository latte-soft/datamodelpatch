local v0 = require(script.Parent.Parent.LuauPolyfill);
local l_Error_0 = v0.Error;
local l_inspect_0 = v0.util.inspect;
local v3 = require(script.Parent.getComponentName);
local v4 = {};
local function _(v5)
    local v6 = false;
    if v5.tag ~= nil then
        v6 = false;
        if v5.subtreeFlags ~= nil then
            v6 = false;
            if v5.lanes ~= nil then
                v6 = v5.childLanes ~= nil;
            end;
        end;
    end;
    return v6;
end;
v4.remove = function(v8)
    v8._reactInternals = nil;
end;
v4.get = function(v9)
    local l__reactInternals_0 = v9._reactInternals;
    local v11 = false;
    if l__reactInternals_0.tag ~= nil then
        v11 = false;
        if l__reactInternals_0.subtreeFlags ~= nil then
            v11 = false;
            if l__reactInternals_0.lanes ~= nil then
                v11 = l__reactInternals_0.childLanes ~= nil;
            end;
        end;
    end;
    if v11 then
        if l__reactInternals_0.alternate ~= nil then
            local l_alternate_0 = l__reactInternals_0.alternate;
            v11 = false;
            if l_alternate_0.tag ~= nil then
                v11 = false;
                if l_alternate_0.subtreeFlags ~= nil then
                    v11 = false;
                    if l_alternate_0.lanes ~= nil then
                        v11 = l_alternate_0.childLanes ~= nil;
                    end;
                end;
            end;
            if not v11 then
                error(l_Error_0.new("invalid alternate fiber (" .. (v3(v9) or "UNNAMED alternate") .. ") in " .. (v3(v9) or "UNNAMED Component") .. " during get from ReactInstanceMap " .. l_inspect_0(l__reactInternals_0.alternate)));
            end;
        end;
        return l__reactInternals_0;
    else
        error(l_Error_0.new("invalid fiber in " .. (v3(v9) or "UNNAMED Component") .. " during get from ReactInstanceMap " .. l_inspect_0(l__reactInternals_0)));
        return l__reactInternals_0;
    end;
end;
v4.has = function(v13)
    return v13._reactInternals ~= nil;
end;
v4.set = function(v14, v15)
    local l_v15_0 = v15;
    local v17 = nil;
    while l_v15_0 ~= nil do
        local l_l_v15_0_0 = l_v15_0;
        local v19 = false;
        if l_l_v15_0_0.tag ~= nil then
            v19 = false;
            if l_l_v15_0_0.subtreeFlags ~= nil then
                v19 = false;
                if l_l_v15_0_0.lanes ~= nil then
                    v19 = l_l_v15_0_0.childLanes ~= nil;
                end;
            end;
        end;
        if v19 then
            if l_v15_0.alternate ~= nil then
                l_l_v15_0_0 = l_v15_0.alternate;
                v19 = false;
                if l_l_v15_0_0.tag ~= nil then
                    v19 = false;
                    if l_l_v15_0_0.subtreeFlags ~= nil then
                        v19 = false;
                        if l_l_v15_0_0.lanes ~= nil then
                            v19 = l_l_v15_0_0.childLanes ~= nil;
                        end;
                    end;
                end;
                if not v19 then
                    v17 = "invalid alternate fiber (" .. (v3(v14) or "UNNAMED alternate") .. ") in " .. (v3(v14) or "UNNAMED Component") .. " being set in ReactInstanceMap " .. l_inspect_0(l_v15_0.alternate) .. "\n";
                    if v15 ~= l_v15_0 then
                        v17 = v17 .. " (from original fiber " .. (v3(v14) or "UNNAMED Component") .. ")";
                    end;
                    error(l_Error_0.new(v17));
                end;
            end;
        else
            v17 = "invalid fiber in " .. (v3(v14) or "UNNAMED Component") .. " being set in ReactInstanceMap " .. l_inspect_0(l_v15_0) .. "\n";
            if v15 ~= l_v15_0 then
                v17 = v17 .. " (from original fiber " .. (v3(v14) or "UNNAMED Component") .. ")";
            end;
            error(l_Error_0.new(v17));
        end;
        l_v15_0 = l_v15_0.return_;
    end;
    v14._reactInternals = v15;
end;
return v4;
