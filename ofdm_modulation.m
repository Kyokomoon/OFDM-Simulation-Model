function ofdm = ofdm_modulation(qpsk_sequence)
    pilot_interval = 4;
    message = qpsk_sequence;
    %Создание временного сигнала
    ofdm = zeros(1, length(qpsk_sequence) * 4);
    %Вставка сообщения в поднесущее
    i = length(qpsk_sequence);
        for j = 1:length(qpsk_sequence)
            if mod(j, pilot_interval) == 1
                ofdm(i) = 1; % Используем пилотное значение
            else
                ofdm(i) = message(j);
            end
            i = i + 1;
        end
    
    % Обратное преобразование
    ofdm = ifft(ofdm);
end