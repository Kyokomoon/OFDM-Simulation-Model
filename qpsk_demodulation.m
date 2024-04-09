function qpsk_desequence = qpsk_demodulation(symbols)
    % Определение таблицы демодуляции
    demodulation_table = [0 0;
        0 1;
        1 0;
        1 1];

    % Проверка на корректность длины символьной последовательности
    if rem(length(symbols), 1) ~= 0
        error('Длина символьной последовательности должна быть кратна 1.');
    end

    % Демодуляция QPSK символов в биты
    bits = zeros(1, length(symbols)*2);
    for i = 1:length(symbols)
        % Нахождение наименьшего расстояния между символом и таблицей
        distances = abs(symbols(i) - [0.707+0.707i; 0.707-0.707i; -0.707+0.707i; -0.707-0.707i]);
        [~, index] = min(distances);
        % Преобразование индекса в битовую последовательность
        bits(2*i-1:2*i) = demodulation_table(index, :);
    end
    qpsk_desequence = bits;
end