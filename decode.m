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
