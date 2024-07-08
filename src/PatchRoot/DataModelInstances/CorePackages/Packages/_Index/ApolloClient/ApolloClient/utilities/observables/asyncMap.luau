local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Boolean_0 = require(l_Parent_0.LuauPolyfill).Boolean;
local v2 = require(l_Parent_0.Promise);
local v3 = {};
local l_Observable_0 = require(script.Parent.Observable).Observable;
v3.asyncMap = function(v5, v6, v7)
    return l_Observable_0.new(function(v8)
        local v9 = nil;
        local l_next_0 = v8.next;
        local l_error_0 = v8.error;
        local l_complete_0 = v8.complete;
        local v13 = 0;
        local v14 = false;
        local v18 = {
            andThen = function(_, v16)
                return v2.new(function(v17)
                    return v17(v16());
                end);
            end
        };
        local _ = function(v19, v20)
            if not l_Boolean_0.toJSBoolean(v19) then
                return function(_, v22)
                    if l_Boolean_0.toJSBoolean(v20) then
                        v20(v8, v22);
                    end;
                end;
            else
                return function(_, v24)
                    v13 = v13 + 1;
                    local function v25()
                        return v19(v24);
                    end;
                    v18 = v18:andThen(function()
                        return v2.delay(0);
                    end):andThen(v25, v25):andThen(function(v26)
                        v13 = v13 - 1;
                        if l_Boolean_0.toJSBoolean(l_next_0) then
                            l_next_0(v8, v26);
                        end;
                        if l_Boolean_0.toJSBoolean(v14) then
                            v9.complete();
                        end;
                    end, function(v27)
                        v13 = v13 - 1;
                        error(v27);
                    end):catch(function(v28)
                        if not l_Boolean_0.toJSBoolean(l_error_0) then
                            return ;
                        else
                            return l_error_0(v8, v28);
                        end;
                    end);
                end;
            end;
        end;
        local v30 = {};
        local l_v6_0 = v6;
        local l_l_v6_0_0 = l_v6_0 --[[ copy: 11 -> 12 ]];
        v30.next = not l_Boolean_0.toJSBoolean(l_v6_0) and function(_, v34)
            if l_Boolean_0.toJSBoolean(l_next_0) then
                l_next_0(v8, v34);
            end;
        end or function(_, v36)
            v13 = v13 + 1;
            local function v37()
                return l_l_v6_0_0(v36);
            end;
            v18 = v18:andThen(function()
                return v2.delay(0);
            end):andThen(v37, v37):andThen(function(v38)
                v13 = v13 - 1;
                if l_Boolean_0.toJSBoolean(l_next_0) then
                    l_next_0(v8, v38);
                end;
                if l_Boolean_0.toJSBoolean(v14) then
                    v9.complete();
                end;
            end, function(v39)
                v13 = v13 - 1;
                error(v39);
            end):catch(function(v40)
                if not l_Boolean_0.toJSBoolean(l_error_0) then
                    return ;
                else
                    return l_error_0(v8, v40);
                end;
            end);
        end;
        l_v6_0 = v7;
        v30.error = not l_Boolean_0.toJSBoolean(l_v6_0) and function(_, v42)
            if l_Boolean_0.toJSBoolean(l_error_0) then
                l_error_0(v8, v42);
            end;
        end or function(_, v44)
            v13 = v13 + 1;
            local function v45()
                return l_v6_0(v44);
            end;
            v18 = v18:andThen(function()
                return v2.delay(0);
            end):andThen(v45, v45):andThen(function(v46)
                v13 = v13 - 1;
                if l_Boolean_0.toJSBoolean(l_next_0) then
                    l_next_0(v8, v46);
                end;
                if l_Boolean_0.toJSBoolean(v14) then
                    v9.complete();
                end;
            end, function(v47)
                v13 = v13 - 1;
                error(v47);
            end):catch(function(v48)
                if not l_Boolean_0.toJSBoolean(l_error_0) then
                    return ;
                else
                    return l_error_0(v8, v48);
                end;
            end);
        end;
        v30.complete = function()
            v14 = true;
            if not (l_Boolean_0.toJSBoolean(v13) or not l_Boolean_0.toJSBoolean(l_complete_0)) then
                l_complete_0(v8);
            end;
        end;
        v9 = v30;
        v30 = v5:subscribe(v9);
        return function()
            return v30:unsubscribe();
        end;
    end);
end;
return v3;
