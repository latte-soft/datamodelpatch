return {
    initializeReporter = function(v0, v1)
        local v2 = {};
        local v3 = {};
        local v4 = {};
        local v5 = {};
        local v6 = {};
        local v7 = {};
        local v8 = 0;
        local v9 = nil;
        return {
            start = function(v10)
                table.insert(v2, v8 + 1);
                table.insert(v3, v10);
            end, 
            stop = function()
                local v11 = table.remove(v2);
                local v12 = table.remove(v3);
                if not (v11 and v12) then
                    error("Reporter.stop() called without a corresponding Reporter.start()");
                end;
                table.insert(v6, v12);
                table.insert(v4, v11);
                table.insert(v5, v8);
            end, 
            report = function(v13)
                if #v3 == 0 then
                    error("Began reporting values before calling Reporter.start");
                end;
                local v14 = os.clock();
                if type(v13) == "function" then
                    table.insert(v7, v13(v7[v8], if not v9 then nil else v14 - v9));
                else
                    table.insert(v7, v13);
                end;
                v9 = v14;
                v8 = v8 + 1;
            end, 
            finish = function()
                if not (#v2 <= 0) or #v3 > 0 then
                    error("Reporting finished without closing all Reporter.start() sections with a Reporter.stop() call");
                end;
                local v15 = table.create(#v6);
                local v16 = table.create(#v4);
                for v17, v18 in v4, nil, nil do
                    local v19 = v5[v17];
                    local v20 = table.create((v19 - v18) + 1);
                    table.move(v7, v18, v19, 1, v20);
                    v16[v17] = v1(v20);
                    v15[v17] = v0 .. "_" .. v6[v17];
                end;
                return v15, v16;
            end
        };
    end
};
