function massage = encode(x)
    s_k = [1,1,0,1,0,1,1];
    s_u = [1,0,1,0,1,1,1];
    s_l = [0,0,1,1,0,1,1];
    s_a = [1,0,0,0,0,1,1];
    s_o = [1,1,1,1,0,1,1];
    s_v = [0,1,1,0,1,1,1];
    massage = [];
    for i=1:length(x)
        switch x(i) 
            case 'a'
                massage = cat(2,massage,s_a);
            case 'v'
                massage = cat(2,massage,s_v);
            case 'k'
                massage = cat(2,massage,s_k);
            case 'l'
                massage = cat(2,massage,s_l);
            case 'o'
                massage = cat(2,massage,s_o);
            case 'u'
                massage = cat(2,massage,s_u);
        end
    end
end
