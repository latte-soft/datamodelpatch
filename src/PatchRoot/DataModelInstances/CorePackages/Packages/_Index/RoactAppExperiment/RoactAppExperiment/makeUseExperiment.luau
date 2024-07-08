local l_script_FirstAncestor_0 = script:FindFirstAncestor("RoactAppExperiment");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(script.Parent.usePrevious);
local v3 = require(l_script_FirstAncestor_0.useIXPService);
local function _(v4)
    local v5 = "";
    for v6, v7 in ipairs(v4) do
        if v6 > 1 then
            v5 = v5 .. ",";
        end;
        v5 = v5 .. v7;
    end;
    return v5;
end;
return function(v9, v10, v11, v12, v13)
    return function(v14, v15, v16)
        if v16 == nil then
            v16 = true;
        end;
        local v17 = v3();
        assert(type(v14) == "table", "useExperiment expects layerNames to be a list of layers");
        assert(type(v15) == "function", "useExperiment expects mapLayers to be a function");
        local function v21()
            local v18 = {};
            for _, v20 in ipairs(v14) do
                v18[v20] = v17[v11](v17, v20);
                if not (not v18[v20] or next(v18[v20])) then
                    v18[v20] = nil;
                end;
            end;
            return v18;
        end;
        local function v22()
            return v17[v10](v17);
        end;
        local v23, v24 = v1.useState(v21);
        local v25, v26 = v1.useState(v22);
        local v27 = "";
        for v28, v29 in ipairs(v14) do
            if v28 > 1 then
                v27 = v27 .. ",";
            end;
            v27 = v27 .. v29;
        end;
        local l_v27_0 = v27;
        v1.useEffect(function()
            if v17 == nil then
                return function()
                end;
            else
                local function _()
                    local v31 = v17[v10](v17);
                    local v32 = v21();
                    v24(function(v33)
                        if not next(v32) ~= not next(v33) then
                            return v32;
                        else
                            return v33;
                        end;
                    end);
                    v26(v31);
                end;
                local v39 = v17[v9]:Connect(function(_)
                    local v36 = v17[v10](v17);
                    local v37 = v21();
                    v24(function(v38)
                        if not next(v37) ~= not next(v38) then
                            return v37;
                        else
                            return v38;
                        end;
                    end);
                    v26(v36);
                end);
                local v40 = v17[v10](v17);
                local v41 = v21();
                v24(function(v42)
                    if not next(v41) ~= not next(v42) then
                        return v41;
                    else
                        return v42;
                    end;
                end);
                v26(v40);
                return function()
                    if v39 ~= nil then
                        v39:Disconnect();
                    end;
                end;
            end;
        end, {
            v17, 
            l_v27_0
        });
        v27 = v2(v25) or Enum.IXPLoadingStatus.None;
        v1.useEffect(function()
            if ((v16 and v17 ~= nil) and v25 == Enum.IXPLoadingStatus.Initialized) and v27 ~= Enum.IXPLoadingStatus.Initialized then
                for _, v44 in ipairs(v14) do
                    if v17[v13](v17, v44) == Enum.IXPLoadingStatus.Initialized then
                        v17[v12](v17, v44);
                    end;
                end;
            end;
        end, {
            v17, 
            l_v27_0, 
            v16, 
            v25, 
            v27
        });
        return v15(v23);
    end;
end;
