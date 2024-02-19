str = "kulakov";
dis = sprintf("Изначальное сообщение: %s\n", str);
disp(dis);
bit = 7;
x = char(str);
massage = encode(x);
dis = sprintf("Битовая последовательность: \n");
disp(dis);
disp(num2str(massage));
dis = sprintf("\nБитовая последовательность после шифрования: \n");
disp(dis);
conv_massage = conv_encode(massage);

disp(num2str(conv_massage));

ran_index = randperm(length(conv_massage));
dis = sprintf("\nВектор перемежения: \n");
disp(dis);
disp(num2str(ran_index));

interleave_massage = interleave(conv_massage, ran_index);
dis = sprintf("\nБитовая последовательность после перемежения: \n");
disp(dis);
disp(num2str(interleave_massage));

deinterleave_massage = deinterleave(interleave_massage, ran_index);
dis = sprintf("\nБитовая последовательность после деперемежения: \n");
disp(dis);
disp(num2str(deinterleave_massage));

dis = sprintf("\nБитовая последовательность после дешифрования: \n");
disp(dis);
conv_decode_massage = conv_decode(deinterleave_massage, bit);
disp(num2str(conv_decode_massage));
massage_str = decode(conv_decode_massage, bit);
dis = sprintf("\nДекодированное сообщение: %s", massage_str);
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

function encode_massage = conv_encode(x)
    encode_massage = [];
    polinom = zeros(1,7);
    for i=1:(length(x))
        polinom = circshift(polinom,1);
        polinom(1)=x(i);
        out_x = xor(xor(xor(xor(polinom(1), polinom(2)), polinom(3)), polinom(4)), polinom(7));
        out_y = xor(xor(xor(xor(polinom(1), polinom(3)), polinom(4)), polinom(6)), polinom(7));
        encode_massage = [encode_massage, out_x, out_y];
    end
end

function decode_massage = conv_decode(x, bit)
    trellis = poly2trellis(bit, [171 133]);
    decode_massage = vitdec(x, trellis, bit, 'trunc', 'hard');
end

function interleave_mass = interleave(x, ran_index)
    interleave_mass = zeros(1, length(x));
    for i = 1:length(x)
        interleave_mass(i) = x(ran_index(i));
    end

end

function deinterleave_mass = deinterleave(x, ran_index)
    for i = 1:length(x)
        deinterleave_mass(ran_index(i)) = x(i);
    end
end


