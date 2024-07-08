local v0 = newproxy(true);
getmetatable(v0).__tostring = function()
    return "UsageGraphSentinel";
end;
return {
    UsageGraphKey = v0, 
    getUsageGraph = function(v1)
        return table.clone(v1[v0]);
    end
};
