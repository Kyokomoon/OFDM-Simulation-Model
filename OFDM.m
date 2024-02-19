str = "kulakov";
dis = sprintf("Изначальное сообщение: %s\n", str);
disp(dis);
bit = 7;
x = char(str);
massage = encode(x);
dis = sprintf("Битовая последовательность: \n");
disp(dis);
disp(massage);
massage_str = decode(massage, bit);
dis = sprintf("Декодированное сообщение: %s", massage_str);
disp(dis);
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
function massage_str = decode(x, bit)
        massage_str = char("");
        n = 1;
        for i=1:(length(x)/bit)
            mass = x(n:n+bit-1);
            st = sprintf("%d%d%d%d%d%d%d", mass(1),mass(2),mass(3),mass(4),mass(5),mass(6),mass(7));
            n = n + 7;
            switch st
                case "1000011"
                    massage_str(i) = "a";
                case "0110111"
                    massage_str(i) = 'v';
                case "1101011"
                    massage_str(i) = 'k';
                case "0011011"
                    massage_str(i) = 'l';
                case "1111011"
                    massage_str(i) = 'o';
                case "1010111"
                    massage_str(i) = 'u';
            end
        end    
end