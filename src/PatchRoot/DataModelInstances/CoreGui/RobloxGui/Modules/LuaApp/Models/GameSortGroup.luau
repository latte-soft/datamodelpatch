local v0 = {
    new = function()
        return {
            sorts = {}, 
            pageId = ""
        };
    end
};
v0.mock = function()
    local v1 = v0.new();
    v1.sorts = {};
    v1.pageId = "73261389094";
    return v1;
end;
return v0;
