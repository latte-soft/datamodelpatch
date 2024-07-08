return {
    obfuscateUserId = function(v0)
        if v0 == nil then
            return "<User ID: nil>";
        elseif v0 == 0 then
            return "<User ID: 0>";
        else
            return "<User ID: ####>";
        end;
    end, 
    obfuscatePlayer = function(v1)
        if v1 == nil then
            return "<Player: nil>";
        else
            local v2 = true;
            if v1.UserId ~= 0 then
                v2 = v1.UserId == nil;
            end;
            return string.format("<Player: ####%s>", not v2 and "" or " [NO USER ID]");
        end;
    end
};
