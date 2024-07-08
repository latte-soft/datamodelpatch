local _ = require(script.Parent.ProfilerDataFormatV2);
local v22 = {
    getDurations = function(v1, v2)
        if v2 > 0 then
            local v3 = v1.Nodes[v2];
            assert(v3 ~= nil);
            return v3.TotalDuration, v3.Duration;
        else
            local v4 = 0;
            for _, v6 in v1.Categories, nil, nil do
                v4 = v4 + v1.Nodes[v6.NodeId].TotalDuration;
            end;
            return v4, 0;
        end;
    end, 
    getName = function(_, v8)
        return v8 and v8.Name;
    end, 
    getSourceName = function(_, v10)
        return v10 and v10.Source;
    end, 
    getLine = function(_, v12)
        return v12 and v12.Line;
    end, 
    getNativeFlag = function(_, v14)
        return not not v14 and (v14.IsNative or false);
    end, 
    getPluginFlag = function(_, v16)
        return not not v16 and (v16.IsPlugin or false);
    end, 
    standardizeChildren = function(_, v18)
        return v18 and v18.Children;
    end, 
    formatSessionLength = function(v19)
        if not v19 then
            return nil;
        else
            return string.format("%02i:%02i:%02i.%04i", v19 / 3600000, (v19 / 60000) % 60, (v19 / 1000) % 60, v19 % 1000);
        end;
    end, 
    formatTimer = function(v20)
        if v20 ~= nil then
            if v20 == 0 then
                return "";
            elseif v20 >= 60 then
                return string.format("%dm", v20 / 60);
            else
                return string.format("%ds", v20);
            end;
        else
            return "";
        end;
    end, 
    formatFrequency = function(v21)
        if v21 < 1000 then
            return tostring(v21) .. " Hz";
        else
            return tostring(v21 / 1000) .. " KHz";
        end;
    end
};
v22.getSourceLocationString = function(v23, v24, v25)
    local v26 = v22.getSourceName(v23, v24);
    local v27 = if not v26 or #v26 == 0 then v25 else v26;
    local l_v27_0 = v27;
    local v29 = v22.getLine(v23, v24);
    if v29 and v29 >= 1 then
        l_v27_0 = string.format("%s:%s", v27, (tostring(v29)));
    end;
    return l_v27_0;
end;
return v22;
