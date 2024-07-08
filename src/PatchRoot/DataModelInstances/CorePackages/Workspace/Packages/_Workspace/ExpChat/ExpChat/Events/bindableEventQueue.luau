local v0 = require(script:FindFirstAncestor("ExpChat").DispatchBindableEvent);
return {
    queue = {}, 
    add = function(v1, v2)
        v1.queue[#v1.queue + 1] = v2;
    end, 
    flush = function(v3)
        if #v3.queue then
            for _, v5 in pairs(v3.queue) do
                v0:Fire(v5);
            end;
        end;
    end
};
